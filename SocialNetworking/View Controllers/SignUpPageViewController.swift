//
//  SignUpPageViewController.swift
//  SocialNetworking
//
//  Created by Yuzhu Yang on 11/19/18.
//  Copyright © 2018 Yuzhu Yang. All rights reserved.
//

import UIKit
import Firebase
import TWMessageBarManager
import FirebaseDatabase
import FirebaseStorage

class SignUpPageViewController: UIViewController {

    @IBOutlet weak var sign_up_user_name: UITextField!
    
    @IBOutlet weak var sign_up_user_email: UITextField!
    
    @IBOutlet weak var sign_up_user_password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
print("here")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sign_up_btn(_ sender: UIButton) {
        
        signUp(email: sign_up_user_email.text!, paswd: sign_up_user_password.text!, name: sign_up_user_name.text!)
        navigationController?.popViewController(animated: true)
    }
    

    func signUp(email:String, paswd:String, name: String)
    {
        
        Auth.auth().createUser(withEmail: email, password: paswd) { (authResult, error) in
            if error == nil
            {
                guard let user = authResult?.user else {return}
                let infor = ["Name" : name, "User Email" : email]
                Database.database().reference().child(user.uid).setValue( infor, withCompletionBlock: { (error, ref) in
                    if error == nil {
                        print("here")
                    }
                })
            }
        }
    }
        

//
//        Auth.auth().createUser(withEmail: email, password: paswd) { (authResult, error) in
//            if error == nil {
//                guard let user = authResult?.user else { return }
//
//                //self.databaseRef.child("USERS").setvalue("ID"), withComp
//
//                self.databaseRef.child("A Piggy").setValue( ["Name:": name, "Fatty" : "200 lb", "EmailId": email], withCompletionBlock: { (error, ref) in
//                if error == nil {
//                print(ref)
//                }
//            })
//
//            //                print(user.displayName)
//            //                print(user.email)
//            //                print(user.uid)
//            TWMessageBarManager.sharedInstance().showMessage(withTitle: "Success", description: "Sucessfully reguster their new user", type: .success)
//
//            } else {
//            TWMessageBarManager.sharedInstance().showMessage(withTitle: "Error", description: error?.localizedDescription, type: .error)
//            print(error?.localizedDescription)
//            }
//
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
