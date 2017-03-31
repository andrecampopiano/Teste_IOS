//
//  NSStringExtension.swift
//  Teste_iOS
//
//  Created by André Luís  Campopiano on 31/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

extension String {
    
    func getFormattedValueNumber(value:Double)->(String){
        let valueFormated = self.numberFormatter(value: value, positiveFormat: "R$ #.##0.00", negativeFormat: "R$ -#.##0.00")
        return valueFormated
    }
    func numberFormatter(value:Double, positiveFormat:String , negativeFormat:String)->(String){
        let formatter = NumberFormatter()
        formatter.positiveFormat = positiveFormat
        formatter.negativeFormat = negativeFormat
        formatter.locale = Locale(identifier: "pt-BR")
        return formatter.string(from: NSNumber(value: value))!
    }
}

extension NumberFormatter {
    convenience init(style: Style) {
        self.init()
        numberStyle = style
    }
}

extension Formatter {
    static let currency = NumberFormatter(style: .currency)
    static let currencyUS: NumberFormatter = {
        let formatter = NumberFormatter(style: .currency)
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    static let currencyBR: NumberFormatter = {
        let formatter = NumberFormatter(style: .currency)
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
}


extension FloatingPoint {
    var currency: String {
        return Formatter.currency.string(for: self) ?? ""
    }
    var currencyUS: String {
        return Formatter.currencyUS.string(for: self) ?? ""
    }
    var currencyBR: String {
        return Formatter.currencyBR.string(for: self) ?? ""
    }
    
}
