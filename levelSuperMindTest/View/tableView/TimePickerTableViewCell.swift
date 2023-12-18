//
//  TimePickerTableViewCell.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import UIKit

class TimePickerTableViewCell: UITableViewCell {

    @IBOutlet weak var Datepicker: UIDatePicker!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
