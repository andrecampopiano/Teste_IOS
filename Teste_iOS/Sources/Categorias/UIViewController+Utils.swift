//
//  UIViewController+Utils.swift
//  Teste_iOS
//
//  Created by André Campopiano on 02/04/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import Foundation

extension UIViewController {
    
    
    func alertMessage(errCodeDescription:String){
        
        let alert = UIAlertController(title: NSLocalizedString("title_attention", comment: ""), message: NSLocalizedString(errCodeDescription, comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        let confirmAction = UIAlertAction(title: "Confirmar", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(confirmAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
