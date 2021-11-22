//
//  ListCommentsTableViewController.swift
//  KumparanTest
//
//  Created by Hayden Lui on 17/11/21.
//

import UIKit

class ListCommentsTableViewController: UITableViewController {
    
    @IBOutlet weak var tableview : UITableView!
    
    var listCommentVM = ListCommentsViewModel()
    var loadingview : LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        title = "Comment List"
        self.showLoading()
    }
    
    private func showLoading() {
        self.loadingview = LoadingView(viewController: self)
        self.loadingview?.show()
    }
    
    private func configureView() {
        listCommentVM.getListComment { result in
            self.loadingview?.hide()
            DispatchQueue.main.async {
                self.listCommentVM.comments = result
                self.tableview.reloadData()
            }
        }
        
        tableview.delegate = self
        tableview.dataSource = self
        let footerView = UIView()
        self.tableview.tableFooterView = footerView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listCommentVM.comments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! ListCommentsTableViewCell
        let comment = listCommentVM.comments[indexPath.row]
        cell.configureCell(comment: comment)
        cell.selectionStyle = .none
        return cell
    }
    
    static func getViewcontroller() -> ListCommentsTableViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "listCommentVC") as! ListCommentsTableViewController
        return vc
    }
    
}
