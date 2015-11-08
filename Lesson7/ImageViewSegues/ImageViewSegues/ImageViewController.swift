//
//  ImageViewController.swift
//  ImageViewSegues
//
//  Created by David Breskvar on 02/11/15.
//  Copyright © 2015 David Breskvar. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var slika : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = slika
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
