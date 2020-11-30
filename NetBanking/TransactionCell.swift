//
//  TransactionCell.swift
//  NetBanking
//
//  Created by Tarun Reddy on 2020-11-29.
//

import UIKit

class TransactionCell: UITableViewCell {

  
   
    @IBOutlet weak var transactionAmount: UITextField!
    
    @IBOutlet weak var transactionType: UITextField!
    func setUpCell(transaction:Transaction) {
        debugPrint(transaction)
        transactionType.text = transaction.name
        transactionAmount.text = String(transaction.amount)
    }
}
