//
//  TransactionListController.swift
//  NetBanking
//
//  Created by Tarun Reddy on 2020-11-29.
//

import UIKit

class TransactionListController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //transactions arrayß
    var transactions = [Transaction]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    //implementing the tableview protocols
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //returns tableview cell
        let transaction = transactions[indexPath.row]
        let cell = transactionTable.dequeueReusableCell(withIdentifier: "transactioncell") as? TransactionCell
        cell?.setUpCell(transaction: transaction)
        return cell!
    }
    //Outlets

    @IBOutlet weak var transactionTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionTable.delegate = self
        transactionTable.dataSource = self
    }
    

 

}
