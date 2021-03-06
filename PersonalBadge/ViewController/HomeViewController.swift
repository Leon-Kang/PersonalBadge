//
//  HomeViewController.swift
//  PersonalBadge
//
//  Created by 康梁 on 2018/12/23.
//  Copyright © 2018 LeonKang. All rights reserved.
//

import UIKit
import ChameleonFramework

let kItemSpacing: CGFloat = 16.0

public enum CellSizeStyle {
    public typealias RawValue = String
    
    case Big, Normal, Small
}

class HomeViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var changeLayoutItem: UIBarButtonItem!
    
    var cellSizeStyle : CellSizeStyle = .Small
    
    var cellSizeDictionary = [CellSizeStyle : CGSize]()
    var cellItemSpcing : [CellSizeStyle : CGFloat] = [.Big : 16, .Normal : 8, .Small : 8]
    let transitionAnimation = EditPageTransitions()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        self.navigationController?.delegate = self
        
        collectionView.register(UINib(nibName: String(describing: EventCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: kEventCellIdentifier)
        let bigWidth = kScreenWidth / 2 - 16 - 8 // - left/right spacing - item spacing
        let normalWith = (kScreenWidth - 32 - 16) / 3
        let smallWith = (kScreenWidth - 32 - 24) / 4
        cellSizeDictionary = [.Big : CGSize(width: bigWidth, height: bigWidth / 3 * 4),
                              .Normal : CGSize(width: normalWith, height: normalWith / 3 * 4),
                              .Small :CGSize(width: smallWith, height: smallWith / 3 * 4)]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigation()
    }
    
    // MARK: setup UI
    func setupUI() {
        setupNavigation()
    }

    // MARK: User Active
    @IBAction func addNewProduct() {
        let editViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: kCreateViewControllerIdentifier)
        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    @IBAction func changeLayout(_ sender: Any) {
        self.cellSizeStyle = cellSizeStyle == .Big ? .Normal : .Big
        self.collectionView.reloadData()
    }

}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    // MARK: Collection View
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSizeDictionary[cellSizeStyle]!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kEventCellIdentifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellItemSpcing[cellSizeStyle]!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension HomeViewController: UINavigationControllerDelegate {
    func setupNavigation() {
        guard (self.navigationController?.navigationBar) != nil else {
            return
        }
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Badge"
//        navigationItem.prompt = "Badge"
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
            return nil
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
