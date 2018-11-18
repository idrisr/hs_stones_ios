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
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = product.productName
        priceLabel.text = product.productPrice
        descriptionLabel.text = product.productDescription
        typeLabel.text = product.productType
    }
}
