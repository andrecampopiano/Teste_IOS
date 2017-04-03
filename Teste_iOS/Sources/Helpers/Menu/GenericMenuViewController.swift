//
//  SuperViewController.swift
//  SliderMenuEstudo
//
//  Created by André Luís  Campopiano on 30/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import Foundation

class GenericMenuViewController : UIViewController {
    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnMenu()
        
    }
    
    func setBtnMenu(){
        btnMenu.target = self.revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    
}
