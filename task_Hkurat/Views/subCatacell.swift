//
//  subCatacell.swift
//  task_Hkurat
//
//  Created by youssef on 3/24/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class subCatacell: UITableViewCell {

    @IBOutlet weak var imageSub: UIImageView!
    
    @IBOutlet weak var limitlbl: UILabel!
    @IBOutlet weak var distancelbl: UILabel!
    @IBOutlet weak var timelbl: UILabel!
    @IBOutlet weak var ViewRating: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
