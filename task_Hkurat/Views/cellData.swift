//
//  cellData.swift
//  task_Hkurat
//
//  Created by youssef on 3/24/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class cellData: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var nameCatagories: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
