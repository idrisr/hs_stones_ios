//
//  ProductsTableViewController.swift
//  HS Stones App
//
//  Created by Huzefa Suratwala on 10/7/18.
//  Copyright © 2018 PC ToolMan Consulting. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var products : [Product] = []

    override func viewWillAppear(_ animated: Bool) {
        getProducts()
    }
    
    func getProducts() {
        if  let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let products =  try? context.fetch(Product.fetchRequest()) {
                if let theProducts = products as? [Product] {
                    self.products = theProducts
                    tableView.reloadData()
                }
            }
            
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let product = products[indexPath.row]
        
        cell.textLabel?.text = product.productName
        if let data = product.productImage {
            cell.imageView?.image =  UIImage(data: data)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = products[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "DisplayViewController") as!  DisplayViewController
        
        // This will perform the segue you define in IB, with the view controller pre-loaded and configured
//        let displayViewController = DisplayViewController()
//        displayViewController.performSegue(withIdentifier: "goToDisplay", sender: self)
        navigationController?.pushViewController(destination, animated: true)
        print(row)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if  let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let product =  products[indexPath.row]
                context.delete(product)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                getProducts()
                
            }
        }
        
    }
    
  
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "DisplayItem" {
//
//            let destinationVC = segue.destination as? DisplayViewController
//            //destinationVC.data =
//        }
//    }
//
}















