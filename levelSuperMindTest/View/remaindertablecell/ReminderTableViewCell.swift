//
//  ReminderTableViewCell.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {
    var switchValueChanged: ((Bool) -> Void)?
    @IBOutlet weak var SwitchButton: UISwitch!
    @IBOutlet weak var Timealbel: UILabel!
    @IBOutlet weak var View: CardView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let hexColorString = "#AF52DE"

        if let hexColor = UIColor(hexString: hexColorString) {
            View.layer.borderColor = hexColor.cgColor
           
        } else {
            // Handle invalid hex color string
            print("Invalid hex color string")
        }
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func switchValueChanged(_ sender: UISwitch) {
           switchValueChanged?(sender.isOn)
       }
}
