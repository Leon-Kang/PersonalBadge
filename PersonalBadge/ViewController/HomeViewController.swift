//
//  HomeViewController.swift
//  PersonalBadge
//
//  Created by 康梁 on 2018/12/23.
//  Copyright © 2018 LeonKang. All rights reserved.
//

import UIKit
import ChameleonFramework

class HomeViewController: UIViewController, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let transitionAnimation = EditPageTransitions()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.delegate = self
        collectionView.register(UINib(nibName: String(describing: EventCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: kEventCellIdentifier)
        
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

    // MARK： - Collection View
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = kScreenWidth / 2 - 32
        let size = CGSize(width: width, height: width / 3 * 4)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kEventCellIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
