//
//  TransactionCell.swift
//  NetBanking
//
//  Created by Tarun Reddy on 2020-11-29.
//

import UIKit

class TransactionCell: UITableViewCell {

  //Outlets
   
    @IBOutlet weak var transactionAmount: UITextField!
    
    @IBOutlet weak var transactionType: UITextField!
    //sets the table cell data
    func setUpCell(transaction:Transaction) {
        debugPrint(transaction)
        transactionType.text = transaction.name
        transactionAmount.text = String(transaction.amount)
    }
}
