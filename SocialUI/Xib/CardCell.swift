//
//  CardCell.swift
//  SocialUI
//
//  Created by Rohit Saini on 25/02/21.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var cardView: sainiCardView!
    @IBOutlet weak var tableView: UITableView!
    
    var SocialUsers: [User] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configUI(){
        tableView.register(UINib(nibName: "AddAccountCell", bundle: nil), forCellReuseIdentifier: "AddAccountCell")
        tableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "PersonCell")
    }
    
}

//MARK: - TableView DataSource and Delegate Methods
extension CardCell: UITableViewDelegate, UITableViewDataSource {
    
    // heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 46 : 59
    }
    
    // number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        return SocialUsers.count
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddAccountCell", for: indexPath) as? AddAccountCell
            else {
                return UITableViewCell()
            }
            return cell
        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonCell
            else {
                return UITableViewCell()
            }
            return cell
        }
        
    }
    
    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
