//
//  CardCell.swift
//  SocialUI
//
//  Created by Rohit Saini on 25/02/21.
//



protocol AddAccountDelegate {
    func didAddAccountBtnTapped(socialType: SocialType)
}

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var tableViewheightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cardView: sainiCardView!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate:AddAccountDelegate?
    var SocialUsers: SocialUser!{
        didSet{
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
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
        tableView.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
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
        if SocialUsers.socialName == "Facebook"{
            return 3
        }
        else{
            return 2
        }
       
    }
    
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if SocialUsers.socialName == "Facebook"{
            if section == 0{
                return 1
            }
            else if section == 1{
                return 1
            }
            return SocialUsers.user.count
        }
        else{
            if section == 0{
                return 1
            }
            return SocialUsers.user.count
        }
        
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if SocialUsers.socialName == "Facebook"{
            if indexPath.section == 0{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as? TitleCell
                else {
                    return UITableViewCell()
                }
                return cell
            }
            else if indexPath.section == 1{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddAccountCell", for: indexPath) as? AddAccountCell
                else {
                    return UITableViewCell()
                }
                cell.seperatorLine.isHidden = false
                cell.socialPic.image = UIImage(named: SocialUsers.socialPic)
                cell.socialName.text = SocialUsers.socialName
                cell.addAccountBtn.tag = SocialUsers.type.rawValue
                cell.addAccountBtn.addTarget(self, action: #selector(addAccount), for: .touchUpInside)
                return cell
            }
            else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonCell
                else {
                    return UITableViewCell()
                }
                cell.personNameLbl.text = SocialUsers.user[indexPath.row].name
                cell.viewBtn.tag = indexPath.row
                cell.viewBtn.addTarget(self, action: #selector(open), for: .touchUpInside)
                return cell
            }
        }
        else{
            if indexPath.section == 0{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddAccountCell", for: indexPath) as? AddAccountCell
                else {
                    return UITableViewCell()
                }
                cell.seperatorLine.isHidden = true
                cell.socialPic.image = UIImage(named: SocialUsers.socialPic)
                cell.socialName.text = SocialUsers.socialName
                cell.addAccountBtn.tag = SocialUsers.type.rawValue
                cell.addAccountBtn.addTarget(self, action: #selector(addAccount), for: .touchUpInside)
                return cell
            }
            
            else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonCell
                else {
                    return UITableViewCell()
                }
                cell.personNameLbl.text = SocialUsers.user[indexPath.row].name
                cell.viewBtn.tag = indexPath.row
                cell.viewBtn.addTarget(self, action: #selector(open), for: .touchUpInside)
                return cell
            }
        }
       
    }
    @objc func addAccount(sender: UIButton){
        delegate?.didAddAccountBtnTapped(socialType: SocialType(rawValue: sender.tag) ?? .facebook)
    }
    
    @objc func open(sender: UIButton){
        openLink(urlStr: SocialUsers.user[sender.tag].link)
    }
    
    func openLink(urlStr:String){
        guard let url = URL(string:urlStr) else { return }
        UIApplication.shared.open(url)
    }
    
}
