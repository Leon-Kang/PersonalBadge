//
//  EditPageTransitions.swift
//  ObjectManager
//
//  Created by 康梁 on 2017/8/24.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

import UIKit
import pop

let kTransitionDuration = 0.5

class EditPageTransitions: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    public var pushing: Bool = true
    public var detailView: UIView?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return kTransitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        
        let containerView = transitionContext.containerView
        containerView.backgroundColor = UIColor.clear
        let finalRect = transitionContext.finalFrame(for: toViewController!)
        
        if pushing {
            let bounds = fromViewController?.view.bounds
            UIGraphicsBeginImageContextWithOptions(bounds!.size, false, 0)
            fromViewController!.view.drawHierarchy(in: bounds!, afterScreenUpdates: false)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let background = UIView(frame: bounds!)
            background.addSubview(UIImageView.init(image: image))
            let blur = UIVisualEffectView.init(effect: UIBlurEffect.init(style: .regular))
            blur.frame = bounds!
            background.addSubview(blur)
            
            toViewController?.view.alpha = 0
            
            containerView.addSubview(background)
            containerView.addSubview((toViewController?.view)!)
            
            let frame = detailView!.frame
            
            let cardLayer = CALayer()
            cardLayer.backgroundColor = UIColor.white.cgColor
            cardLayer.frame = frame
            cardLayer.masksToBounds = true
            cardLayer.cornerRadius = 16
            containerView.layer.addSublayer(cardLayer)
            
            let scaleDownAnim = POPBasicAnimation()
            if let property = POPAnimatableProperty.property(withName: kPOPLayerScaleXY) as? POPAnimatableProperty {
                scaleDownAnim.property = property
            }
            scaleDownAnim.name = "scaleDownAnim"
            scaleDownAnim.toValue = NSValue(cgSize: CGSize(width: 0.8, height: 0.8))
            scaleDownAnim.duration = 0.1
            cardLayer.pop_add(scaleDownAnim, forKey: "scaleDownAnim")
            
            let scaleUpAnim = POPSpringAnimation()
            if let property = POPAnimatableProperty.property(withName: kPOPLayerScaleXY) as? POPAnimatableProperty {
                scaleUpAnim.property = property
            }
            scaleUpAnim.name = "scaleDownAnim"
            scaleUpAnim.toValue = NSValue(cgSize: CGSize(width: 1, height: 1))
            scaleUpAnim.springBounciness = 12
            scaleUpAnim.beginTime = CACurrentMediaTime()
            cardLayer.pop_add(scaleUpAnim, forKey: "scaleDownAnim")
            
            let cornerAnim = POPBasicAnimation()
            if let property = POPAnimatableProperty.property(withName: kPOPLayerCornerRadius) as? POPAnimatableProperty {
                cornerAnim.property = property
            }
            cornerAnim.name = "cornerAnim"
            cornerAnim.toValue = 4
            cornerAnim.duration = 0.3
            cornerAnim.beginTime = CACurrentMediaTime()
            cardLayer.pop_add(cornerAnim, forKey: "cornerAnim")
            
            let moveAnim = POPSpringAnimation()
            if let property = POPAnimatableProperty.property(withName: kPOPLayerPosition) as? POPAnimatableProperty {
                moveAnim.property = property
            }
            moveAnim.name = "cornerAnim"
            moveAnim.toValue = NSValue.init(cgPoint: CGPoint(x: finalRect.midX, y: finalRect.midY + 2))
            moveAnim.springBounciness = 5
            moveAnim.springSpeed = 10
            moveAnim.beginTime = CACurrentMediaTime()
            cardLayer.pop_add(moveAnim, forKey: "cornerAnim")
            
            let scaleAnim = POPSpringAnimation()
            if let property = POPAnimatableProperty.property(withName: kPOPLayerSize) as? POPAnimatableProperty {
                scaleAnim.property = property
            }
            scaleAnim.name = "scaleAnim"
            scaleAnim.toValue = NSValue(cgSize: CGSize(width:UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.height - 64))
            scaleAnim.springBounciness = 5
            scaleAnim.springSpeed = 10
            scaleAnim.beginTime = CACurrentMediaTime()
            cardLayer.pop_add(scaleAnim, forKey: "scaleAnim")
            
            scaleAnim.completionBlock = { animation, finished in
                if finished {
                    cardLayer.removeFromSuperlayer()
                    toViewController?.view.alpha = 1
                    background.removeFromSuperview()
                    blur.removeFromSuperview()
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                }
            }
            
        } else {
            
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}
