//
//  HTMSalesCell.swift
//  Teste_iOS
//
//  Created by André Campopiano on 28/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

class HTMSalesCell: UITableViewCell {

    @IBOutlet weak var lblDescricao: UILabel!
    
    @IBOutlet weak var alertIcon: UIImageView!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblDateSale: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var lblPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
