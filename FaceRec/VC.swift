//
//  VC.swift
//  iOS-OpenCV-FaceRec
//
//  Created by Kai Zhang on 2017-04-04.
//  Copyright © 2017 Fifteen Jugglers Software. All rights reserved.
//

import Foundation
import UIKit

@objc class VC: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(FJFaceRecognitionViewController(), animated: true, completion: nil)
    }
}
