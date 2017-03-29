//
//  HTMDashboardController.swift
//  Teste_iOS
//
//  Created by André Luís  Campopiano on 29/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

class HTMDashboardController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private let cellIdentifieldRecentPosts = "cellRecentPosts"
    let cellIdentifieldSale = "cellSales"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "HTMRecentPostsCell", bundle: nil), forCellReuseIdentifier: cellIdentifieldRecentPosts)
        self.tableView.register(UINib(nibName: "HTMSalesCell", bundle: nil), forCellReuseIdentifier: cellIdentifieldSale)
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberRows = 1
        if section == 1 {
            numberRows = 20
        }
       return numberRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            let cellRecentPosts = tableView.dequeueReusableCell(withIdentifier: cellIdentifieldRecentPosts, for: indexPath) as! HTMRecentPostsCell
            
            cell = cellRecentPosts
        }else {
            let cellSale = tableView.dequeueReusableCell(withIdentifier: cellIdentifieldSale, for: indexPath) as! HTMSalesCell
            cellSale.contentView.backgroundColor = UIColor(red:0.29, green:0.51, blue:0.77, alpha:1.0)
            
            if indexPath.row % 2 == 0 {
                cellSale.viewContainer.backgroundColor = UIColor.white
            }else {
                 cellSale.viewContainer.backgroundColor = UIColor(white:0.96, alpha:1.0)
            }
            cell = cellSale
        }
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var heightRow:CGFloat = 201
        
        if indexPath.section == 1 {
            heightRow = 115
        }
        
        return heightRow
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
