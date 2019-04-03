//
//  myAccount.swift
//  task_Hkurat
//
//  Created by youssef on 3/25/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit


class myAccount: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var menuBtnOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        showMenu()
        handeDataUser()
        // Do any additional setup after loading the view.
    }
    
    func handeDataUser(){
        API.get_Detailes { (status, userInformation) in
            if status{
                guard let information = userInformation else {
                    return
                }
                guard let name = information.name , let email =  information.email,let phone = information.phone else{
                    return
                }
                self.nametxt.text = name
                self.txtPhone.text = phone
                self.emailTxt.text = email
            }
        }
    }
    
    func showMenu(){
//        self.menuBtnOut.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
//        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
//        
        let TapregognizerIm = UITapGestureRecognizer(target: self, action: #selector(showAllImageToChose))
        TapregognizerIm.numberOfTapsRequired = 1
        self.profileImage.addGestureRecognizer(TapregognizerIm)
        self.profileImage.isUserInteractionEnabled = true
    }

    
    @objc func showAllImageToChose(_ sender : UITapGestureRecognizer){
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
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
    
    @IBAction func updataBtn(_ sender: UIButton) {
        
        guard let email = emailTxt.text , !email.isEmpty ,
            let Phone = txtPhone.text , !Phone.isEmpty, let name = nametxt.text, !name.isEmpty else{
                return
        }
        let image = self.profileImage.image!
        let dataImage =  image.jpegData(compressionQuality: 0.6)
        API.updataEmail(name: name, email: email, Phone: Phone, image: dataImage) { (status, dataUser) in
            if status{
                if dataUser != nil {
                    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "main"){
                        self.present(vc, animated: true, completion: nil)
                    }
                    
                }
            }else{
                self.showError("Error", "there are some problems Ckeck your Internet")
            }
        }
    }
}
extension  myAccount:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage{
            self.profileImage.image = image
           
            
        }else{
            if let imageEdit = info[.editedImage] as? UIImage{
               
            }
            
        }
        
        
        
        
        
    }
    
}
