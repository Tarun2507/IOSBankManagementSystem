//
//  TransactionSummaryViewController.swift
//  NetBanking
//
//  Created by Tarun Reddy on 2020-11-29.
//

import UIKit

class TransactionSummaryViewController: UIViewController {
    var transactions = [Transaction]()
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var transactionTypeTextField: UITextField!
    var transactionType : String = ""
    var amount : Double = 0.0
    var userdefaults : (UserDefaults)? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.text = String(amount)
        transactionTypeTextField.text = transactionType
    }
    // ppreparing the segue to TransactionListController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tlc  = segue.destination as? TransactionListController
        tlc?.transactions = transactions

    }
    // performing the segue to TransactionListController
    @IBAction func getTransactions(_ sender: Any) {
        performSegue(withIdentifier: "transactionList", sender: self)
    }
    
}
