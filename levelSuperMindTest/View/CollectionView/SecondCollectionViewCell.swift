//
//  SecondCollectionViewCell.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Bclgroundimage: UIImageView!
    @IBOutlet weak var PersonImage: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        Bclgroundimage.layer.cornerRadius=8
        if let gifURL = Bundle.main.url(forResource: "Gif", withExtension: "gif") {
            let gifData = try? Data(contentsOf: gifURL)
        PersonImage.image = UIImage.gif(data: gifData!)
        }
    }

}
