//
//  TutorialViewController.swift
//  carousel
//
//  Created by Mukesh Jain on 10/17/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    
    @IBOutlet weak var spingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialScrollView.contentSize = CGSize(width: 1300, height: 568)
        
        tutorialScrollView.delegate = self
        
        spingImage.alpha = 0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(tutorialScrollView: UIScrollView!) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(tutorialScrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidEndDragging(tutorialScrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(tutorialScrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if page == 3 {
            pageControl.hidden = true
            spingImage.alpha = 1
            
        }
        else {
            pageControl.hidden = false
            spingImage.alpha = 0
        }
        
        // This method is called when the scrollview finally stops scrolling.
    }
    
    
    @IBAction func takeSpin(sender: AnyObject) {
        print("spin button pressed")
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
