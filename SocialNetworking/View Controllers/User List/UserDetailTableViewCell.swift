//
//  UserDetailTableViewCell.swift
//  SocialNetworking
//
//  Created by Yuzhu Yang on 11/20/18.
//  Copyright © 2018 Yuzhu Yang. All rights reserved.
//

import UIKit
import Firebase
import TWMessageBarManager
import FirebaseDatabase
import FirebaseStorage

class UserDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userImg: UIImageView!
    
    @IBOutlet weak var textviewUserDetails: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
