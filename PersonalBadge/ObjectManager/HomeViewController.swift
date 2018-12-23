//
//  HomeViewController.swift
//  ObjectManager
//
//  Created by 康梁 on 2017/8/22.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var plusButton: UIButton!
    
    let transitionAnimation = EditPageTransitions()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationItem()
        navigationController?.delegate = self
        navigationController?.navigationBar.defaultNaivationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Setup funcation
    func setupUI() {
        view.backgroundColor = UIColor.red
        collectionView.backgroundColor = UIColor.red
    }
    
    func setupNavigationItem() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        let rightItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewProduct))
        navigationItem.rightBarButtonItem = rightItem
    }
    
    func setupCollectionView() {
        collectionView.register(UINib.init(nibName: String(describing: ProductCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: kProductCellIdentifier)
    }
    
    // User Active
    @IBAction func addNewProduct() {
        let editViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: kEditViewControllerIdentifier)
        navigationController?.pushViewController(editViewController, animated: true)
    }

    // Collection Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kProductCellIdentifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = kScreenWidth / 2 - 32
        let size = CGSize(width: width, height: width / 3 * 4)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // Transition animation
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if toVC.isKind(of: EditProductViewController.self) {
            let animation = EditPageTransitions()
            animation.pushing = true
            animation.detailView = self.plusButton
            return animation
        } else if fromVC.isKind(of: EditProductViewController.self) {
            let animation = EditPageTransitions()
            transitionAnimation.pushing = false
            return animation
        }
        
        return nil
    }
}
