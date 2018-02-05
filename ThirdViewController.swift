//
//  ThirdViewController.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 10/23/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

import Parse

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    let profileCells = ["Manage address", "Contact us"]
    

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var logout: UIButton!
    
    @IBAction func logoutAction(_ sender: AnyObject) {
        
        let acticityIndicator = UIActivityIndicatorView(frame: CGRect(x:0,y:0,width:50,height:50))
        
        acticityIndicator.center = self.view.center
        
        acticityIndicator.hidesWhenStopped = true
        
        acticityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        acticityIndicator.startAnimating()
        
        view.addSubview(acticityIndicator)
        
        PFUser.logOut()
        
        login.isHidden = false
        
        label.text = "User"
        
        label.alpha = 0.6
        
        logout.isHidden = true
        
        let cart : [String] = []
        
        let cartPrice : [String] = []
        
        let foodFrom: [String] = []
        
        UserDefaults.standard.set(cart, forKey: "cart")
        
        UserDefaults.standard.set(cartPrice, forKey: "cartPrice")
        
        UserDefaults.standard.set(foodFrom, forKey: "foodFrom")
        
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        acticityIndicator.stopAnimating()
        
        UIApplication.shared.endIgnoringInteractionEvents()
        
        let alert = UIAlertController(title: "Logout Success", message: "", preferredStyle: .alert)
        
        /* let subview = alert.view.subviews.first! as UIView
         let alertContentView = subview.subviews.first! as UIView
         alertContentView.backgroundColor = UIColor.black
         alertContentView.layer.cornerRadius = 15
         alert.view.tintColor = UIColor.white;*/
        
        self.present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 0.5
        
        DispatchQueue.main.asyncAfter(deadline: when){
            
            alert.dismiss(animated: true, completion: nil)
        }
        

        
        
    }
    @IBOutlet weak var login: UIButton!
    
    @IBAction func loginSignup(_ sender: AnyObject) {
        
        // self.performSegue(withIdentifier: "loginSignup", sender: self)
        
        self.performSegue(withIdentifier: "goSignUp", sender: self)
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 2
        
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let Cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! thirdViewCell
        
        var cell1 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell1")
        
        var cell1Label = ""
        
        if let tempLabel = profileCells[indexPath.row] as? String{
            
            cell1Label = tempLabel
            
        }
        var image : UIImage? = nil
        
        if let tempImage = UIImage(named: "\(indexPath.row+1).png")! as? UIImage{
            
            image = tempImage
            
        }

        Cell1.itemImage.image = image
        
        Cell1.itemLabel?.text = cell1Label
        
        cell1 = Cell1
        
        return cell1
        
        
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        
        
        tableView.sectionHeaderHeight = 300
        
        tableView.sectionFooterHeight = 400
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if  PFUser.current()?.username != nil {
            
            login.isHidden = true
            
            logout.isHidden = false
            
            label.text = PFUser.current()?["name"] as? String
            
        } else {
            
            login.isHidden = false
            
            label.text = "User"
            
            label.alpha = 0.6
            
            logout.isHidden = true
            
        }
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
       // label.text = PFUser.current()?["name"] as? String
        
    }
    
     /*   let query = PFQuery(className: "User")
        
        query.getObjectInBackground(withId: (PFUser.current()?.objectId)!){ (object, error) in
         
            if error != nil {
              
                
            } else{
                
                if let user = object {
                    
                    print("name")
                    
                    self.profileName.text = user["name"] as? String!
                    
                }
                
                
            }
            */
            
 
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "  "
        
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        return "  "
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
