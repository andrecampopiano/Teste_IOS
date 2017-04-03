//
//  HTMMyAccountController.swift
//  Teste_iOS
//
//  Created by André Campopiano on 01/04/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

class HTMMyAccountController: GenericMenuViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var btnChangeImgProfile: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func changeImgAction(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            imgProfile.image = editedImage.withRenderingMode(.alwaysOriginal)
        }else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            imgProfile.image = originalImage.withRenderingMode(.alwaysOriginal)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateAccount(_ sender: Any) {
        guard let email = txtEmail.text?.trim(), email.characters.count > 0 else { return }
        guard let name = txtName.text?.trim(), name.characters.count > 0 else { return }
        guard let password = txtPassword.text?.trim(), password.characters.count > 0 , txtPassword.text! == txtConfirmPassword.text!  else { return }
        guard let image = imgProfile.image else { return }

        let accountService = HTMAccountService.sharedInstance
        accountService.registerFirabaseWithEmail(email: email, password: password) { (error) in
            if  let err = error{
                return self.alertMessage(errCodeDescription: err.code.description)
            }
            accountService.updateAccount(username: name, email: email, password: password, imgProfile: image, completion: { (user,error) in
                if let err = error {
                    return self.alertMessage(errCodeDescription: err.code.description)
                }
                
            })
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
