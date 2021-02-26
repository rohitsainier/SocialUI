//
//  SocialUser.swift
//  SocialUI
//
//  Created by Rohit Saini on 25/02/21.
//

import Foundation

struct SocialUser{
    let socialPic: String
    let socialName: String
    let type: SocialType
    var user: [User]
}

struct User{
    let name: String
    let link:String
}
enum SocialType:Int{
    case facebook
    case linkedin
}
