//
//  HTMSalesController.swift
//  Teste_iOS
//
//  Created by André Campopiano on 28/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

class HTMSalesController: UITableViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnMenu: UIBarButtonItem!

    var listSale = Array<HTMSale>()
    
    let cellIdentifieldSale = "cellSales"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContent()
        setMenuButton()
        tableView.register(UINib(nibName: "HTMSalesCell", bundle: nil), forCellReuseIdentifier: cellIdentifieldSale)
    }
    
    func setContent(){
        self.activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        HTMSalesService.sharedInstance.recoveryListSales { (sales:Array<HTMSale>,saldo:Double) in
            self.listSale = sales
            DispatchQueue.main.async {
                self.tableView.reloadData()
                UIApplication.shared.endIgnoringInteractionEvents()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }
    }
    
    func setMenuButton(){
        btnMenu.target = self.revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listSale.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if listSale.count > 0 {
            cell = setCellSale(indexPath: indexPath)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = UIColor.white
        }
    }
    
    func setCellSale(indexPath:IndexPath)->HTMSalesCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifieldSale, for: indexPath) as! HTMSalesCell
        let sale = self.listSale[indexPath.row]
        
        if let id = sale.id?.stringValue{
            cell.lblId.text = id
        }
        cell.lblPrice.text = Double(sale.price!).currencyBR
        cell.lblDescricao.text = sale.descricao
        cell.lblDateSale.text = sale.date_sale
        if let bool = sale.alert?.boolValue {
            cell.alertIcon.isHidden = !bool
        }
        return cell
    }
}
