//
//  ResetPasswordViewController.swift
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

class ResetPasswordViewController: MRKBaseViewController {

    @IBOutlet weak var userEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resetPasswordBtn(_ sender: UIButton)
    {
        resetPassword(email: userEmail.text!)
    }
    
    
    
    func resetPassword(email: String) {

        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let user = Auth.auth().currentUser {
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
