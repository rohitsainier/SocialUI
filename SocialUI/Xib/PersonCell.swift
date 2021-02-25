//
//  PersonCell.swift
//  SocialUI
//
//  Created by Rohit Saini on 25/02/21.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var viewBtn: UIButton!
    @IBOutlet weak var personNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
