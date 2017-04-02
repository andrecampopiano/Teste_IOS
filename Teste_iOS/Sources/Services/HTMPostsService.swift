//
//  HTMPostsService.swift
//  Teste_iOS
//
//  Created by André Campopiano on 31/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit
import Firebase

class HTMPostsService: NSObject {
    static let sharedInstance = HTMPostsService()
    func recoveryPostsUsers(completion: @escaping ([HTMUser])->()){
        var listUsers = [HTMUser]()
        FIRDatabase.database().reference().child("users").observeSingleEvent(of: .value, with: { (snapshot) in
            let dic = snapshot.value as? [String : AnyObject]
            for item in dic! {
                let user = HTMUser()
                user.setValuesForKeys(item.value as! [String : AnyObject])
                listUsers.append(user)
            }
            listUsers.sort { $0.name < $1.name }
            completion(listUsers)
        })
    }
}
