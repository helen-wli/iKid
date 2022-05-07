//
//  PunViewController.swift
//  iKid
//
//  Created by Helen Li on 5/6/22.
//

import UIKit

class PunViewController: UIViewController {
    
    var firstViewController : PunFirstViewController! = nil
    var secondViewController : PunSecondViewController! = nil
    var thirdViewController : PunThirdViewController! = nil
    
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
                    .instantiateViewController(withIdentifier: "PunFirst")
                as? PunFirstViewController
        }
    }
    
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "PunSecond")
                as? PunSecondViewController
        }
    }
    
    fileprivate func thirdBuilder() {
        if thirdViewController == nil {
            thirdViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "PunThird")
                as? PunThirdViewController
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
