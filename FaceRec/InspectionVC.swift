//
//  InspectionVC.swift
//  Facial
//
//  Created by June Kim on 2017-04-01.
//  Copyright © 2017 Soulcast. All rights reserved.
//

import Foundation
import UIKit

class InspectionVC: UIViewController {
  
  let imageView = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.1, width: view.frame.width * 0.8, height: view.frame.height * 0.8)
    imageView.contentMode = .scaleAspectFit
    view.addSubview(imageView)
    view.isUserInteractionEnabled = false
  }
  
  func inspect(_ image:UIImage) {
    imageView.image = image
  }
  
}
