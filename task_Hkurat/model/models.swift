//
//  userRegister.swift
//  task_Hkurat
//
//  Created by youssef on 4/1/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation

/*
 "success": {
 "name": "samer",
 "email": "asssdsa@yahoo.com",
 "phone": "027356354344272",
 "password": "$2y$10$XHO2cEJMuTfeFasg/cmLy.JcS94pkZKwgKDgufaG71/2oEVUd1TP6",
 "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjU3ODQ1ZWFmZDVjZmE5NTkwZmQxNDg5ZDkyNjI1NjA4YjQzZWMxZTUyMmJhNTdmYzdjZWYwOWJmZWRkODRhNTAzYjM1NWVmMzUwN2MwNmNjIn0.eyJhdWQiOiIxIiwianRpIjoiNTc4NDVlYWZkNWNmYTk1OTBmZDE0ODlkOTI2MjU2MDhiNDNlYzFlNTIyYmE1N2ZjN2NlZjA5YmZlZGQ4NGE1MDNiMzU1ZWYzNTA3YzA2Y2MiLCJpYXQiOjE1NTQxNDcwOTQsIm5iZiI6MTU1NDE0NzA5NCwiZXhwIjoxNTg1NzY5NDk0LCJzdWIiOiIzMiIsInNjb3BlcyI6W119.Koc7M-Sy9CprRnu18mzHHKLpgNfPQvY1Q8aY5eKjHeKivTqy0AomQdEGMMYZCrQTRndDzwbZj28-rKi39alZqHyVOXpnd6-Oc1Se1aEPIBiyiEr93M1_rbGUhQfj21DRix1oxuC1ucWq6a6NLuexm5-4PrZaBLEnyJV9j8I4CprzfnQfZ-nzvW9zJ-vYLUNhn0gccWLztPD565Agk2U-OdVWDzOwKh7EARmLdPq3mL3_CwKxSq8XUZmdL5YaOG3956OJTYfNdFZhALicZ4kqSjTHe4CQbvITvhchdIkZNXDKw5W_7qFpPsPluOKobC0mU5jYt1ox1azbNnoEpS6vlxTx4rN0nkkoAepTtSI8N394afCJoflGtdEE2P59egsX3gRUluBvePCOQdVQ1AUNg9aLwg6wjDM0QOVlrXxDBU9hCFSD7Og9KFuKjyz98vO8oMRK5F1ljAbWsSEBuAV6eYzFrXtmeqCOwTKS1jEjuqBTrMkO6pCwJyjxYt05CKBJvxTYvFGAwdAb4xl_I6cJsiD8upvlUcrKzBYiX9CY5Cn1xJ6zhOnGd0v-jDWytdJRKXTFzO8nzC7sU4bx-6zh69fR5jLlJVueuNMPfZywePoIUbjrv7Y0Asun0WsuJXSGUjT27-H8LCfuExwO7fp_sTg9OVSS_gklKun4c73SWAE"
 }
 
 */

struct userData : Codable {
    var success : user?
}
struct userIfo : Codable {
    var user : user?
}

struct user : Codable{
    var name : String?
    var email :String?
    var phone : String?
    var password : String?
    var token : String?
}

struct productdata : Codable {
    var product : [categores]?
}

struct categores : Codable {
    var id : Int?
    var name : String?
    var image : String
    var image_path : String?
    var price : String?
}

struct productData {
    var name : String?
    var image : String?
    var id : Int?
    var image_path : String
    var price : String?
    
}

struct userDetail : Codable{
   var success : userDetails?
}

struct userDetails : Codable {
    var id : Int?
    var name : String?
    var email : String?
    var phone : String?
    var email_verified_at : String?
    var front_card : String?
    var back_card : String?
    var front_licence : String?
    var back_licence : String?
    var lang:String?
    var lat : String?
    var code : Int?
    var created_at : String?
    var updated_at : String?
    var image_front_card : String?
    var image_back_card : String?
    var image_front_licence : String?
    var image_back_licence : String?
}
