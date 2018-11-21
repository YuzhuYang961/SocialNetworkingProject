//
//  HomePageViewController.swift
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

class HomePageViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserInfor()
    }
    
    func setUpUserInfor() {
        if Auth.auth().currentUser?.uid == nil {
            print("I am unhappy")
        }else{
            let id = Auth.auth().currentUser?.uid
            Database.database().reference().child(id!).observeSingleEvent(of: .value) { (snapshot) in
                if let infor = snapshot.value as? [String : Any]{
                    self.navigationItem.title = infor["Name"] as? String
                    
//                    let btnStr = "\(infor["Name"]!)'s User Information Page"
//                    self.userPageBtn.titleLabel?.text = btnStr
                }
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
