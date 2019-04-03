//
//  DetailsVC.swift
//  task_Hkurat
//
//  Created by youssef on 4/2/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {

    var id = 0
    var titleDe = ""
    
    @IBOutlet weak var imageProdect: UIImageView!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var titellbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        handelData()
        titellbl.text = titleDe
    }
    
    
    func handelData(){
        API.prodect(id: id) { (data, status) in
            if status {
                guard let dataprodect = data else{
                    return
                }
               self.imageProdect.kf.indicatorType = .activity
                guard  let imageUrl = dataprodect[0].image_path else{
                    return
                }
                let url = URL(string: imageUrl)
                self.imageProdect.kf.setImage(with: url)
                self.pricelbl.text = dataprodect[0].price
                self.nameLbl.text = dataprodect[0].name
            }else{
                self.showError("Error", "there are some problems Ckeck your Internet")
            }
        }
    }

    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
