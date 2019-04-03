//
//  contact_Us.swift
//  task_Hkurat
//
//  Created by youssef on 3/25/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class contact_Us: UIViewController {

    @IBOutlet weak var menuBtnOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        showMenu()

        // Do any additional setup after loading the view.
    }
    

    func showMenu(){
        self.menuBtnOut.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
