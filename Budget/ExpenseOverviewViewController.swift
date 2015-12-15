//
//  ExpenseOverviewViewController.swift
//  Budget
//
//  Created by Ian Gristock on 12/12/2015.
//  Copyright © 2015 Ian Gristock. All rights reserved.
//

import UIKit

class ExpenseOverviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addButtonClicked(sender: AnyObject) {
        print("clicking")
        NSNotificationCenter.defaultCenter().postNotificationName("SlideDownClicked", object: self, userInfo: nil)
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
