//
//  ViewController.swift
//  task_Hkurat
//
//  Created by youssef on 3/23/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class Register: UIViewController {

    
    
    @IBOutlet weak var txtPassword_Confirmation: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    
    func handelData(){
        
        guard let email = txtemail.text, !email.isEmpty, let password = txtPassword.text, !password.isEmpty, let confirmation = txtPassword_Confirmation.text , !confirmation.isEmpty,let phone = txtPhone.text , !phone.isEmpty, let name = txtName.text , !name.isEmpty else {
            return
        }
        
        if confirmation != password{
            self.showError("Error", "confirmation_password not match password ")
        }
        API.Register(name: name, password: password, phone: phone, confirmation_password: confirmation, email: email) { (status, data) in
            if status {
                guard let userInf = data else{
                    return
                }
                
                guard let userData = userInf.success else{
                    return
                }
                
                getUserData.user_data = userData
                
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

    @IBAction func Register(_ sender: UIButton) {
        handelData()
    }
    
}

