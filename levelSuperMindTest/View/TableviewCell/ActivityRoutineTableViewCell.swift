//
//  ActivityRoutineTableViewCell.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import UIKit

class ActivityRoutineTableViewCell: UITableViewCell {
    @IBOutlet weak var Bclgroundimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        Bclgroundimage.layer.cornerRadius=8
        if let backgroundImage = UIImage(named: "Tblebckground") {
                  let patternImageView = UIImageView(image: backgroundImage)
                  patternImageView.contentMode = .scaleAspectFill // Adjust the content mode as needed
                  contentView.backgroundColor = UIColor(patternImage: backgroundImage)
              }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
