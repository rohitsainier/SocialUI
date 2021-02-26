//
//  SocialViewModel.swift
//  SocialUI
//
//  Created by Rohit Saini on 25/02/21.
//

import UIKit


protocol SocialDelegate {
    func didNewUserAdded()
}

class SocialViewModel{
    var delegate:SocialDelegate?
    
    var users: [SocialUser] = [SocialUser(socialPic: "facebook", socialName: "Facebook", type: .facebook, user: [User(name: "Virat Kohli", link: "https://www.facebook.com/virat.kohli/")]),SocialUser(socialPic: "linkedin", socialName: "Linkedin", type: .linkedin, user: [User(name: "Rohit Saini", link: "https://in.linkedin.com/in/rohit-saini-aba50362")])]
    
    
     func addAccount(VC: UIViewController,socialType:SocialType){
        let alertVC = UIAlertController(title: "Add Account", message: "Add Name and Account Link", preferredStyle: .alert)
        alertVC.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alertVC.addTextField { (textField) in
            textField.placeholder = "Link"
        }
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { [weak self]
            (alert) -> Void in
            
            let nameValue = alertVC.textFields![0] as UITextField
            let linkValue = alertVC.textFields![1] as UITextField
            self?.users[socialType.rawValue].user.append(User(name: nameValue.text ?? "", link: linkValue.text ?? ""))
            self?.delegate?.didNewUserAdded()
        })
        
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Cancel")
        }))
        
        alertVC.addAction(submitAction)
        alertVC.view.tintColor = UIColor.black
        VC.present(alertVC, animated: true)
     }
}
