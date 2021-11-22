//
//  UsersDetailViewController.swift
//  KumparanTest
//
//  Created by Hayden Lui on 16/11/21.
//

import UIKit

class UsersDetailViewController: UIViewController {
    
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblEmail : UILabel!
    @IBOutlet weak var lblAddress : UILabel!
    @IBOutlet weak var lblCompany : UILabel!
    @IBOutlet weak var btnAlbums : UIButton!
    
    var users : Users?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureview()
        title = "Users Detail"
    }
    

    private func configureview() {
        lblName.text = "Name : \(users?.name ?? "")"
        lblEmail.text = "Email : \(users?.email ?? "")"
        lblAddress.text = "Address : \(users?.address?.street ?? ""), \(users?.address?.suite ?? ""), \(users?.address?.city ?? ""), \(users?.address?.zipcode ?? "")"
        lblCompany.text = "Company : \(users?.company?.name ?? ""), \(users?.company?.catchPhrase ?? ""), \(users?.company?.bs ?? "")"
        
        btnAlbums.layer.cornerRadius = 5
        
    }
    
    @IBAction func showAlbums(_ sender: Any) {
        self.navigationController?.pushViewController(ListAlbumTableViewController.getViewcontroller(), animated: true)
    }
    
    static func getViewcontroller(users: Users) -> UsersDetailViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usersDetailVC") as! UsersDetailViewController
        vc.users = users
        return vc
    }

}
