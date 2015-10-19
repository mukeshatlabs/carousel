//
//  SettingsViewController.swift
//  carousel
//
//  Created by Mukesh Jain on 10/17/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var signOut: UIButton!

    @IBAction func signOut(sender: AnyObject) {
    
        let alertController = UIAlertController(title: "", message: "Are you sure you want to sign out?", preferredStyle: .ActionSheet)
        
        let logoutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("signinSegue", sender: nil)
            // handle case of user logging out
        }
        // add the logout action to the alert controller
        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
        
    
    }
    @IBAction func dismissSettings(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
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
