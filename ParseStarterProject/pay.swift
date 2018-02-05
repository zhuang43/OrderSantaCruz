//
//  pay.swift
//  ParseStarterProject-Swift
//
//  Created by huang on 11/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class pay: UIViewController {

    @IBOutlet weak var pay: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://www.paypal.com/signin?country.x=US")
        
        pay.loadRequest(URLRequest(url: url!))
    }
    @IBAction func Done(_ sender: AnyObject) {
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
