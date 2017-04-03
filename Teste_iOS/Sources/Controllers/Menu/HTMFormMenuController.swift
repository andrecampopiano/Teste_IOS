//
//  HTMFormMenuController.swift
//  Teste_iOS
//
//  Created by André Luís  Campopiano on 03/04/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

class HTMFormMenuController: UITableViewController {

    let segueDashboard = "segueDashboard"
    let segueVendas = "segueVendas"
    let segueMensagens = "segueMensagens"

    @IBOutlet var lblAffiliates: UILabel!
    @IBOutlet weak var lblPosts: UILabel!
    @IBOutlet weak var lblNotifications: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblAffiliates.text = "130"
        self.lblPosts.text = "+100"
        self.lblNotifications.text = "30"
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
