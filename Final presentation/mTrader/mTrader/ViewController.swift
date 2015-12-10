//
//  ViewController.swift
//  mTrader
//
//  Created by David Breskvar on 05/12/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {

    @IBOutlet weak var billDescription: UITextView!
    @IBOutlet weak var billAmount: UITextView!
    @IBOutlet weak var billCurrency: UILabel!
    @IBOutlet weak var billPayer: UISegmentedControl!
    @IBOutlet weak var billSplitters: UITableView!
    
    @IBAction func currencyChanged(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            BillManager.iPay = true
        } else {
            BillManager.iPay = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billSplitters.delegate = self
        billSplitters.dataSource = self
        billDescription.delegate = self
        billAmount.delegate = self
        
        billAmount.text = "\(BillManager.total)"
        
        if billPayer.selectedSegmentIndex == 0 {
            BillManager.iPay = true
        } else {
            BillManager.iPay = false
        }
        
        billAmount.tag = -1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        BillManager.manager.calculateValues()
        billSplitters.reloadData()
    }
    
    /* 
    // MARK: Navigation

    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is SummaryViewController {
            if let svc = segue.destinationViewController as? SummaryViewController {
                svc.amountString = "\(NSString(format: "%.2f", BillManager.total))"
                svc.descriptionString = self.billDescription.text
            }
            
        }
    }
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("payerCell", forIndexPath: indexPath) as! AddedTableViewCell
        let payer : Splitter = BillManager.manager.addedSplitters[indexPath.row]
        
        cell.addedName.text = payer.name
        cell.addedMobile.text = payer.mobile
        cell.addedPrice.text = "\(NSString(format: "%.2f", payer.price))"
        
        if BillManager.manager.addedSplitters[indexPath.row].isPayer {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        cell.addedPrice.delegate = self
        cell.addedPrice.tag = indexPath.row
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            BillManager.manager.addedSplitters.removeAtIndex(indexPath.row)
            BillManager.manager.calculateValues()
            billSplitters.reloadData()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if !BillManager.iPay {
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .Checkmark
            BillManager.manager.addedSplitters[indexPath.row].isPayer = true
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if !BillManager.iPay {
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .None
            BillManager.manager.addedSplitters[indexPath.row].isPayer = false
        }
    }
    
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.tag == -1 {
            if let amount = Double(textView.text) {
                BillManager.total = amount
                BillManager.manager.calculateValues()
                self.billSplitters.reloadData()
            }
        } else {
            if let price = Double(textView.text) {
                BillManager.manager.addedSplitters[textView.tag].price = price
                BillManager.manager.addedSplitters[textView.tag].isEdited = true
                BillManager.manager.calculateValues()
                self.billSplitters.reloadData()
                textView.resignFirstResponder()
            }
        }
        
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

