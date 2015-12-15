//
//  ViewController.swift
//  Budget
//
//  Created by Ian Gristock on 11/12/2015.
//  Copyright © 2015 Ian Gristock. All rights reserved.
//

import UIKit

class AddExpenseOverviewViewController: UIViewController {

    var expenseListView : ExpenseListView!
    
    @IBOutlet weak var containerViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expenseListView = NSBundle.mainBundle().loadNibNamed("ExpenseList",owner: self, options: nil).last as! ExpenseListView
        expenseListView.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, self.view.frame.size.height)
        view.addSubview(expenseListView)
        expenseListView.setup()
    // Do any additional setup after loading the view, typically from a nib.
    }
    
}
    



