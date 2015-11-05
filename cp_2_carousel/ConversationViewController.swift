//
//  ConversationViewController.swift
//  cp_2_carousel
//
//  Created by Xu, Cheng on 11/5/15.
//  Copyright © 2015 sansserif. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onClickBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
