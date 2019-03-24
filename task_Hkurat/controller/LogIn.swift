//
//  LogIn.swift
//  task_Hkurat
//
//  Created by youssef on 3/23/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class LogIn: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func Register(_ sender: UIButton) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "register") as? Register {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
