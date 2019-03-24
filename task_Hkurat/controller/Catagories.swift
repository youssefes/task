//
//  Catagories.swift
//  task_Hkurat
//
//  Created by youssef on 3/24/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class Catagories: UIViewController {
    @IBOutlet weak var catagoriesTableView: UITableView!
    
    var CatagoriesImage = ["food","background","cofe","other"]
    var CatagoreiesName = ["المطاعم والماكولات","خضراوات وبقالة","كفيهات","طلبات اخري"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        catagoriesTableView.dataSource = self
        catagoriesTableView.delegate = self
        
    }

}

extension Catagories : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCatagories", for: indexPath) as? cellData
        let image = self.CatagoriesImage[indexPath.row]
        let name = self.CatagoreiesName[indexPath.row]
        cell?.mainImage.image = UIImage(named: image)
        cell?.nameCatagories.text = name
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "subCatagoriesVC") as? subCatagoriesVC{
            vc.titleOfSubCata = CatagoreiesName[indexPath.row]
            present(vc, animated: true, completion: nil)
        }
        
    }
    
    
}
extension Catagories : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
}
