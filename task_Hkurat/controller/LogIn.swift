//
//  LogIn.swift
//  task_Hkurat
//
//  Created by youssef on 3/23/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class LogIn: UIViewController {

    @IBOutlet weak var NameOrEmailtxt: UITextField!
    
    @IBOutlet weak var passwordtxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    func handelData(){
        
        guard let emailOrName = NameOrEmailtxt.text, !emailOrName.isEmpty, let password = passwordtxt.text, !password.isEmpty else{
            return
        }
        API.Login(email: emailOrName, password: password) { (status, userINF) in
            if status{
                guard let data = userINF else{
                    return
                }
                getUserData.user_data = data
                
                if let token = getUserData.user_data.token{
                    getUserData.setData(token, Key: "token")
                 
                }
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "main"){
                    self.present(vc, animated: true, completion: nil)
                }
            }else{
                self.showError("there are some problems Ckeck your Innternet" ,"Error")
            }
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
    @IBAction func Register(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "register") as? Register{
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func login(_ sender: Any) {
        handelData()
    }
}
