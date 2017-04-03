//
//  InitialsImageView.swift
//
//
//  Created by Tom Bachant on 1/28/17.
//
//

import UIKit

let kFontResizingProportion: CGFloat = 0.4
let kColorMinComponent: Int = 30
let kColorMaxComponent: Int = 214

extension UIImageView {
    
    public func setImageForName(string: String, backgroundColor: UIColor?, circular: Bool, textAttributes: [String: AnyObject]?) {
        
        let initials: String = initialsFromString(string: string)
        let color: UIColor = (backgroundColor != nil) ? backgroundColor! : randomColor()
        let attributes: [String: AnyObject] = (textAttributes != nil) ? textAttributes! : [
            NSFontAttributeName: self.fontForFontName(name: nil),
            NSForegroundColorAttributeName: UIColor.white
        ]
        
        self.image = imageSnapshot(text: initials, backgroundColor: color, circular: circular, textAttributes: attributes)
    }
    
    private func fontForFontName(name: String?) -> UIFont {
        
        let fontSize = self.bounds.width * kFontResizingProportion;
        if name != nil {
            return UIFont(name: name!, size: fontSize)!
        }
        else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        
    }
    
    private func imageSnapshot(text imageText: String, backgroundColor: UIColor, circular: Bool, textAttributes: [String : AnyObject]) -> UIImage {
        
        let scale: CGFloat = UIScreen.main.scale
        
        var size: CGSize = self.bounds.size
        if (self.contentMode == .scaleToFill ||
            self.contentMode == .scaleAspectFill ||
            self.contentMode == .scaleAspectFit ||
            self.contentMode == .redraw) {
            
            size.width = (size.width * scale) / scale
            size.height = (size.height * scale) / scale
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        if circular {
            // Clip context to a circle
            let path: CGPath = CGPath(ellipseIn: self.bounds, transform: nil)
            context.addPath(path)
            context.clip()
        }
        
        // Fill background of context
        context.setFillColor(backgroundColor.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        // Draw text in the context
        let textSize: CGSize = imageText.size(attributes: textAttributes)
        let bounds: CGRect = self.bounds
        
        imageText.draw(in: CGRect(x: bounds.midX - textSize.width / 2,
                                  y: bounds.midY - textSize.height / 2,
                                  width: textSize.width,
                                  height: textSize.height),
                       withAttributes: textAttributes)
        
        let snapshot: UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        
        return snapshot;
    }
}

private func initialsFromString(string: String) -> String {
    
    var displayString: String = ""
    let words: [String] = string.components(separatedBy: .whitespacesAndNewlines)
    
    // Get first letter of the first and last word
    if words.count > 0 {
        let firstWord: String = words.first!
        if firstWord.characters.count > 0 {
            // Get character range to handle emoji (emojis consist of 2 characters in sequence)
            let range: Range<String.Index> = firstWord.startIndex..<firstWord.index(firstWord.startIndex, offsetBy: 1)
            let firstLetterRange: Range = firstWord.rangeOfComposedCharacterSequences(for: range)
            
            displayString.append(firstWord.substring(with: firstLetterRange).uppercased())
        }
        
        /* Utilizando para pegar a primeira letra do segundo nome,comentado para seguir o padrao do layout proposto na prova
         if words.count >= 2 {
         var lastWord: String = words.last!
         
         while lastWord.characters.count == 0 && words.count >= 2 {
         words.removeLast()
         lastWord = words.last!
         }
         
         if words.count > 1 {
         // Get character range to handle emoji (emojis consist of 2 characters in sequence)
         let range: Range<String.Index> = lastWord.startIndex..<lastWord.index(lastWord.startIndex, offsetBy: 1)
         let lastLetterRange: Range = lastWord.rangeOfComposedCharacterSequences(for: range)
         
         displayString.append(lastWord.substring(with: lastLetterRange).uppercased())
         }
         }
         */
    }
    
    return displayString
}

private func randomColorComponent() -> Int {
    let limit = kColorMaxComponent - kColorMinComponent
    
    return kColorMinComponent + Int(arc4random_uniform(UInt32(limit)))
}
private func colorPalette()->UIColor{
    
    let laranja = UIColor(red:0.91, green:0.68, blue:0.27, alpha:1.0)
    let vermelho = UIColor(red:0.82, green:0.31, blue:0.16, alpha:1.0)
    let roxo = UIColor(red:0.37, green:0.29, blue:0.55, alpha:1.0)
    let verde = UIColor(red:0.64, green:0.78, blue:0.29, alpha:1.0)
    let vermelho_claro = UIColor(red:0.81, green:0.26, blue:0.32, alpha:1.0)
    let azul = UIColor(red:0.29, green:0.51, blue:0.77, alpha:1.0)
    
    let arrayColor = [laranja,vermelho,roxo,verde,vermelho_claro,azul]
    let random = Int(arc4random_uniform(6))
    return arrayColor[random]
    
}

private func randomColor() -> UIColor {
    //Alterado para usar somente as cores sugeridas na palheta da prova
    //let red = CGFloat(randomColorComponent()) / 255.0
    //let green = CGFloat(randomColorComponent()) / 255.0
    //let blue = CGFloat(randomColorComponent()) / 255.0
    //return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    
    return colorPalette()
}
