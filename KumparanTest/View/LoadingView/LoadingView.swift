//
//  LoadingView.swift
//  Ezeelink
//
//  Created by Hayden Lui on 24/09/18.
//  Copyright © 2018 Puji Wahono. All rights reserved.
//

import UIKit
import Lottie

enum LoadingStyle {
    case basic
    case animated
}

class LoadingView: UIView {
    
    @IBOutlet var rootView: UIView!
    @IBOutlet weak var container_shadow: UIView!
    @IBOutlet weak var container_border: UIView!
    @IBOutlet weak var container_animated: UIView!
    @IBOutlet weak var lb_text  : UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private weak var targetViewController: UIViewController?
    
    private var isTableViewcontroller: Bool = false
    private var loadingStyle: LoadingStyle!
    
    private lazy var animatedLoading: AnimationView = {
        let animationView = AnimationView(name: "loading_animation")
            animationView.frame = CGRect(x: 0, y: 0, width: container_animated.frame.width, height: container_animated.frame.height)
            animationView.contentMode = .scaleToFill
        animationView.loopMode = .loop
        return animationView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(viewController: UIViewController? = nil, isTableViewController: Bool = false, loadingStyle: LoadingStyle = .basic) {
        if let vc = viewController {
            self.init(frame: vc.view.frame)
            self.targetViewController = vc
        } else {
            self.init(frame: UIApplication.shared.keyWindow?.frame ?? CGRect.zero )
        }
        self.loadingStyle = loadingStyle
        self.isTableViewcontroller = isTableViewController
        initalizeView()
    }
    
    private func initalizeView() {
        Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)
        rootView.frame = bounds
        rootView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(rootView)
        configureView()
    }
    
    private func configureView() {
        if loadingStyle == .basic {
            container_animated.isHidden = true
            container_border.layer.cornerRadius  = 8
            container_border.layer.masksToBounds = true
            container_border.layer.shadowColor   = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            container_shadow.layer.shadowOffset  = CGSize(width: 0.0, height: 3.0)
            container_shadow.layer.shadowOpacity = 0.5
            container_shadow.layer.shadowRadius  = 10
            container_shadow.layer.masksToBounds = false
            container_shadow.backgroundColor     = UIColor.clear
        } else {
            rootView.backgroundColor = UIColor.clear
            container_shadow.isHidden = true
            container_animated.addSubview(animatedLoading)
        }
    }
    
    func show() {
        rootView.alpha = 0
        if let vc = self.targetViewController {
            rootView.alpha = 0
            if isTableViewcontroller {
                vc.view.superview?.addSubview(rootView)
            } else {
                vc.view.addSubview(rootView)
            }
            loadingStyle == .basic ? activityIndicator.startAnimating() : animatedLoading.play()
        } else {
            guard let window = UIApplication.shared.keyWindow else { return }
            window.addSubview(rootView)
            loadingStyle == .basic ? activityIndicator.startAnimating() : animatedLoading.play()
        }
        UIView.animate(withDuration: 0.5) { self.rootView.alpha = 1 }
    }
    
    func hide() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: { self.rootView.alpha = 0 }) { (completed) in self.rootView.removeFromSuperview() }
        }
    }
    
    
}






































