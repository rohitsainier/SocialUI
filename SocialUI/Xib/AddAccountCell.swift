//
//  AddAccountCell.swift
//  SocialUI
//
//  Created by Rohit Saini on 25/02/21.
//

import UIKit

class AddAccountCell: UITableViewCell {

    @IBOutlet weak var socialName: UILabel!
    @IBOutlet weak var socialPic: UIImageView!
    
    @IBOutlet weak var addAccountBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
