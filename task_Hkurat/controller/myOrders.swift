//
//  Details.swift
//  task_Hkurat
//
//  Created by youssef on 3/24/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class myOrders: UIViewController {

    @IBOutlet weak var titlelbl: UILabel!
  
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func findLocation(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "mapscreen") as? SWRevealViewController{
            present(vc, animated: true, completion: nil)
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
