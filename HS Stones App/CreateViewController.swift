//
//  CreateViewController.swift
//  HS Stones App
//
//  Created by Huzefa Suratwala on 10/7/18.
//  Copyright © 2018 PC ToolMan Consulting. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var prodDescription: UITextField!
    
    var pickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePick = info[.originalImage] as? UIImage {
            image.image = imagePick
        }
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cameraButton(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func folderButton(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
  
    @IBAction func addItemPressed(_ sender: UIButton) {
        print("button pressed")
        if  let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let product = Product(context: context)
            
            product.productName = name.text
            product.productPrice = price.text
            product.productType = type.text
            product.productDescription = prodDescription.text
            product.productImage = image.image?.jpegData(compressionQuality: 1.0)
            
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
        
    }
}
