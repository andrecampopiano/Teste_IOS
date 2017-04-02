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
    @IBOutlet weak var txtSobrenome: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtCpf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
