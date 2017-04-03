//
//  HTMMenuController.swift
//  Teste_iOS
//
//  Created by André Luís  Campopiano on 30/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import Foundation

class HTMMenuController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgBackgroudProfile: UIImageView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    var user = HTMUser()
    
    override func viewDidLoad() {
        setContent()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
    
    func setContent(){
        self.imageProfile.image = #imageLiteral(resourceName: "img_profile")
        self.imgBackgroudProfile.image = #imageLiteral(resourceName: "img_profile")
        self.lblName.text = "JAMES JB"
        self.lblEmail.text = "james_bond@icloud.com"
    }
}
