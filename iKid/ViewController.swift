//
//  ViewController.swift
//  iKid
//
//  Created by Helen Li on 5/6/22.
//

import UIKit

class GoodViewController: UIViewController {
    
    var firstViewController : GoodFirstViewController! = nil
    var secondViewController : GoodSecondViewController! = nil
    var thirdViewController : GoodThirdViewController! = nil
    
    @IBAction func switchViews(_ sender: Any) {
        thirdBuilder()
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)

        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            secondViewController.view.frame = self.view.frame
            switchViewController(firstViewController, to: secondViewController)
        } else if secondViewController != nil &&
            secondViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            thirdViewController.view.frame = self.view.frame
            switchViewController(secondViewController, to: thirdViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(thirdViewController, to: firstViewController)
        }
        
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstBuilder()
        switchViewController(nil, to: firstViewController)
    }
    
    fileprivate func firstBuilder() {
        if firstViewController == nil {
            firstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "GoodFirst")
                as? GoodFirstViewController
        }
    }
    
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "GoodSecond")
                as? GoodSecondViewController
        }
    }
    
    fileprivate func thirdBuilder() {
        if thirdViewController == nil {
            thirdViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "GoodThird")
                as? GoodThirdViewController
        }
    }
    
}

