//
//  EditProductViewController.swift
//  ObjectManager
//
//  Created by 康梁 on 2017/8/23.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

import UIKit
import TextFieldEffects

let kEditViewControllerIdentifier = "kEditViewControllerIdentifier"

class EditProductViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var editCard: UIView!
    @IBOutlet weak var saveButton: UIButton!
    var titleTextField: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigation()
        navigationController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Setup UI
    func setupUI() {
        view.backgroundColor = UIColor.clear
        editCard.layer.masksToBounds = true
        editCard.layer.cornerRadius = 8
        
        titleTextField = HoshiTextField.init(frame: CGRect(x: 36, y: 36, width: kScreenWidth - 64, height: 24))
        titleTextField.placeholder = "Name"
        titleTextField.placeholderColor = UIColor.darkGray
//        view.addSubview(titleTextField)
    }
    
    func setupNavigation() {
        navigationController?.isNavigationBarHidden = true
    }
    
    // User Active
    @IBAction func saveProduct(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // Navigation Transition
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        return nil
    }

}
