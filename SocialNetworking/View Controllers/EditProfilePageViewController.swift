//
//  EditProfilePageViewController.swift
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

class EditProfilePageViewController: UIViewController {

    @IBOutlet weak var textfieldUserName: UITextField!
    @IBOutlet weak var textfieldUserEmail: UITextField!
    @IBOutlet weak var textfieldAddress: UITextField!
    @IBOutlet weak var textfieldPhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserOldInforToPlaceHolder()

    }
    
    @IBAction func updateProfile(_ sender: UIButton)
    {
        updateUserInfor()
    }
    
    func updateUserInfor() {
        if let user = Auth.auth().currentUser{
           
            if ((textfieldUserName.text?.isEmpty)!) {
                
            } else{
                Database.database().reference().child(user.uid).updateChildValues(["Name" : textfieldUserName.text]) { (error, ref) in
                    print(error)
                }
            }
            
            if ((textfieldUserEmail.text?.isEmpty)!) {

            } else {
                Database.database().reference().child(user.uid).updateChildValues(["User Email" : textfieldUserEmail.text]) { (error, ref) in
                    print(error)
                }
            }
            if ((textfieldAddress.text?.isEmpty)!) {
                
            } else {
                Database.database().reference().child(user.uid).updateChildValues(["User Address" : textfieldAddress.text]) { (error, ref) in
                    print(error)
                }
            }
            
            if ((textfieldPhoneNumber.text?.isEmpty)!) {
                
            } else {
                Database.database().reference().child(user.uid).updateChildValues(["User Phone Number" : textfieldPhoneNumber.text]) { (error, ref) in
                    print(error)
                }
            }
        }
    }
    
    func setUserOldInforToPlaceHolder() {
        if Auth.auth().currentUser?.uid == nil {
            print("I am unhappy")
        }else{
            let id = Auth.auth().currentUser?.uid
            Database.database().reference().child(id!).observeSingleEvent(of: .value) { (snapshot) in
                if let infor = snapshot.value as? [String : Any]{
                    self.textfieldUserName.placeholder = infor["Name"] as? String
                    self.textfieldUserEmail.placeholder = infor["User Email"] as? String
                    self.textfieldAddress.placeholder = infor["User Address"] as? String
                    self.textfieldPhoneNumber.placeholder = infor["User Phone Number"] as? String
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
