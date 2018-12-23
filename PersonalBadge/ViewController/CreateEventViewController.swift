//
//  CreateEventViewController.swift
//  PersonalBadge
//
//  Created by 康梁 on 2018/12/23.
//  Copyright © 2018 LeonKang. All rights reserved.
//

import UIKit
import ChameleonFramework

let kCreateViewControllerIdentifier = "kCreateViewControllerIdentifier"

class CreateEventViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        backButton.addTarget(self, action: #selector(closeSelf), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - user active
    @objc func closeSelf() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UI
    func setupUI() {
        view.backgroundColor = UIColor.flatSand()
        navigationController?.isNavigationBarHidden = false
        navigationController?.hidesBottomBarWhenPushed = false
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let backItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeSelf))
        self.navigationController?.navigationItem.leftBarButtonItem = backItem
    }
 
    // MARK: - Navigation Transition
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    private func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        return nil
    }

}
