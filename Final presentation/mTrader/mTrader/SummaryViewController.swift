//
//  SummaryViewController.swift
//  mTrader
//
//  Created by David Breskvar on 09/12/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var amountString : String?
    var descriptionString : String?
    
    @IBOutlet weak var summaryPriceAmount: UILabel!
    @IBOutlet weak var summarySplitters: UITableView!
    @IBOutlet weak var summaryDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        summarySplitters.delegate = self
        summarySplitters.dataSource = self
        
        if let amount = amountString, billDesc = descriptionString {
            summaryPriceAmount.text = amount
            summaryDescription.text = billDesc
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        summarySplitters.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*
    // MARK: - TableViewData
    
    */

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return BillManager.manager.addedSplitters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("summaryCell", forIndexPath: indexPath) as! SummaryTableViewCell
        
        let splitter = BillManager.manager.addedSplitters[indexPath.row]
        
        cell.summaryName.text = splitter.name
        cell.summaryPrice.text = "\(NSString(format: "%.2f €", splitter.price))"
        
        
        return cell
    }
    
}
