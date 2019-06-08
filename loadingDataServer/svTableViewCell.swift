//
//  svTableViewCell.swift
//  loadingDataServer
//
//  Created by Lai Minh on 6/7/19.
//  Copyright © 2019 LaiMinh. All rights reserved.
//

import UIKit

class svTableViewCell: UITableViewCell {

    @IBOutlet weak var HOTEN: UILabel!
    
    @IBOutlet weak var NAMSINH: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
