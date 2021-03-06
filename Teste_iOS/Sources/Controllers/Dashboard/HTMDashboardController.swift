//
//  HTMDashboardController.swift
//  Teste_iOS
//
//  Created by André Luís  Campopiano on 29/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

class HTMDashboardController: GenericMenuViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblSalesValue: UILabel!
    
    var user = HTMUser()
    private var listSale = [HTMSale]()
    private var listFriends = [HTMFriend]()
    
    private let cellIdentifieldRecentPosts = "cellRecentPosts"
    let cellIdentifieldSale = "cellSales"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataBind()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "HTMRecentPostsCell", bundle: nil), forCellReuseIdentifier: cellIdentifieldRecentPosts)
        self.tableView.register(UINib(nibName: "HTMSalesCell", bundle: nil), forCellReuseIdentifier: cellIdentifieldSale)
    }
    
    func dataBind(){
        self.activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        HTMFirebaseConnect.sharedInstance.checkFirebaseConnect { (isConnect:Bool) in
            if isConnect {
                HTMSalesService.sharedInstance.recoveryFriendsAndSales { (sales:[HTMSale],friends:[HTMFriend],saldo:Double) in
                    self.lblSalesValue.text = saldo.currencyBR
                    self.listSale = sales
                    self.listFriends = friends
                    self.tableView.reloadData()
                }
                
            }else {
                self.alertMessage(errCodeDescription:"title_lost_connect")
            }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 1 ? self.listSale.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            if self.listFriends.count > 0 {
                let cellRecentPosts = tableView.dequeueReusableCell(withIdentifier: cellIdentifieldRecentPosts, for: indexPath) as! HTMRecentPostsCell
                cellRecentPosts.listFriends = self.listFriends
                cell = cellRecentPosts
            }
        }else { if listSale.count != 0 { cell = setCellSale(indexPath: indexPath) } }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !self.listSale.isEmpty {
            if indexPath.section == 1{
                let cellSale = cell as! HTMSalesCell
                if indexPath.row % 2 != 0 { cellSale.viewContainer.backgroundColor = UIColor.white }
                else { cellSale.viewContainer.backgroundColor = UIColor(white:0.96, alpha:1.0) }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var heightRow:CGFloat = 201
        if indexPath.section == 1 { heightRow = 115 }
        return heightRow
    }
    
    func setCellSale(indexPath:IndexPath)->HTMSalesCell{
        let cellSale = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifieldSale, for: indexPath) as! HTMSalesCell
        let sale:HTMSale = listSale[indexPath.row]
        cellSale.lblDescricao.text = sale.descricao
        cellSale.lblId.text = sale.id!.stringValue
        cellSale.lblPrice.text = Double(sale.price!).currencyBR
        cellSale.lblDateSale.text = sale.date_sale
        cellSale.alertIcon.isHidden = !sale.alert!.boolValue
        cellSale.contentView.backgroundColor = UIColor(red:0.29, green:0.51, blue:0.77, alpha:1.0)
        return cellSale
    }
}
