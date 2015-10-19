//
//  SignInViewController.swift
//  carousel
//
//  Created by Mukesh Jain on 10/17/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var button: UIButton!
    var initialOffset: CGFloat!
    var buttonX: CGFloat!
    var buttonY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialOffset = scrollView.contentOffset.y
        buttonX = button.center.x
        buttonY = button.center.y
        email.text = ""
        password.text = ""

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        
        scrollView.contentOffset.y = 165
        //button.center.y = buttonY - 10
        //button.transform = CGAffineTransformMakeTranslation(buttonX, buttonY - 10)
        
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        scrollView.contentOffset.y = initialOffset
        //button.center.y = buttonY
        //button.transform = CGAffineTransformMakeTranslation(buttonX, buttonY)
        

    }
    
    
    @IBAction func backToWelcome(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func signIn(sender: AnyObject) {
        activityIndicator.startAnimating()
        
        if email.text == "m" && password.text == "p" {
            delay(2, closure: { () -> () in
                self.performSegueWithIdentifier("tutorialSegue", sender: nil)
                self.activityIndicator.stopAnimating()
                self.email.text = ""
                self.password.text = ""
            })
            
            
        } else {
            delay(2, closure: { () -> () in
                
                
                let alertController = UIAlertController(title: "Access Denied", message: "Wrong username or password", preferredStyle: .Alert)
                
                // create a cancel action
                let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                
                self.presentViewController(alertController, animated: true){}

                
                self.activityIndicator.stopAnimating()
            })
            
        }

        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
