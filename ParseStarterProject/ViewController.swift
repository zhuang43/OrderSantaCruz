/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var imageFiles = [PFFile]()
    var userNames = [String]()
    var open = [Int]()
    var ID = [String]()
    
    
    

    @IBOutlet weak var tableView: UITableView!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       
       return userNames.count
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // this function is to find correct images and seller's name and display them
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! sellerCell
        
        imageFiles[indexPath.row].getDataInBackground { (data, error) in
            if let imagedata = data{
                
                if let tempImage = UIImage(data: imagedata) {
                    
                    cell.profileImage.image = tempImage
                    
                    cell.profileImage.alpha = 0.8
                    
                    print("imageSetupSuccess")
                    
                }
                
            }
            
            cell.sellerName.text = self.userNames[indexPath.row]
            
            cell.sellerName.textColor = UIColor.white
            
            cell.sellerName.alpha = 1
            
            cell.sellerName.textAlignment = NSTextAlignment.center
            
            if self.open[indexPath.row] == 1{
            
                cell.profileImage.alpha = 0.4
            
            //cell.openLabel.text = "OPEN"
            
            //cell.openLabel.textColor = UIColor.green
            
            } else if self.open[indexPath.row] == -1 {
                
                cell.profileImage.alpha = 0.93
                
                //cell.openLabel.text = "CLOSE"
                
                //cell.openLabel.textColor = UIColor.red
            }
            
            print("namesSetupSuccess")
            
        }
        
        return cell
    }
    
    
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        
        return 1
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // this is to download every seller's image and name and ID
        
        print(UserDefaults.standard.object(forKey: "cart") as? [String])
        
        print(UserDefaults.standard.object(forKey: "cartPrice") as? [String])
        
        
        let query = PFQuery(className: "Sellers")
        
        query.findObjectsInBackground(block: { (objects, error) in
  
            if error != nil{
                
                print("findObjectsError")
                
            } else {
            
                if let sellers = objects{
                
                    for object in sellers {
                    
                        if let seller = object as? PFObject {
                    
                            self.userNames.append(seller["username"] as! String)
                    
                            self.imageFiles.append(seller["profileImage"] as! PFFile)
                        
                            self.ID.append(seller["ID"] as! String)
                            
                            self.open.append(seller["isOpen"] as! Int)
                        
                            self.tableView.reloadData()

                        }
                    
                    }
                
                }
            }
            
        })
        
        
    /*
        var cart : [String] = []
        var cartPrice : [String] = []
        var foodFrom : [String] = []
        
        UserDefaults.standard.set(cart, forKey: "cart")
        UserDefaults.standard.set(cartPrice, forKey: "cartPrice")
        UserDefaults.standard.set(foodFrom, forKey: "foodFrom")
        
 */
        

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tap the row and go into the corresponding menu page
        let sellerID = ID[indexPath.row]
        
        UserDefaults.standard.set(sellerID, forKey: "ID")

        performSegue(withIdentifier: "showItems", sender: self)
        
        
    }
    
    func overrideviewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Meltix_Light_Demo.otf", size: 5)!]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
