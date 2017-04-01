//
//  HTMTabBar.swift
//  Teste_iOS
//
//  Created by André Luís  Campopiano on 31/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

class HTMTabBar: UITabBar {


    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let sizeThatFits = super.sizeThatFits(size)
        
        return CGSize(width: sizeThatFits.width, height: 68)
    }
}
