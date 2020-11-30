//
//  ViewController.swift
//  NetBanking
//
//  Created by Tarun Reddy on 2020-11-29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customerId: UITextField!
    @IBOutlet weak var password: UITextField!
    var accounts = [Account]()
    var currentAccount : Account? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tvc = segue.destination as? TransactionViewController
        tvc!.accounts = self.accounts
        tvc!.activeAccount = self.currentAccount!
               //pass values from self to the other v
    }
    @IBAction func login(_ sender: Any) {
        let customer_id = Int(customerId.text!)
        let pwd = password.text
        for account in accounts {
            if account.customer_id == customer_id && account.password == pwd {
                currentAccount = account
                performSegue(withIdentifier: "transaction", sender: self)
               debugPrint("valid")
            }
        }
    }
    func fillData() {
        guard let resourceString = Bundle.main.resourcePath,
            let fileURL = URL(string: "file://\(resourceString)/netbanking_data")
        else {

            print(">>> url fail")
            return
        }

        do {
         // Get the saved data
         let savedData = try Data(contentsOf: fileURL)
         // Convert the data back into a string
            if String(data: savedData, encoding: .utf8) != nil {
            //print(savedString)
            let data = String(decoding: savedData, as: UTF8.self)
            let lines = data.split(whereSeparator: \.isNewline)
            for line in lines{
                //split each line into words which are fields
                let fields = line.components(separatedBy: ",")
                let account = Account(customer_id: Int(fields[0])!, password: fields[1],name: fields[2],account_number: Int(fields[3])!, account_type: fields[4], balance: Double(fields[5])!)
                accounts.append(account) // appending to heterogeneous collection of accounts
                //print(accounts[0].account_number)
            }
         }
        } catch {
         // Catch any errors
         print("Unable to read the file")
        }
       // debugPrint(accounts)
    }
}

