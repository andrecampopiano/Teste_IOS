//
//  BackTableVC.swift
//  SliderMenuEstudo
//
//  Created by André Luís  Campopiano on 30/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import Foundation

class MenuController : UITableViewController {
    
    @IBOutlet weak var imgBackgroudProfile: UIImageView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblNumberAffiliates: UILabel!
    @IBOutlet weak var lblNumberMessages: UILabel!
    @IBOutlet weak var lblNumberNotifications: UILabel!
    
    let segueDashboard = "segueDashboard"
    let segueVendas = "segueVendas"
    let segueMensagens = "segueMensagens"
    let segueAccount = "segueAccount"
    
    override func viewDidLoad() {
        self.imageProfile.image = #imageLiteral(resourceName: "img_profile")
        self.imgBackgroudProfile.image = #imageLiteral(resourceName: "img_profile")
        self.lblName.text = "JAMES JB"
        self.lblEmail.text = "andre.campopiano@icloud.com"
        self.lblNumberAffiliates.text = "255"
        self.lblNumberMessages.text = "+100"
        self.lblNumberNotifications.text = "32"
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
