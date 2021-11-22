//
//  ZoomPhotoViewController.swift
//  KumparanTest
//
//  Created by Hayden Lui on 17/11/21.
//

import UIKit
import Nuke

class ZoomPhotoViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var picture: UIImageView!

    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 10

        showPicture()
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }

    func showPicture() {
         Nuke.loadImage(with: url!, into: self.picture)
    }
    
    static func getViewcontroller(url: URL) -> ZoomPhotoViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "zoomPhotoVC") as! ZoomPhotoViewController
        vc.url = url
        return vc
    }

}

extension ZoomPhotoViewController: UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return picture
    }
    
}
