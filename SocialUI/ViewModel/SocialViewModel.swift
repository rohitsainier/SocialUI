//
//  SocialViewModel.swift
//  SocialUI
//
//  Created by Rohit Saini on 25/02/21.
//

import UIKit


protocol SocialDelegate {
    
}

struct SocialViewModel{
    var users: [SocialUser] = [SocialUser(socialPic: "facebook", socialName: "Facebook", type: .facebook, user: [User(name: "Rohit Saini"),User(name: "Sonu")]),SocialUser(socialPic: "linkedin", socialName: "Linkedin", type: .linkedin, user: [User(name: "Sravan"),User(name: "Sravan"),User(name: "Sravan"),User(name: "Sravan")])]
    
    
    
}
