//
//  ViewController.swift
//  SocialUI
//
//  Created by Rohit Saini on 25/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var socialVM: SocialViewModel = SocialViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUI()
    }
    
    
    private func configUI(){
        tableView.register(UINib(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "CardCell")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

//MARK: - TableView DataSource and Delegate Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // estimatedHeightForRowAt
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    // heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
        
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return socialVM.users.count
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as? CardCell
        else {return UITableViewCell()}
        cell.delegate = self
        cell.SocialUsers = socialVM.users[indexPath.row]
        cell.frame = tableView.bounds
        cell.tableView.reloadData()
        cell.layoutIfNeeded()
        cell.tableViewheightConstraint.constant = cell.tableView.contentSize.height
        
        return cell
    }
}

extension ViewController:AddAccountDelegate{
    func didAddAccountBtnTapped(socialType: SocialType) {
        switch socialType {
        case .facebook:
            socialVM.users[socialType.rawValue].user.append(User(name: "hacker"))
        case .linkedin:
            socialVM.users[socialType.rawValue].user.append(User(name: "hacker"))
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


