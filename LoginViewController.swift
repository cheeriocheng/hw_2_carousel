//
//  LoginViewController.swift
//  cp_2_carousel
//
//  Created by Xu, Cheng on 11/4/15.
//  Copyright © 2015 sansserif. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldView: UIView!
    @IBOutlet weak var buttonView: UIView!

    
        var fieldInitialY: CGFloat!
        var buttonInitialY: CGFloat!
        var fieldDeltaY: CGFloat!
        var buttonDeltaY:CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldInitialY = fieldView.frame.origin.y
        fieldDeltaY = -110
        buttonInitialY = buttonView.frame.origin.y
        buttonDeltaY = -200
        
       
        scrollView.contentSize = CGSize(width: 320, height: 600)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        fieldView.frame.origin.y = fieldInitialY + fieldDeltaY
        buttonView.frame.origin.y = buttonInitialY + buttonDeltaY
        
        
        
        
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldView.frame.origin.y = fieldInitialY
        buttonView.frame.origin.y = buttonInitialY
        
        
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
