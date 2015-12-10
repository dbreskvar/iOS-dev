//
//  AddSplitterViewController.swift
//  mTrader
//
//  Created by David Breskvar on 09/12/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class AddSplitterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var addTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTableView.delegate = self
        addTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
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
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BillManager.manager.splitters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("addCell", forIndexPath: indexPath) as! SplitterTableViewCell
        
        let splitter = BillManager.manager.splitters[indexPath.row]
        
        cell.addingName.text = splitter.name
        cell.addingNumber.text = splitter.mobile
        
        if splitter.isSelected {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let splitter = BillManager.manager.splitters[indexPath.row]
        if splitter.isSelected {
            BillManager.manager.deselectedAddedSplitter(splitter)
            splitter.isSelected = false
            cell?.accessoryType = .None
        } else {
            BillManager.manager.addSplitter(splitter)
            splitter.isSelected = true
            cell?.accessoryType = .Checkmark
        }
        
    }
    
}
