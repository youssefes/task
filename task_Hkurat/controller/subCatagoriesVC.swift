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
import Kingfisher
class subCatagoriesVC: UIViewController {

   
    var titleOfSubCata = ""
    var id = 0
    var productsData = [productData]()
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

        print(id)
        titlelbl.text = titleOfSubCata
        tableViewSubCata.tableFooterView = UIView()
        tableViewSubCata.separatorInset = .zero
        tableViewSubCata.contentInset = .zero
        tableViewSubCata.dataSource = self
        tableViewSubCata.delegate = self
        handelData()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //showMenu()
    }
    
    func handelData(){
        API.products(id: 2) { (status, prodects) in
            if status{
                guard let AllProdects = prodects else{
                    return
                }
                self.productsData = AllProdects
                print(self.productsData)
                self.tableViewSubCata.reloadData()
            }else{
                self.showError("there are some problems Ckeck your Innternet" ,"Error")
            }
        }
    }

//    func showMenu(){
//        self.menuBtnOut.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
//        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension subCatagoriesVC : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subCatacell", for: indexPath) as? subCatacell
        let view = cosmonView(retaing: 5)
        
        let Image_path = productsData[indexPath.row].image_path
        let urlImage = URL(string: Image_path)
        cell?.ViewRating.addSubview(view)
        cell?.imageSub.kf.indicatorType = .activity
        cell?.imageSub.kf.setImage(with: urlImage)
        cell?.pricelbl.text = productsData[indexPath.row].price
        cell?.titleProdect.text = productsData[indexPath.row].name
        view.rightToSuperview()
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailsVC {
            if productsData.count > 0{
                vc.titleDe = self.productsData[indexPath.row].name!
                vc.id = self.productsData[indexPath.row].id!
                present(vc, animated: true, completion: nil)
            }
            
        }
        
    }
}

extension subCatagoriesVC : UITableViewDelegate{
    
}
