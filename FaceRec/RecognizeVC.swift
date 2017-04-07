//
//  RecognizeVC.swift
//  Facial
//
//  Created by June Kim on 2017-04-01.
//  Copyright © 2017 Soulcast. All rights reserved.
//

import Foundation
import UIKit

protocol RecognizeVCDelegate: class {
  func recognizeVCDidTapCaptureButton(_:RecognizeVC)
  func recognizeVCDidTapDismiss(_:RecognizeVC)
}
class RecognizeVC: UIViewController {
  let recognizingBanner = UILabel()
  let emojiBanner = UILabel()
  let ovalOverlay = UIView()
  let captureButton = UIButton()
    let dismissButton = UIButton()
  weak var delegate: RecognizeVCDelegate?
  override func viewDidLoad() {
    super.viewDidLoad()
    recognizingBanner.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 80)
    recognizingBanner.backgroundColor = .darkGray
    recognizingBanner.textColor = .white
    recognizingBanner.font = UIFont.systemFont(ofSize: 35)
    recognizingBanner.text = "Recognizing"
    recognizingBanner.textAlignment = .center
    view.addSubview(recognizingBanner)

    emojiBanner.frame = CGRect(x: 20, y: recognizingBanner.frame.maxY, width: view.frame.width - 40, height: 60)
    emojiBanner.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    emojiBanner.textColor = .white
    emojiBanner.font = UIFont.systemFont(ofSize: 35)
    emojiBanner.textAlignment = .center
    view.addSubview(emojiBanner)
    
    let ovalLayer = CAShapeLayer()
    ovalLayer.path = UIBezierPath(ovalIn:  CGRect(x: view.frame.width * 0.22, y: view.frame.height * 0.35, width: view.frame.width * 0.56, height: view.frame.height * 0.4)).cgPath
    ovalLayer.borderWidth = 3
    ovalLayer.fillColor = UIColor.clear.cgColor
    ovalLayer.strokeColor = UIColor.white.cgColor
    ovalLayer.lineJoin = kCALineJoinRound
    ovalLayer.lineDashPattern = [3, 5]
    
    ovalOverlay.layer.addSublayer(ovalLayer)
    view.addSubview(ovalOverlay)
    
    captureButton.frame = CGRect(x: view.frame.height * 0.35, y: view.frame.height * 0.85, width: view.frame.width * 0.3, height: view.frame.height * 0.1)
    captureButton.backgroundColor = .gray
    captureButton.setTitleColor(.white, for: .normal)
    captureButton.setTitle("GO", for: .normal)
    captureButton.addTarget(self, action: #selector(didTapCaptureButton), for: .touchUpInside)
    view.addSubview(captureButton)
    
    dismissButton.frame = CGRect(x: 0, y: 15, width: 50, height: 50)
    dismissButton.setTitle("X", for: .normal)
    dismissButton.backgroundColor = .red
    view.addSubview(dismissButton)
    dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)

  }
  
  func didTapCaptureButton() {
    delegate?.recognizeVCDidTapCaptureButton(self)
  }
  
  func show(emoji:Emoji) {
    emojiBanner.text = emoji.rawValue
  }
  
  func dismissButtonTapped() {
    delegate?.recognizeVCDidTapDismiss(self)
  }
  
}
