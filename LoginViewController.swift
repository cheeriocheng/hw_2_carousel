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

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var loadingActivityIndicatorView: UIActivityIndicatorView!
    
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
    
    @IBAction func onLogInButtonPressed(sender: AnyObject) {
//        print("sign in button pressed")
        
        //check if fields are empty, if so, alert
        if (emailTextField.text!.isEmpty  ){
            emptyFieldAlert("email")
        }
 
        else if ( passwordTextField.text!.isEmpty) {
             emptyFieldAlert("password")
        }
        
        //else send the information to server
        //(i.e. delay )
        else{
            loadingActivityIndicatorView.startAnimating()
            logInButton.enabled=false
            view.userInteractionEnabled = false
            logInButton.selected = true
            
            delay(2) { () -> () in
                self.validateCredentials()
                self.loadingActivityIndicatorView.stopAnimating()
                self.view.userInteractionEnabled = true
                self.logInButton.enabled = true
                //self.loginButton.selected = false
            }

            
            
        }
        
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateCredentials(){
        if emailTextField.text == "tim" && passwordTextField.text == "password" {
            print("bingo")
            // performSegueWithIdentifier("loginSegue", sender: nil)
            
        } else {
            print("invalid credentials")
            
            let alert = UIAlertController(title: "Oops", message: "Wrong password sucka", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                print("User tapped OK")
            })
            
            alert.addAction(okAction)
            
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func emptyFieldAlert(missingString: String){
        let temp = "Please enter your " + missingString
        let alert = UIAlertController(title: "Try again", message: temp, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            print("User tapped OK")
        })
        
        alert.addAction(okAction)
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
//            print("User tapped cancel")
//        })
//        
//        alert.addAction(cancelAction)
        
        
        presentViewController(alert, animated: true, completion: nil)
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
