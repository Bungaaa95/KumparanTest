//
//  HomeViewController.swift
//  KumparanTest
//
//  Created by Hayden Lui on 17/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var vwUser : UIView!
    @IBOutlet weak var vwPost : UIView!
    @IBOutlet weak var vwComment : UIView!
   

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        title = "HOME"
    }
    
    private func configureView() {
        self.vwUser.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showUsers)))
        self.vwPost.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPost)))
        self.vwComment.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showComments)))
    }
    
    @objc private func showUsers(){
        self.navigationController?.pushViewController(UsersTableViewController.getViewcontroller(), animated: true)
    }
    
    @objc private func showPost(){
        self.navigationController?.pushViewController(PostViewController.getViewcontroller(), animated: true)
    }
    
    @objc private func showComments(){
        self.navigationController?.pushViewController(ListCommentsTableViewController.getViewcontroller(), animated: true)
    }
    
    

}
