//
//  timelineViewController.swift
//  cp_2_carousel
//
//  Created by Xu, Cheng on 11/4/15.
//  Copyright © 2015 sansserif. All rights reserved.
//

import UIKit

class timelineViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 1664)

        // Do any additional setup after loading the view.
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
