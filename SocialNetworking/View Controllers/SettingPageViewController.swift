//
//  SettingPageViewController.swift
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
class SettingPageViewController: UIViewController {
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var userAddress: UILabel!
    
    @IBOutlet weak var userPhoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserInfor()
    }
    
    @IBAction func changePasswordBtn(_ sender: Any)
    {
        
    }
    

    @IBAction func userLogOutBtn(_ sender: Any)
    {
        userAccountLogOut()
    }
    
    
    
    func setUpUserInfor() {
        if Auth.auth().currentUser?.uid == nil {
            print("I am unhappy")
        }else{
            let id = Auth.auth().currentUser?.uid
            Database.database().reference().child(id!).observeSingleEvent(of: .value) { (snapshot) in
                if let infor = snapshot.value as? [String : Any]{
                    self.userName.text = infor["Name"] as? String
                    self.userEmail.text = infor["User Email"] as? String
                    self.userAddress.text = infor["User Address"] as? String
                    self.userPhoneNumber.text = infor["User Phone Number"] as? String
                }
            }
        }
        
    }
    
    
    //Mark: logoutFromFirebase
    func userAccountLogOut() {
        try! Auth.auth().signOut()
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
