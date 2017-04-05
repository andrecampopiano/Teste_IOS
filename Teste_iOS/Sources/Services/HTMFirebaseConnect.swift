//
//  HTMFirebaseConnect.swift
//  Teste_iOS
//
//  Created by André Campopiano on 04/04/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit
import Firebase

class HTMFirebaseConnect: NSObject {

    static let sharedInstance = HTMFirebaseConnect()
    func checkFirebaseConnect(completion:@escaping(Bool)->()) {
        let connectedRef = FIRDatabase.database().reference(withPath: ".info/connected")
        connectedRef.observe(.value, with: { (connected) in
            if let boolean = connected.value as? Bool, boolean == true {
                print("connected")
                return completion(true)
                
            } else {
                print("disconnected")
                return completion (false)
            }
        })
        
    }
    
}
