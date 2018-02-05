//
//  CheckoutViewController.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/31/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

import Parse

class CheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cart : [String] = []
    var cartPrice : [String] = []
    var foodFrom : [String] = []
    
    var prices : [String] = []
    
    var totalPrice : Float = 0

    var address1 = ""
    
    var address2 = ""
    
    var name = ""
    
    var phonenumber = ""
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 1
        
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        
        return 1
        
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CheckOutCell
        
        cell?.address1.text = PFUser.current()?["address1"] as! String?
        
        address1 = (cell?.address1.text)!
        
        cell?.address2.text = PFUser.current()?["address2"] as! String?
        
        address2 = (cell?.address2.text)!
        
        cell?.name.text = PFUser.current()? ["name"] as! String?
        
        name = (cell?.name.text)!
        
        cell?.phoneNumber.text = PFUser.current()?["phoneNumber"] as! String?
        
        phonenumber = (cell?.phoneNumber.text)!
        
        cell?.totalPrice.text = "\(totalPrice)"
        
        return cell!
        
        
    }
    @IBAction func confirm(_ sender: AnyObject) {
        
        print(cart)
        
        print(cartPrice)
        
        print(foodFrom)

        let orders = PFObject(className: "Orders")
        
        orders["sellerID"] = foodFrom[0]
        
        orders["buyerName"] = name
        
        orders["buyerAddress1"] = address1
        
        orders["buyerAddress2"] = address2
        
        orders["buyerPhoneNumber"] = phonenumber
        
        orders["order"] = cart
        
        orders["totalPrice"] = totalPrice
        
        //orders["orderTime"] = NSData()
        let date = NSDate()
      
        var calendar = NSCalendar.current
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date as Date)
        
        let day = components.day
        
        let month = components.month
        
        let year = components.year

        let hour = components.hour
        
        let min = components.minute
        
        let time = "\(month!).\(day!).\(year!) \(hour!):\(min!)"

        orders["time"] = time
        
        orders["done"] = -1
        
        orders.saveInBackground { (success, error) in
            
            if error != nil {
                
                print("confirm error")
                
            } else {
                
                print("confirm success")
                
            }
            
        }
        
        
        
        
        
        self.performSegue(withIdentifier: "paypal", sender: self)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        prices = (UserDefaults.standard.object(forKey: "cartPrice") as? [String])!
        
        for price in prices{
            
            totalPrice+=Float(price)!
            
        }
        

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
