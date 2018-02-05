//
//  Login.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/23/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

import Parse

class Login: UIViewController {

    var cart : [String] = []

    @IBOutlet weak var warning: UILabel!
    @IBOutlet weak var login: UIButton!
    @IBOutlet var pasword: UITextField!
    
    @IBOutlet var usename: UITextField!
    @IBAction func loginBtn(_ sender: AnyObject) {
  
        PFUser.logInWithUsername(inBackground: email.text!, password: password.text!) { (user, error) in
            
            if error != nil{
                
                let error = error as NSError?
                
                if let errorMessage = error?.userInfo["error"] as? String{
                    
                self.warning.text = errorMessage
                    
                self.warning.textColor = UIColor.red
            
                }
                
            }  else {
                
                
                if self.cart.count == 0 {
                    
                    print("1")
                    self.present((self.storyboard?.instantiateViewController(withIdentifier: "mother"))!, animated: true, completion: nil)
                    
                } else {
                    print("2")
                    self.performSegue(withIdentifier: "toCart", sender: self)
                    
                }
                
           }
        }
        
        
    }
    
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let tempCart = UserDefaults.standard.object(forKey: "cart") as? [String] {
            cart = tempCart
        }
    }
   
        
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = UIColor.init(red: 237, green: 237, blue: 237, alpha: 1)
        usename.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 237, green: 237, blue: 237, alpha: 1)
        
        self.tabBarController?.tabBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        email.resignFirstResponder()
        password.resignFirstResponder()
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
