//
//  String+Utils.swift
//  Teste_iOS
//
//  Created by André Campopiano on 02/04/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

extension String {
    func trim()->String{
        return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
}
