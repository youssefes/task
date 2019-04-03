//
//  helper.swift
//  task_Hkurat
//
//  Created by youssef on 4/1/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class getUserData {
    
    static var user_data = user()
    
    
    class func callData(_ key:String)->String? {
        if let calledData = UserDefaults.standard.string(forKey: key){
            return calledData
        }else{
            return nil
        }
    }
    
    
    class func setData (_ Value:String , Key:String) {
        UserDefaults.standard.setValue(Value, forKey: Key)
        UserDefaults.standard.synchronize()
        print("done")
    }
}

extension UIViewController {

    func showError(_ errorMsg:String,_ title:String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: "\(errorMsg)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler:nil))
            self.present(alert, animated: true, completion: nil)
            alert.view.tintColor = UIColor.red
        }
    }
}
