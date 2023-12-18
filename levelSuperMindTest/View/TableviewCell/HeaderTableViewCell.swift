//
//  HeaderTableViewCell.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var ExploreButtonOutlet: UIButton!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var View: CardView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ImageView.layer.cornerRadius=8
        ExploreButtonOutlet.layer.cornerRadius=8
        ExploreButtonOutlet.layer.borderColor = UIColor(.white).cgColor
        ExploreButtonOutlet.layer.borderWidth = 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
