//
//  Transaction.swift
//  NetBanking
//
//  Created by Tarun Reddy on 2020-11-29.
//

import Foundation
class Transaction:NSObject, NSCoding{
    func encode(with aCoder: NSCoder)
     {
         aCoder.encode(self.name, forKey: "name")
         aCoder.encode(self.amount, forKey: "amount")
     }
     
     required init?(coder aDecoder: NSCoder)
     {
      
        self.name = (aDecoder.decodeObject(forKey: "name") as? String)!
        self.amount = (aDecoder.decodeObject(forKey: "amount") as? Double)!
        debugPrint(self.amount)
     }
    
    var name : String
    var amount : Double
    
    init(name:String,amount:Double) {
        self.name = name
        self.amount = amount
    }
    init(json: [String: Any])
     {
        self.name = (json["name"] as? String)!
        self.amount = (json["amount"] as? Double)!
     }
}
