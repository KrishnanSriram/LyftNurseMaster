//
//  ServiceTimelineCellTableViewCell.swift
//  LyftNurseMaster
//
//  Created by Krishnan Sriram Rama on 3/24/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class ServiceTimelineCellTableViewCell: UITableViewCell {

    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labeldescription: UILabel!
    @IBOutlet weak var labelSubject: UILabel!
    @IBOutlet weak var labelDistance: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
