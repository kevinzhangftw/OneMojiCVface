//
//  CoreImageHelper.swift
//  Facial
//
//  Created by June Kim on 2017-04-01.
//  Copyright © 2017 Soulcast. All rights reserved.
//

import Foundation
import CoreImage
import UIKit

struct CIDetectionResult {
  let mouthRect: CGRect
  let eyeCount: Int
}

struct CoreImageHelper {

  static func detect(from image:UIImage) -> CIDetectionResult? {
    let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]

    guard let personciImage = CIImage(image: image),
      let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy) else {
        assert(false, "OOPS")
        return nil
    }
    
    var eyeCounter = 0
    let faces = faceDetector.features(in:personciImage)
    for face in faces as! [CIFaceFeature] {
      if face.hasLeftEyePosition && !face.leftEyeClosed { eyeCounter += 1 }
      if face.hasRightEyePosition && !face.rightEyeClosed { eyeCounter += 1 }
    
//      let faceRect = CGRect(x: face.bounds.minX, y: image.size.height - face.bounds.maxY, width: face.bounds.width, height: face.bounds.height)
//      return faceRect
//      
      if face.hasMouthPosition {
        print("Mouth position is \(face.mouthPosition)")
        let mouthWidth = face.bounds.width * 0.7
        let mouthHeight = mouthWidth * 0.67
        let mouthRect = CGRect(
          x: (face.mouthPosition.x) - mouthWidth / 2,
          y: (image.size.height - face.mouthPosition.y) - mouthHeight * 0.2,
          width: mouthWidth,
          height: mouthHeight)
        
        return CIDetectionResult(mouthRect: mouthRect, eyeCount: eyeCounter)
      }
    }
    return nil
  }
  
}
