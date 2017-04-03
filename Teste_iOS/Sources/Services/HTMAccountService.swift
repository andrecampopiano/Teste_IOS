//
//  HTMAccountService.swift
//  Teste_iOS
//
//  Created by André Campopiano on 02/04/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit
import Firebase

class HTMAccountService: NSObject {
    
    static let sharedInstance = HTMAccountService()
    
    func registerFirabaseWithEmail(email:String, password:String, completion:@escaping ( NSError?)->()){
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (firUser, error) in
            if let err  = error{
                return completion(err as NSError?)
            }
            completion(nil)
        })
    }
    
    func updateAccount(username:String, email:String, password:String, imgProfile:UIImage, completion:@escaping(HTMUser?, NSError?)->()){
        
        uploadImage(image: imgProfile, folderName: "profile_images") { (urlProfileImage, error) in
            if let err = error {
                return completion(nil,err as NSError)
            }
            guard let userId = FIRAuth.auth()?.currentUser?.uid else { return }
            let dicitionaryValues = ["email":email, "userName":username, "password":password ,"urlProfileImage":urlProfileImage]
            let values = [userId:dicitionaryValues]
            FIRDatabase.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (error, reference) in
                if let err = error {
                    print(err.localizedDescription)
                    return completion(nil,err as NSError)
                }
                let user = HTMUser()
                user.userName = username
                user.email = email
                user.password = password
                user.urlProfileImage = urlProfileImage
               
                UserDefaults.standard.set(user, forKey: "user")
                let result = UserDefaults.standard.value(forKey: "user")
                print(result!)
                completion(user,nil)
            })
        }
    }
    
    func uploadImage(image:UIImage, folderName:String, completion:@escaping(String?,Error?)->()){
        
        guard let imageUploadData = UIImageJPEGRepresentation(image, 0.3) else { return }
        
        let filename = NSUUID().uuidString
        FIRStorage.storage().reference().child("profile_images").child(filename).put(imageUploadData, metadata: nil) { (metadata, error) in
            if let err = error {
                print(err.localizedDescription)
                return completion(nil,err)
            }
            guard let profileImageUrl = metadata?.downloadURL()?.absoluteString else { return }
            completion(profileImageUrl,nil)
        }
    }
    
    func recoverUser(completion:@escaping(HTMUser?)->()){
        guard let userID = FIRAuth.auth()?.currentUser?.uid else { return }
        FIRDatabase.database().reference().child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            let user = HTMUser()
            user.setValuesForKeys(snapshot.value as! [String: Any])
            completion(user)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
