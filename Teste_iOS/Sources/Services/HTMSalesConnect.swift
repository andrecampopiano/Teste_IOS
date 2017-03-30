//
//  HTMSalesConnect.swift
//  Teste_iOS
//
//  Created by André Campopiano on 29/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit
import Firebase

class HTMSalesConnect: NSObject {
    
    static let sharedInstance = HTMSalesConnect()
    
    func getListSales(completion: @escaping (Array<HTMSale>)->()){
        FIRDatabase.database().reference().child("sales").observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            let dic = snapshot.value as? Dictionary<String,AnyObject>
            
            
            let listSales = NSMutableArray()
            for item in dic! as Dictionary<String,AnyObject>{
                let sale = HTMSale()
                sale.descricao = item.value.value(forKey:"descricao") as! String
                sale.id = item.value.value(forKey:"id") as! NSNumber
                sale.date_sale = item.value.value(forKey:"data_sale") as! String
                sale.price = item.value.value(forKey:"price") as! Double
                sale.alert = item.value.value(forKey:"alert") as! Bool
                listSales.add(sale)
            }
            
            
            completion((listSales as NSArray) as! Array<HTMSale>)
        
            
        })
    }
    
}
