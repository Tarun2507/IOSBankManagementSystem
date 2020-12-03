//
//  Account.swift
//  NetBanking
//
//  Created by Tarun Reddy on 2020-11-29.
//

import Foundation
//Account class with attributes
class Account {
    var customer_id : Int
    var password : String
    var name : String
    var account_number : Int
    var account_type : String
    var balance : Double
    init(customer_id : Int,password:String,name : String,account_number : Int,account_type:String,balance:Double) {
        self.customer_id = customer_id
        self.password = password
        self.name = name;
        self.account_number = account_number
        self.account_type = account_type
        self.balance = balance
    }
    func fileFormat() ->String // formatting the data of Account such that it is separated by commas in file
        {
        // preparing line separated by commas
        let line = String(self.customer_id)+","+self.password+","+self.name+","+String(self.account_number)+","+self.account_type+","+String(self.balance)+"\n"
          return line
        }
}
