//
//  ViewController.swift
//  SocialNetworking
//
//  Created by Yuzhu Yang on 11/16/18.
//  Copyright © 2018 Yuzhu Yang. All rights reserved.
//

//Configure firebase
//Sign Up
//Sign In
//Current user
//Sign Out
//Change Reset password

//Create database
//Update database
//Fetch database

import UIKit
import Firebase
import TWMessageBarManager
import FirebaseDatabase
import FirebaseStorage
//platform

class MainViewController: MRKBaseViewController {
    
    var databaseRef: DatabaseReference!
    
    var storageref : StorageReference!
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    var str : String?
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        databaseRef = Database.database().reference().child("USERS")
        storageref = Storage.storage().reference()

//        fetchThedata()

//        getImage()
    }

    @IBAction func signUpBtn(_ sender: UIButton)
    {

        if let controller = storyboard?.instantiateViewController(withIdentifier: "SignUpPageViewController") as? SignUpPageViewController {
            navigationController?.pushViewController(controller, animated: true)
        }
     
    }
    
    @IBAction func signInBtn(_ sender: UIButton)
    {
        signIn(email: userEmail.text!, paswd: userPassword.text!)
        
        if let user = Auth.auth().currentUser {
            str = user.displayName
        }else{
            print("Go Piggy")
        }

    }

    func signIn(email:String, paswd:String)  {

        Auth.auth().signIn(withEmail: email, password: paswd) { (authResult, error) in
            if error == nil {
                guard let user = authResult?.user else { return }
            } else {
                TWMessageBarManager.sharedInstance().showMessage(withTitle: "Error", description: error?.localizedDescription, type: .error)
                print(error?.localizedDescription)
            }
        }
    }
    
    
    
//    func getImage()
//    {
//        
//        let id = Auth.auth().currentUser?.uid
//        let imagename = "Userimages/\(id!).png"
////        storageref.child(imagename).getMetadata { (meta, err) in
////            print(meta)
////        }
//        storageref.child(imagename).getData(maxSize: 1*600*600) { (data, error) in
//            let image = UIImage(data: data!)
//            print(image)
//        }
//        
//    }
    
//    func uploadImage() {
//        let image = UIImage(named: "Tabbar_Clients_Selected")
//        let data = image?.pngData()
//        let metaData = StorageMetadata()
//        metaData.contentType = "image/png"
//        let id = Auth.auth().currentUser?.uid
//
//        // create img name
//        let imagename = "Userimages/\(id!).png"
//        print(imagename)
//
//        storageref = storageref.child(imagename)
//        storageref.putData(data!, metadata: metaData) { (metaDataS, err) in
////            guard let _ = err else  {
////                return
////            }
//            print(metaDataS)
//        }
//    }
    
    
    func updateUserInfor() {
        if let user = Auth.auth().currentUser{
            Database.database().reference().child(user.uid).updateChildValues(["Name" : "New Name"]) { (error, ref) in
                print(error)
            }

        }
    }
    
    func fetchThedata()
    {
        
        let user = Auth.auth().currentUser
        databaseRef.child(user?.uid ?? "1").observeSingleEvent(of: .value) { (Snapchat) in
            
            if let arr = Snapchat.value as? [String:Any] {
                print(arr)
                for dict in arr {
                    print(dict)
                }
            }
            
//            if let dict = Snapchat.value as? [String: Any] {
//                print(dict)
//            }
        }
    
    }
    


    


}

