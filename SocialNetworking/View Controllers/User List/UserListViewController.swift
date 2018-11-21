//
//  UserListViewController.swift
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

class UserListViewController: UIViewController {

    @IBOutlet weak var tbl: UITableView!
    
    var str = ""
    
    var users : Array<User> = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
fetchUsers()
        // Do any additional setup after loading the view.
    }
    

    func fetchUsers() {
        
        
        
        Database.database().reference().observe(.childAdded, with: { (snapshot) in
            if let user = snapshot.value as? [String : Any] {
//
//                let user = User(name: user["Name"] as! String, email: user["Email"] as! String, address: user["User Address"] as! String, phone: user["User Phone Number"] as! String)
                print(user["Name"]!)
                let userTemp = User()
                
                userTemp.Name = (user["Name"]! as! String)
                
                userTemp.Email = (user["User Email"]! as! String)
                userTemp.Address = (user["User Address"]! as! String)
                userTemp.PhoneNumber = (user["User Phone Number"]! as! String)
                self.users.append(userTemp)
                
                
                DispatchQueue.main.async {
                    self.tbl.reloadData()
                }
//                self.users.append(user)
                
            }
        }, withCancel: nil)
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

extension UserListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "cell") as! UserDetailTableViewCell
        cell.textviewUserDetails.text = "User Name:\(users[indexPath.row].Name!)\n User Address:\(users[indexPath.row].Address!)\n User Phone Number: \(users[indexPath.row].PhoneNumber!)"
        return cell
    }
}


extension UserListViewController : UITableViewDelegate {
    
}

