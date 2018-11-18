//
//  DisplayViewController.swift
//  HS Stones App
//
//  Created by Huzefa Suratwala on 10/7/18.
//  Copyright © 2018 PC ToolMan Consulting. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var data : String = ""
    var products : [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nameLabel.text = "\(products[productName])"
        
     
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
