//
//  extension UIImage.swift
//  Facial
//
//  Created by June Kim on 2017-04-01.
//  Copyright © 2017 Soulcast. All rights reserved.
//

import Foundation
import UIKit
import Photos

extension UIImage {
  func rotatedRight() -> UIImage {
    let rotatedViewBox: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.size.height, height: self.size.width))
    let t: CGAffineTransform = CGAffineTransform(rotationAngle: 90 * CGFloat(Double.pi / 180))
    rotatedViewBox.transform = t
    let rotatedSize: CGSize = rotatedViewBox.frame.size
    UIGraphicsBeginImageContext(rotatedSize)
    let bitmap: CGContext = UIGraphicsGetCurrentContext()!
    bitmap.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
    bitmap.rotate(by: (90 * CGFloat(Double.pi / 180)))
    bitmap.scaleBy(x: 1.0, y: -1.0)
    bitmap.draw(self.cgImage!, in: CGRect(x: -self.size.height / 2, y: -self.size.width / 2, width: self.size.height, height: self.size.width))
    let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
  }
  func crop(_ rect:CGRect) -> UIImage{
    let imageRef:CGImage = self.cgImage!.cropping(to: rect)!
    let croppedImage:UIImage = UIImage(cgImage:imageRef)
    return croppedImage
  }
  
  static func saveToPhotoLibrary(_ image:UIImage) {
    PHPhotoLibrary.shared().performChanges({
      PHAssetChangeRequest.creationRequestForAsset(from: image)
    }, completionHandler: { success, error in
      if success {
        // Saved successfully!
      }
      else if let error = error {
        // Save photo failed with error
        print(error.localizedDescription)
      }
      else {
        // Save photo failed with no error
      }
    })
  }
  func resized(to targetSize: CGSize) -> UIImage {
    let size = self.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
      newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
      newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x:0, y:0, width:newSize.width, height:newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    
    return newImage
  }
}
