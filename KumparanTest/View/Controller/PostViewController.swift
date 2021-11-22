//
//  PostViewController.swift
//  KumparanTest
//
//  Created by Hayden Lui on 16/11/21.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var tableview : UITableView!
    
    var postVM = PostViewModel()
    var loadingview: LoadingView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureview()
        self.showLoading()
        title = "Post List"
    }
    
    private func showLoading() {
        self.loadingview = LoadingView(viewController: self)
        self.loadingview?.show()
    }
    
    private func configureview() {
        
        postVM.getPost { result in
            self.loadingview?.hide()
            DispatchQueue.main.async {
                self.postVM.post = result
                self.tableview.reloadData()
                
            }
        }
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        let footerView = UIView()
        self.tableview.tableFooterView = footerView
        
    }
    
    static func getViewcontroller() -> PostViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postVC") as! PostViewController
        return vc
    }

}

extension PostViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postVM.post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        let post = postVM.post[indexPath.row]
        cell.configureCell(post: post)
        return cell
    }
    
    
}
