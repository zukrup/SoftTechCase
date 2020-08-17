//
//  PagerViewCell.swift
//  SoftCaseDemo
//
//  Created by musa fedakar on 18.08.2020.
//  Copyright © 2020 musa fedakar. All rights reserved.
//

import UIKit

class PagerViewCell: UITableViewCell {

    @IBOutlet weak var pagerStateBtn : MyCellInfoButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var pagerObj:PagerObj? = nil {
        didSet {
            if let p = pagerObj {
                let remainingRecords = p.totalCount - p.currentRecordSize
                let title = String(remainingRecords) + " " + MyStrings.sharedInstance.RECORDS_REMAINING
                self.pagerStateBtn.setTitle(title, for: .normal)
            }
        }
    }
}

class PagerObj {
    
    var totalCount : Int
    var currentPage : Int
    var pageSize: Int
    var currentRecordSize : Int
    
    required init(total: Int, page: Int, pSize: Int, records: Int) {
        self.totalCount = total
        self.currentPage = page
        self.pageSize = pSize
        self.currentRecordSize = records
    }
}
