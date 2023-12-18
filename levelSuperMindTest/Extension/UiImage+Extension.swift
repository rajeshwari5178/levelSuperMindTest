//
//  UiImage+Extension.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import Foundation
import UIKit
extension UIImage {

    // Function to create a UIImage from GIF data
    class func gif(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("Error: Unable to create image source from gif data.")
            return nil
        }

        let count = CGImageSourceGetCount(source)
        var images = [CGImage]()

        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(cgImage)
            }
        }

        let gifImages = images.map { UIImage(cgImage: $0) }
        return UIImage.animatedImage(with: gifImages, duration: Double(count) * 0.1)
    }
}
