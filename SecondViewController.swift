//
//  SecondViewController.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/23/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

import  Parse

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var navi: UINavigationItem!

    @IBOutlet var clearCart: UIBarButtonItem!
    var cart : [String] = []
    var cartPrice : [String] = []
    var foodFrom : [String] = []

    @IBAction func naviCheckout(_ sender: AnyObject) {
        
        if PFUser.current()?["username"] != nil {
            self.performSegue(withIdentifier: "checkout", sender: self)
            
        } else {
            
            creatAlert(title: "Sorry", message: "You have to login first")
            
        }
        
        
        
        
    }
    @IBAction func naviClearCart(_ sender: AnyObject) {
        
        let alerView2 = UIAlertController(title: "Caution", message: "Are you sure you want to clear you cart?", preferredStyle: UIAlertControllerStyle.alert)
        
        alerView2.addAction(UIAlertAction(title: "Nah", style: .default, handler: { (action) in
            
 
        }))
        
        alerView2.addAction(UIAlertAction(title: "I'm sure", style: .default, handler: { (action) in
            
            self.cart.removeAll()
            
            UserDefaults.standard.set(self.cart, forKey: "cart")
            
            self.cartPrice.removeAll()
            
            UserDefaults.standard.set(self.cartPrice, forKey: "cartPrice")
            
            self.foodFrom.removeAll()
            
            UserDefaults.standard.set(self.foodFrom, forKey: "foodFrom")
            
            
            if self.cart.count == 0 {
                self.navigationItem.leftBarButtonItem?.tintColor = UIColor.clear
                self.clearCart.isEnabled = false
                
            } else {
                
                self.navigationItem.leftBarButtonItem?.tintColor = nil
                self.clearCart.isEnabled = true
            }
            
            self.tableView.reloadData()
            
            

            
            
        }))
        
        self.present(alerView2, animated: true, completion: nil)

        
    }
    
    @IBOutlet weak var naviClearCart: UIBarButtonItem!
    
    func creatAlert(title: String, message: String){
        
        let alerView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alerView.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
              //  self.present(alerView, animated: true, completion: nil)
            
        }))
        
        alerView.addAction(UIAlertAction(title: "Log in", style: .default, handler: { (action) in
            
            self.performSegue(withIdentifier: "login", sender: self)
            
        }))
        
        self.present(alerView, animated: true, completion: nil)
        
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
 
        return (cart.count)
        
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! listCell
        
        cell.itemName.text = cart[indexPath.row]
  
        cell.price.text = cartPrice[indexPath.row]
        
        return cell
    }


    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            cart.remove(at: indexPath.row)
            
            UserDefaults.standard.set(cart, forKey: "cart")
            
            cartPrice.remove(at: indexPath.row)
            
            UserDefaults.standard.set(cartPrice, forKey: "cartPrice")
            
            foodFrom.remove(at: indexPath.row)
            
            UserDefaults.standard.set(foodFrom, forKey: "foodFrom")
            
            tableView.reloadData()
  
        }
    }
    
    @IBOutlet weak var tableView: UITableView!

    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let itemsObj = UserDefaults.standard.object(forKey: "cart")
        
        if let tempItems = itemsObj as? [String]{
            
            cart = tempItems
            
        }
        
        let itemsObjPrice = UserDefaults.standard.object(forKey: "cartPrice")
        
        if let tempItemsPrice = itemsObjPrice as? [String]{
            
            cartPrice = tempItemsPrice
            
        }
        
        let itemsObjFrom = UserDefaults.standard.object(forKey: "foodFrom")
        
        if let tempItemsFrom = itemsObjFrom as? [String]{
            
            foodFrom = tempItemsFrom
            
        }
        
        if cart.count == 0 {
            self.navigationItem.leftBarButtonItem?.tintColor = UIColor.clear
            self.clearCart.isEnabled = false
            
        } else {
            
            self.navigationItem.leftBarButtonItem?.tintColor = nil
            self.clearCart.isEnabled = true
        }
        
        
        
        tableView.reloadData()
        
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
