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
    func recoveryPostsFriends(completion: @escaping ([HTMFriend])->()){
        var listFriends = [HTMFriend]()
        FIRDatabase.database().reference().child("friends").observeSingleEvent(of: .value, with: { (snapshot) in
            let dic = snapshot.value as? [String : AnyObject]
            for item in dic! {
                let friend = HTMFriend()
                friend.setValuesForKeys(item.value as! [String : AnyObject])
                listFriends.append(friend)
            }
            listFriends.sort { $0.name < $1.name }
            completion(listFriends)
        })
    }
}
