//
//  HTMPostsController.swift
//  Teste_iOS
//
//  Created by André Luís  Campopiano on 29/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

private let cellPosts = "cellPosts"

class HTMPostsController: GenericMenuViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var listUsers = [HTMUser]()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.collectionView.register(UINib(nibName: "HTMPostCell", bundle: nil), forCellWithReuseIdentifier: cellPosts)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        setContent()
    }
    
    func setContent(){
        HTMPostsService.sharedInstance.recoveryPostsUsers { (users:[HTMUser]) in
            self.listUsers = users
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
        
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.listUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellPosts, for: indexPath) as! HTMPostCell
        
        if listUsers.count != 0 {
            let user = self.listUsers[indexPath.row]
            if let imageUrl = user.urlProfileImage{
                if imageUrl != "" {
                    cell.imageUser.loadImageUsingUrlString(imageUrl)
                }else{
                    cell.imageUser.setImageForName(string: user.name, backgroundColor: nil, circular: true, textAttributes: nil)
                }
                
            }
            cell.lblUserName.text = user.name
            
        }
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
