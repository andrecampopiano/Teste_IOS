//
//  HTMSalesConnect.swift
//  Teste_iOS
//
//  Created by André Campopiano on 29/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit
import Firebase

class HTMSalesService: NSObject {
    
    static let sharedInstance = HTMSalesService()
    
    func getListSales(completion: @escaping ([HTMSale], Double)->()){
        var listSales =  [HTMSale]()
        var somaVendas:Double = 0
        FIRDatabase.database().reference().child("sales").observeSingleEvent(of: .value, with: { (snapshot) in
            let dic = snapshot.value as? [String:AnyObject]
            for item in dic! {
                let sale = HTMSale()
                sale.setValuesForKeys(item.value as! [String : AnyObject])
                if let valor = sale.price {
                    somaVendas += Double(valor)
                }
                listSales.append(sale)
            }
            completion(listSales, somaVendas)
        })
    }
}
