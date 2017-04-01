//
//  HTMRecentPostsCell.swift
//  Teste_iOS
//
//  Created by André Luís  Campopiano on 29/03/17.
//  Copyright © 2017 André Campopiano. All rights reserved.
//

import UIKit

class HTMRecentPostsCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var listUsers = [HTMUser]()
    
    @IBOutlet weak var lblNumberMessages: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellPosts = "cellPosts"
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "HTMPostCell", bundle: nil), forCellWithReuseIdentifier: cellPosts)
        self.lblNumberMessages.text = "+15"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return setHtmPostCell(indexPath: indexPath)
    }
    
    func setHtmPostCell(indexPath:IndexPath)->HTMPostCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellPosts, for: indexPath) as! HTMPostCell
        let user = self.listUsers[indexPath.row]
        cell.lblUserName.text = user.name
        if user.urlProfileImage != "" {
            cell.imageUser.loadImageUsingUrlString(user.urlProfileImage)
        }else {
            cell.imageUser.setImageForName(string: user.name, backgroundColor: nil, circular: true, textAttributes: [NSFontAttributeName : UIFont(name:"HelveticaNeue-Bold", size: 45)!, NSForegroundColorAttributeName: UIColor.white])
        }
        return cell
    }
    
}
