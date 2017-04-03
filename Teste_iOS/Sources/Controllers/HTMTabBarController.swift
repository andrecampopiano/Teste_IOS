//
//  HTMTabBarController.swift
//  Teste_iOS
//
//  Created by André Luís  Campopiano on 31/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit
import Firebase
class HTMTabBarController: UITabBarController {
    
    var user = HTMUser()
    let segueDashboard = "segueDashboard"
    override func viewDidLoad() {
        super.viewDidLoad()
        /* do {
         try FIRAuth.auth()?.signOut()
         }catch let err as NSError{
         self.alertMessage(errCodeDescription: err.description)
         }
         
         */
        setupTabBarSeparators()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTabBarSeparators() {
        let itemWidth = floor(self.tabBar.frame.size.width / CGFloat(self.tabBar.items!.count))
        let separatorWidth: CGFloat = 0.5
        for i in 0...(self.tabBar.items!.count - 1) {
            let heightSeparator = self.tabBar.frame.size.height / 2
            
            let separator = UIView(frame: CGRect(x: itemWidth * CGFloat(i + 1) - CGFloat(separatorWidth / 2), y: heightSeparator / 2 , width: CGFloat(separatorWidth), height: heightSeparator))
            separator.backgroundColor = UIColor.black
            self.tabBar.addSubview(separator)
        }
    }
}
