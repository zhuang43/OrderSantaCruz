//
//  ItemViewController.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/30/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

import Parse

class ItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var itemImage: UIImageView!

    
    var imageFiles = [PFFile]()
    var itemName = [String]()
    var itemPrice = [String]()
    var itemFrom = [String]()
    var selectedItems = [String]()
    var row : Int = 0

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func add(_ sender: UIButton) {
        let items = UserDefaults.standard.object(forKey: "itemSelected") as? [String]
        
        let itemObjects = UserDefaults.standard.object(forKey: "cart")
        
        
        var cart : [String]
        
        if let tempCart = itemObjects as? [String]{
            
            cart = tempCart
            
            cart.append((items?[(sender as AnyObject).tag])!)
            
        } else {
            
            cart = [(items?[(sender as AnyObject).tag])!]
            
        }
        
        UserDefaults.standard.set(cart, forKey: "cart")
        
        let itemsPrice = UserDefaults.standard.object(forKey: "itemSelectedPrice") as? [String]
        
        let itemObjectsPrice = UserDefaults.standard.object(forKey: "cartPrice")
        
        var cartPrice : [String]
        
        if let tempPrice = itemObjectsPrice as? [String]{
            
            cartPrice = tempPrice
            
            cartPrice.append((itemsPrice?[(sender as AnyObject).tag])!)
            
        } else {
            
            cartPrice = [(itemsPrice?[(sender as AnyObject).tag])!]
            
        }
        
        UserDefaults.standard.set(cartPrice, forKey: "cartPrice")
        
        var itemsFrom = UserDefaults.standard.object(forKey: "itemSelectedFrom") as? [String]
        
        let itemObjectsFrom = UserDefaults.standard.object(forKey: "foodFrom")
        
        
        var foodFrom : [String]
        
        if let tempFoodFrom = itemObjectsFrom  as? [String]{
            
            foodFrom = tempFoodFrom
            
            foodFrom.append((itemsFrom?[(sender as AnyObject).tag])!)
            
        } else {
            
            foodFrom = [(itemsFrom?[(sender as AnyObject).tag])!]
            
        }
        
        UserDefaults.standard.set(foodFrom, forKey: "foodFrom")
        
        
        UIView.animate(withDuration: 0.5) {
            
            sender.alpha = 0
            
        }
        UIView.animate(withDuration: 0.5) {
            
            sender.alpha = 1
            
        }
        
        let alert = UIAlertController(title: "Added", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        /* let subview = alert.view.subviews.first! as UIView
        let alertContentView = subview.subviews.first! as UIView
        alertContentView.backgroundColor = UIColor.black
        alertContentView.layer.cornerRadius = 15
        alert.view.tintColor = UIColor.white;*/
        
        self.present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 0.3
        
        DispatchQueue.main.asyncAfter(deadline: when){
            
            alert.dismiss(animated: true, completion: nil)
        }

        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemCell
        
        imageFiles[indexPath.row].getDataInBackground { (data, error) in
            if let imagedata = data{
                
                if let tempImage = UIImage(data: imagedata) {
                    
                    cell.itemImage.image = tempImage
                    
                    print("itemImageSetupSuccess")
                    
                }
                
            }
            
            cell.itemName.text = self.itemName[indexPath.row]
            
            cell.itemPrice.text = self.itemPrice[indexPath.row]
            
            if let image = UIImage(named: "plus.png") {
                
                cell.add.setImage(image, for: .normal)
            }
            
            cell.add.tag = indexPath.row
            
            print("namesSetupSuccess")
        }
        
        return cell

    }
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return itemName.count
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let ID = UserDefaults.standard.object(forKey: "ID")

        print(ID!)
        
        var query = PFQuery(className: "Items")
        
        query.whereKey("itemAvaliable", equalTo: 1)
        
        query.whereKey("ID", equalTo: ID!)
        
        query.findObjectsInBackground(block: { (objects, error) in
            
            if error != nil{
                
                print("findObjectsError")
                
            }else{
                if let items = objects{
                
                for objects in items {
                    
                    if let item = objects as? PFObject {
               
                        self.imageFiles.append(item["itemPhoto"] as! PFFile)
                        
                        self.itemName.append(item["itemName"] as! String)
                        
                        self.itemPrice.append(item["itemPrice"] as! String)
                        
                        self.itemFrom.append(item["ID"] as! String)
                    
                        self.tableView.reloadData()
                        
                        }
                    }
                }
                
                UserDefaults.standard.set(self.itemName, forKey: "itemSelected")
        
                UserDefaults.standard.set(self.itemPrice, forKey: "itemSelectedPrice")
        
                UserDefaults.standard.set(self.itemFrom, forKey: "itemSelectedFrom")
            }
        })
        
       
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
