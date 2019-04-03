//
//  API.swift
//  task_Hkurat
//
//  Created by youssef on 4/1/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API : UIViewController{

   
   
    
    // MARK Register request
    class func Register(name : String, password : String, phone: String, confirmation_password : String,email : String , complation : @escaping (_ status : Bool , _ Data: userData?)-> Void){
        
        
        
        guard let url = URL(string: "http://ksaa.elhdf.com.sa/api/register") else{
            return
        }
        
        let Parameter : Parameters = [
            "email" : email,
            "password_confirmation" : confirmation_password,
            "password" : password,
            "phone" : phone,
            "name" : name
        ]
        
        Alamofire.request(url, method: .post, parameters: Parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { (respond) in
            switch respond.result{
            case .failure(let error):
                print(error)
                complation(false, nil)
            case .success(_):
                do{
                    let item = try JSONDecoder().decode(userData.self, from: respond.data!)
                    complation(true, item)
                }catch{
                    complation(false,nil)
                }
            }
        }
    }
    
    
    
    // MARK login Request
    
    class func Login(email : String , password : String, complation: @escaping (_ status : Bool, _ userIn : user?)-> Void){
        
        guard let url = URL(string: "http://ksaa.elhdf.com.sa/api/login") else{
            return
        }
        
        let paramerter : Parameters = [
            "email" : email,
            "password" : password
        ]
        
        Alamofire.request(url, method: .post, parameters: paramerter, encoding: JSONEncoding.default, headers: nil
            ).responseJSON { (respond) in
                
                do {
                    let user = try JSONDecoder().decode(userIfo.self, from: respond.data!)
                
                    
                    guard let UserIn = user.user else{
                        complation(false, nil)
                        return
                    }
                    complation(true, UserIn)
                }catch{
                    complation(false, nil)
                }
        }
    }
    
    
    // MARK : categories Request
    
    class func categories(complation : @escaping ( _ status: Bool, _ categores : [categores]? )->Void){
        
        guard let url = URL(string: "http://ksaa.elhdf.com.sa/api/categories") else{
            return
        }
        
        guard let Token = getUserData.callData("token") else{
            return
        }
        let header : HTTPHeaders = [
            "Accept" : "application/json",
            "Authorization" : "Bearer \(Token)"
        ]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (respond) in
            
            switch respond.result{
            case .failure(let error):
                print(error)
                complation(false,nil)
            case .success(let value):
                let json = JSON(value)
                
                guard let data = json["categores"].array else{
                    return
                }
                
                var catagories = [categores]()
                
                for catagorie in data {
                     let name = catagorie["name"].stringValue
                    guard  let id = catagorie["id"].int else{
                        return
                    }
                    let image_path = catagorie["image_path"].stringValue
                    let image = catagorie["image"].stringValue
                    let catagory = categores.init(id: id, name: name, image: image, image_path: image_path, price: nil)
                    catagories.append(catagory)
                }
                
                complation(true,catagories)
            }
            
            
        }
    }
    // MARK : products
    
    class func products(id : Int , complation:@escaping (_ status : Bool , _ product : [productData]?)->Void){
        
        guard let url = URL(string: "http://ksaa.elhdf.com.sa/api/categories/\(id)/products") else {
            return
        }
        
        guard let Token = getUserData.callData("token") else{
            return
        }
        let header : HTTPHeaders = [
            "Accept" : "application/json",
            "Authorization" : "Bearer \(Token)"
        ]
       
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (respond) in
            switch respond.result{
            case .failure(let erroe):
                print(erroe)
                complation(false, nil)
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let data = json["product"].array else{
                    return
                }
                
                var products = [productData]()
                
                for catagorieproducts in data {
                    let name = catagorieproducts["name"].stringValue
                    guard  let id = catagorieproducts["id"].int else{
                        return
                    }
                    let image_path = catagorieproducts["image_path"].stringValue
                    let image = catagorieproducts["image"].stringValue
                    guard let price = catagorieproducts["price"].string else {
                        return
                    }
                    let product = productData.init(name: name, image: image, id: id, image_path: image_path, price: price)
                    products.append(product)
                }
                
                complation(true,products)
            }
        }
    }
    
    // MARK : UPdataRequest
    class func updataEmail(name : String , email : String , Phone : String,image : Data?, complation : @escaping (_ status : Bool ,_ data:user? )-> Void){
        
        guard let url = URL(string: "http://ksaa.elhdf.com.sa/api/update?email=\(email)&name=\(name)&phone=\(Phone)") else{
            return
        }
        guard let Token = getUserData.callData("token") else{
            return
        }
        let header : HTTPHeaders = [
            "Accept" : "application/json",
            "Authorization" : "Bearer \(Token)"
        ]
        
        DispatchQueue.global(qos:.userInteractive).async {
            
            Alamofire.upload(multipartFormData: { (form : MultipartFormData) in
                DispatchQueue.main.async {
                    form.append(image!, withName: "img", fileName: "photo.jpeg", mimeType: "image/jpeg")
                    
                }
                
                
            }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url, method: .put, headers: header) { (reselt : SessionManager.MultipartFormDataEncodingResult) in
                switch reselt{
                case .failure(let error):
                    complation(false, nil)
                    print(error)
                case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                    upload.uploadProgress(closure: { (progress) in
                        print(progress)
                    }).responseJSON(completionHandler: { (respond) in
                        
                        switch respond.result{
                        case .failure(let error):
                            print(" the is an error ->\(error)")
                        case .success(let value):
                            print(value)
                            do {
                                let data = try JSONDecoder().decode(userIfo.self, from: respond.data!)
                                complation(true, data.user)
                            }catch{
                                print(error)
                            }
                            
                            
                        }
                    })
                }
            }
            
        }
        
    }
    
    // MARK : Prodects
    
    class func prodect(id: Int, complation : @escaping (_ prodect : [categores]?, _ status : Bool)->Void){
        
        
        guard let Url = URL(string: "http://ksaa.elhdf.com.sa/api/product/\(id)") else{
            return
        }
        
        guard let Token = getUserData.callData("token") else{
            return
        }
        let header : HTTPHeaders = [
            "Accept" : "application/json",
            "Authorization" : "Bearer \(Token)"
        ]
        
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (respond) in
            do {
                let data = try JSONDecoder().decode(productdata.self, from: respond.data!)
                print(data)
                var prod = [categores]()
                
                for product in data.product!{
                    prod.append(product)
                }
                complation(prod, true)
            }catch{
                print(error)
                complation(nil, false)
            }
        }
    }
    
    //Mark : Get_Details
    
    class func get_Detailes(complation : @escaping (_ status: Bool, _ userD : userDetails? )-> Void){
        
        
        guard let Url = URL(string: "http://ksaa.elhdf.com.sa/api/get-details") else{
            return
        }
        guard let Token = getUserData.callData("token") else{
            return
        }
        let header : HTTPHeaders = [
            "Accept" : "application/json",
            "Authorization" : "Bearer \(Token)"
        ]
        
        Alamofire.request(Url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (respond) in
            
            
            
            do {let result = try JSONDecoder().decode(userDetail.self, from: respond.data!)
                if  let dataus = result.success {
                    complation(true, dataus)
                }
                
            }catch{
                print(error)
                complation(false, nil)
            }
        }
    }
}
