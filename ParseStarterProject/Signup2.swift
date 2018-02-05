//
//  Signup2.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/24/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

import Parse

class Signup2: UIViewController {
    
    @IBOutlet weak var warning: UILabel!
    @IBOutlet weak var addressLine1: UITextField!
    @IBOutlet weak var addressLine2: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var signUp: UINavigationBar!

    @IBOutlet var done: UIButton!
    @IBAction func done(_ sender: Any) {
   
        
        let user = PFUser()
        
        user.username = UserDefaults.standard.object(forKey: "usern") as? String
        user.password = UserDefaults.standard.object(forKey: "userp") as? String
        
        
        
        
        
        if self.addressLine1.text == "" && self.addressLine2.text == "" || self.name.text == "" || self.phoneNumber.text == "" {
            
            self.warning.text = "Oops! Please enter all information"
            
        } else {
            
            user.signUpInBackground(block: { (success, error) in
                
                if error != nil{
                    
                    let error = error as NSError?
                    
                    if let errorMessage = error?.userInfo["error"] as? String{
                        
                        self.warning.text = errorMessage
                        
                    }
                    
                } else {
                    
                    PFUser.current()?["address1"] = self.addressLine1.text!
                    
                    PFUser.current()?["address2"] = self.addressLine2.text!
                    
                    PFUser.current()?["name"] = self.name.text!
                    
                    PFUser.current()?["phoneNumber"] = self.phoneNumber.text!
                    
                    PFUser.current()?["menu"] = " "
                    
                    PFUser.current()?.saveInBackground(block: { (success, error) in
                        
                        if error != nil{
                            
                            let error = error as NSError?
                            
                            if let errorMessage = error?.userInfo["error"] as? String{
                                
                                self.warning.text = errorMessage
                                
                            }
                        }else {
                            
                            let alert = UIAlertController(title: "Congrats", message: "Sign up success", preferredStyle: UIAlertControllerStyle.alert)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                                
                                self.present((self.storyboard?.instantiateViewController(withIdentifier: "mother"))!, animated: true, completion: nil)
                                
                            }))
                            
                            self.warning.text = ""
                            self.present(alert, animated: true, completion: nil)
                            
                            
                        }
                        
                    })
                    
                    
                }
                
            })
            
            
            
        }

    }


    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
