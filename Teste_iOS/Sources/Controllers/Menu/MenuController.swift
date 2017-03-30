//
//  BackTableVC.swift
//  SliderMenuEstudo
//
//  Created by André Luís  Campopiano on 30/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import Foundation

class MenuController : UITableViewController {
    
    let segueDashboard = "segueDashboard"
    let segueVendas = "segueVendas"
    let segueMensagens = "segueMensagens"
    override func viewDidLoad() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueDashboard {
            let vc = segue.destination as! UITabBarController
            vc.selectedIndex = 0
        }
        if segue.identifier == segueVendas {
            let vc = segue.destination as! UITabBarController
            vc.selectedIndex = 1
        }
        if segue.identifier == segueMensagens {
            let vc = segue.destination as! UITabBarController
            vc.selectedIndex = 2
        }
    }
   
}
