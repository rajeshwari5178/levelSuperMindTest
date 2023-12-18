//
//  GolasCollectionViewCell.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import UIKit

class GolasCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Labeltwo: UILabel!
    @IBOutlet weak var Bclgroundimage: UIImageView!
    
    @IBOutlet weak var lbelOne: UILabel!
    @IBOutlet weak var PersonImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        lbelOne.alpha = 0.0

               // Perform a fade-in animation
               UIView.animate(withDuration: 1.0) {
                   self.lbelOne.alpha = 1.0
               }
        Bclgroundimage.layer.cornerRadius=8
        
    }

}
