//
//  Signup.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/23/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

import Parse

class Signup: UIViewController {
    
    @IBOutlet weak var warning: UILabel!
    

    
   
    @IBAction func next(_ sender: Any) {
        
        if username.text == "" || password.text == ""{
            
            warning.text = "Please enter email address and password"
            
            
        } else {
            
            
            let acticityIndicator = UIActivityIndicatorView(frame: CGRect(x:0,y:0,width:50,height:50))
            
            acticityIndicator.center = self.view.center
            
            acticityIndicator.hidesWhenStopped = true
            
            acticityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            
            acticityIndicator.startAnimating()
            
            view.addSubview(acticityIndicator)
            
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            let query = PFQuery(className: "_User")
            query.whereKey("username", equalTo:self.username.text!)
            
            query.getFirstObjectInBackground(block: { (objects, error) in
                
                if objects != nil {
                    self.warning.text="Sorry, this user name is taken."
                    acticityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                } else {
                    self.warning.text=""
                    
                    UserDefaults.standard.set(self.username.text, forKey: "usern")
                    UserDefaults.standard.set(self.password.text, forKey: "userp")
                    
                    self.present((self.storyboard?.instantiateViewController(withIdentifier: "signup2"))!, animated: true, completion: nil)
                    acticityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                }
            })

        }
        
    }

    
    

    @IBOutlet weak var username: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBAction func signup(_ sender: AnyObject) {
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
