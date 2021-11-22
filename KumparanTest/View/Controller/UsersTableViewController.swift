//
//  UsersTableViewController.swift
//  KumparanTest
//
//  Created by Hayden Lui on 16/11/21.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    @IBOutlet weak var tableview : UITableView!
    
    var userVM = UsersViewModel()
    var loadingview : LoadingView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureview()
        title = "Users Name"
        self.showLoading()
    }
    
    private func showLoading() {
        self.loadingview = LoadingView(viewController: self)
        self.loadingview?.show()
    }

    private func configureview() {
        userVM.getUsers{result in
            self.loadingview?.hide()
            self.userVM.users = result
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        tableview.delegate = self
        tableview.dataSource = self
        let footerView = UIView()
        self.tableview.tableFooterView = footerView
    }
    
    static func getViewcontroller() -> UsersTableViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usersVC") as! UsersTableViewController
        return vc
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userVM.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell", for: indexPath) as! UsersTableViewCell
        let user = userVM.users[indexPath.row]
        cell.configureCell(user: user)
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = userVM.users[indexPath.row]
        self.navigationController?.pushViewController(UsersDetailViewController.getViewcontroller(users: user), animated: true)
    }

}
