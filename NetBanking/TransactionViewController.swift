//
//  TransactionViewController.swift
//  NetBanking
//
//  Created by Tarun Reddy on 2020-11-29.
//

import UIKit

class TransactionViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var transactionType = ""
    var decodedTransactionArray = [Transaction]()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return transactions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return transactions[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
        transactionType = "Deposit"
        }
        else if row == 1 {
        transactionType = "Withdraw"
        }
        else if row == 2 {
            transactionType = "payutility"
        }
        else if row == 3 {
            transactionType = "payCreditCardBill"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tsv = segue.destination as? TransactionSummaryViewController
        tsv?.transactionType = transactionType
        tsv?.amount = Double(amountText.text!)!
        tsv?.transactions = transactionList
    }
    @IBOutlet weak var transactionsDropDown: UIPickerView!
    @IBOutlet weak var accountType: UITextField!
    @IBOutlet weak var amountText: UITextField!
    var accounts = [Account]()
    var activeAccount : Account? = nil
    var transactions = ["Deposit","Withdraw","payutility","payCreditCardBill"]
    var transactionList = [Transaction]()
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionsDropDown.dataSource = self
        transactionsDropDown.delegate = self
    }
    
    @IBAction func Proceed(_ sender: Any) {
        transactionList.append(Transaction(name: transactionType, amount: Double(amountText.text!)!))
        if transactionType == "Deposit"
        {
            depositMoney()
        }
        else if transactionType == "Withdraw" {
            withDrawMoney()
        }
        else if transactionType == "payutility" {
            payUtilityBill()
        }
        else if transactionType == "payCreditCardBill" {
           payCreditCardBill()
        }
        performSegue(withIdentifier: "transaction", sender: self)
    }
    
    func depositMoney() {
        for account in accounts {
            if account.customer_id==activeAccount?.customer_id && account.account_type == accountType.text {
                account.balance = account.balance + Double(amountText.text!)!
                break;
            }
        }
        saveData()
    }
    func withDrawMoney() {
        for account in accounts {
            if account.customer_id==activeAccount?.customer_id && account.account_type == accountType.text  {
                account.balance = account.balance - Double(amountText.text!)!
                break;
            }
        }
        let defaults = UserDefaults.standard
        if let stringOne = defaults.string(forKey: "transactionData") {
            print(stringOne) // Some String Val
        }
        saveData()
    }
    func payUtilityBill() {
        for account in accounts {
            if account.customer_id==activeAccount?.customer_id && account.account_type == accountType.text {
                account.balance = account.balance - Double(amountText.text!)!
                break;
            }
        }
        saveData()
    }
    func payCreditCardBill() {
        for account in accounts   {
            if account.customer_id==activeAccount?.customer_id && account.account_type == accountType.text {
                account.balance = account.balance - Double(amountText.text!)!
                break;
            }
        }
        saveData()
    }
    func saveData() {
        guard let resourceString = Bundle.main.resourcePath,
            let fileURL = URL(string: "file://\(resourceString)/netbanking_data")
        else {

            print(">>> url fail")
            return
        }
        var myString:String = ""
           for acc in accounts{ // iterating accounts
            myString += acc.fileFormat()
           }
           let data = myString.data(using: .utf8)
           do {
               //write the data into the file
               try data?.write(to: fileURL)
            print("Data has been successfully saved: \(fileURL.absoluteURL)")
           } catch {
            // Catch any errors
            print(error.localizedDescription)
           }
    }
}
