//
//  menuVC.swift
//  task_Hkurat
//
//  Created by youssef on 3/25/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class menuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func myAccount(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "myAccount") as? SWRevealViewController{
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func contect_Us(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "contact_Us") as? SWRevealViewController{
             present(vc, animated: true, completion: nil)
        }
       
    }
   
    @IBAction func workWithUs(_ sender: UIButton) {
        
     }
    

}
