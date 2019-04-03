//
//  Catagories.swift
//  task_Hkurat
//
//  Created by youssef on 3/24/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit
import Kingfisher

class Catagories: UIViewController {
    @IBOutlet weak var catagoriesTableView: UITableView!
    
    @IBOutlet weak var menuBtnOut: UIButton!
    var Catagoreies = [categores]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        catagoriesTableView.dataSource = self
        catagoriesTableView.delegate = self
        handelData()
        showMenu()
    }
    
    func handelData(){
        API.categories { (status, catagories) in
            if status{
                if let catagore = catagories{
                    self.Catagoreies = catagore
                    self.catagoriesTableView.reloadData()
                }else{
                    self.showError("Error", "there are some problems Ckeck your Innternet")
                }
                
            }
        }
    }
    
    func showMenu(){
        self.menuBtnOut.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension Catagories : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Catagoreies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCatagories", for: indexPath) as? cellData
        if  let name = Catagoreies[indexPath.row].name {
            cell?.nameCatagories.text = name
        }
        DispatchQueue.main.async {
            if let image_path = self.Catagoreies[indexPath.row].image_path{
                let image_Url = URL(string: image_path)
                cell?.mainImage.kf.indicatorType = .activity
                cell?.mainImage.kf.setImage(with: image_Url)
            }
        }
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vcData = storyboard?.instantiateViewController(withIdentifier: "subCatagoriesVC") as? subCatagoriesVC{
            if Catagoreies.count > 0{
                vcData.id = self.Catagoreies[indexPath.row].id!
                vcData.titleOfSubCata = self.Catagoreies[indexPath.row].name!
                present(vcData, animated: true, completion: nil)
            }
           
        }
        
    }
    
    
}
extension Catagories : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
}
