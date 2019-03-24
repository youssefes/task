//
//  subCatagoriesVC.swift
//  task_Hkurat
//
//  Created by youssef on 3/24/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit
import Cosmos
import TinyConstraints
class subCatagoriesVC: UIViewController {

    var titleOfSubCata = ""
    @IBOutlet weak var tableViewSubCata: UITableView!
    
    @IBOutlet weak var titlelbl: UILabel!
    fileprivate func cosmonView (retaing : Double ) -> CosmosView {
        var cosmosView : CosmosView{
            let view = CosmosView()
            view.settings.fillMode = .half
            view.rating = retaing
            return view
        }
        return cosmosView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titlelbl.text = titleOfSubCata
        tableViewSubCata.dataSource = self
        tableViewSubCata.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func showMenu(_ sender: UIButton) {
        
    }

}

extension subCatagoriesVC : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subCatacell", for: indexPath) as? subCatacell
        let view = cosmonView(retaing: 5)
        cell?.ViewRating.addSubview(view)
        view.rightToSuperview()
        
        return cell!
    }
}

extension subCatagoriesVC : UITableViewDelegate{
    
}
