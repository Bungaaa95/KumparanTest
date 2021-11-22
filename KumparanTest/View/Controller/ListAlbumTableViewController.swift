//
//  ListAlbumTableViewController.swift
//  KumparanTest
//
//  Created by Hayden Lui on 16/11/21.
//

import UIKit

class ListAlbumTableViewController: UITableViewController {
    
    @IBOutlet weak var tableview : UITableView!
    
    var albumVM = AlbumViewModel()
    var loadingview : LoadingView?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureview()
        title = "List Album"
        self.showLoading()
    }
    
    private func showLoading() {
        self.loadingview = LoadingView(viewController: self)
        self.loadingview?.show()
    }

    private func configureview() {
        albumVM.getAlbums { result in
            self.loadingview?.hide()
            DispatchQueue.main.async {
                self.albumVM.albums = result
                self.tableview.reloadData()
                
            }
        }
        
        tableview.delegate = self
        tableview.dataSource = self
        let footerView = UIView()
        self.tableview.tableFooterView = footerView
    }
    
    static func getViewcontroller() -> ListAlbumTableViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "listAlbumVC") as! ListAlbumTableViewController
        return vc
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return albumVM.albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! ListAlbumTableViewCell
        let album = albumVM.albums[indexPath.row]
        cell.configureCell(album: album)
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albumVM.albums[indexPath.row]
        self.navigationController?.pushViewController(ZoomPhotoViewController.getViewcontroller(url: album.getPhoto()), animated: true)
        
    }
}
