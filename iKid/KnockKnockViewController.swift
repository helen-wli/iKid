//
//  KnockKnockViewController.swift
//  iKid
//
//  Created by Helen Li on 5/6/22.
//

import UIKit

class KnockKnockViewController: UIViewController {
    
    var firstViewController : KKFirstViewController! = nil
    var secondViewController : KKSecondViewController! = nil
    var thirdViewController : KKThirdViewController! = nil
    var fourthViewController : KKFourthViewController! = nil
    var fifthViewController : KKFifthViewController! = nil
    
    @IBAction func switchViews(_ sender: Any) {
        fifthBuilder()
        fourthBuilder()
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
        }
        else if secondViewController != nil &&
                    secondViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            thirdViewController.view.frame = view.frame
            switchViewController(secondViewController, to: thirdViewController)
        } else if thirdViewController != nil &&
                    thirdViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            fourthViewController.view.frame = view.frame
            switchViewController(thirdViewController, to: fourthViewController)
        } else if fourthViewController != nil &&
                    fourthViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            fifthViewController.view.frame = view.frame
            switchViewController(fourthViewController, to: fifthViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(fifthViewController, to: firstViewController)
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
                    .instantiateViewController(withIdentifier: "KKFirst")
                as? KKFirstViewController
        }
    }
    
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "KKSecond")
                as? KKSecondViewController
        }
    }
    
    fileprivate func thirdBuilder() {
        if thirdViewController == nil {
            thirdViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "KKThird")
                as? KKThirdViewController
        }
    }
    
    fileprivate func fourthBuilder() {
        if fourthViewController == nil {
            fourthViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "KKFourth")
                as? KKFourthViewController
        }
    }
    
    fileprivate func fifthBuilder() {
        if fifthViewController == nil {
            fifthViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "KKFifth")
                as? KKFifthViewController
        }
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
