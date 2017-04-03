//
//  HTMPostsController.swift
//  Teste_iOS
//
//  Created by André Luís  Campopiano on 29/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit



class HTMPostsController: GenericMenuViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var lblNumberPosts: UILabel!
    var listFriends = [HTMFriend]()
    private let cellPosts = "cellPosts"
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblNumberPosts.text = "+20"
        self.automaticallyAdjustsScrollViewInsets = false
        self.collectionView.register(UINib(nibName: "HTMPostCell", bundle: nil), forCellWithReuseIdentifier: cellPosts)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        setContent()
    }
    
    func setContent(){
        HTMPostsService.sharedInstance.recoveryPostsFriends { (friends:[HTMFriend]) in
            self.listFriends = friends
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
        return self.listFriends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellPosts, for: indexPath) as! HTMPostCell
        if listFriends.count != 0 {
            let user = self.listFriends[indexPath.row]
            if let imageUrl = user.urlProfileImage{
                if imageUrl != "" {
                    cell.imageUser.loadImageUsingUrlString(imageUrl)
                }else{
                    cell.imageUser.setImageForName(string: user.name, backgroundColor: nil, circular: true, textAttributes: [NSFontAttributeName : UIFont(name:"HelveticaNeue-Bold", size: 45)!, NSForegroundColorAttributeName: UIColor.white])
                }
            }
            cell.lblUserName.text = user.name
        }
        return cell
    }
}
