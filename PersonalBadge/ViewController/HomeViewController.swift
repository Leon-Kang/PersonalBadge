//
//  HomeViewController.swift
//  PersonalBadge
//
//  Created by 康梁 on 2018/12/23.
//  Copyright © 2018 LeonKang. All rights reserved.
//

import UIKit
import ChameleonFramework

class HomeViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var plusButton: UIButton!
    
    let transitionAnimation = EditPageTransitions()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigation()
    }
    
    // MARK: setup UI
    func setupNavigation() {
        navigationController?.isNavigationBarHidden = true
    }

    // MARK: User Active
    @IBAction func addNewProduct() {
        let editViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: kCreateViewControllerIdentifier)
        navigationController?.pushViewController(editViewController, animated: true)
    }

    
    // MARK: navigation transition
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if toVC.isKind(of: CreateEventViewController.self) {
            let animation = transitionAnimation
            animation.pushing = true
            animation.detailView = self.plusButton
            return animation
        } else if fromVC.isKind(of: CreateEventViewController.self) {
//            let animation = transitionAnimation
//            transitionAnimation.pushing = false
//            animation.detailView = self.plusButton
//            return animation
            return nil
        }
        
        return nil
    }

}
