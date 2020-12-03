//
//  Transaction.swift
//  NetBanking
//
//  Created by Tarun Reddy on 2020-11-29.
//

import Foundation
class Transaction: NSObject, NSCoding {
    //Encoder method
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(amount,forKey: "amount")
    }
    //Decoder method
    required init?(coder aDecoder: NSCoder) {
        self.amount = aDecoder.decodeDouble(forKey: "amount")
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
    }
    
    
    var name : String
    var amount : Double
    
    init(name:String,amount:Double) {
        self.name = name
        self.amount = amount
    }
  
}
