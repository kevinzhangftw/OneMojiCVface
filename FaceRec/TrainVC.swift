//
//  TrainVC.swift
//  Facial
//
//  Created by June Kim on 2017-04-01.
//  Copyright © 2017 Soulcast. All rights reserved.
//

import Foundation
import UIKit

protocol TrainVCDelegate: class {
  func trainVCDidTapCaptureButton(_:TrainVC)
  func trainVCDidTapDismiss(_:TrainVC)
}

class TrainVC: UIViewController {
  let trainingBanner = UILabel()
  let instructionBanner = UILabel()
  let ovalOverlay = UIView()
  let captureButton = UIButton()
  let dismissButton = UIButton()
  let instructionPrefix = ""
  var currentEmoji: Emoji = Emoji(rawValue: "")!
  weak var delegate: TrainVCDelegate?
  override func viewDidLoad() {
    trainingBanner.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 80)
    trainingBanner.backgroundColor = .darkGray
    trainingBanner.textColor = .white
    trainingBanner.font = UIFont.systemFont(ofSize: 40)
    trainingBanner.text = "Training"
    trainingBanner.textAlignment = .center
    view.addSubview(trainingBanner)

    instructionBanner.frame = CGRect(x: 20, y: trainingBanner.frame.maxY, width: view.frame.width - 40, height: 60)
    instructionBanner.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    instructionBanner.textColor = .white
    instructionBanner.font = UIFont.systemFont(ofSize: 135)
    instructionBanner.textAlignment = .center
    view.addSubview(instructionBanner)
    
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
    captureButton.setTitle("OK", for: .normal)
    captureButton.addTarget(self, action: #selector(didTapCaptureButton), for: .touchUpInside)
    view.addSubview(captureButton)
    
    dismissButton.frame = CGRect(x: 0, y: 15, width: 50, height: 50)
    dismissButton.setTitle("X", for: .normal)
    dismissButton.backgroundColor = .red
    view.addSubview(dismissButton)
    dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    trainFor(emoji: .rbs)
  }
  
  fileprivate func trainFor(emoji: Emoji) {
    currentEmoji = emoji
    instructionBanner.text = instructionPrefix + emoji.rawValue
  }
  
  func didTapCaptureButton() {
    delegate?.trainVCDidTapCaptureButton(self)
  }

  func instructNext() {
    trainFor(emoji: EmojiTranslation.nextEmoji(from: currentEmoji))
  }
  
  func dismissButtonTapped() {
    delegate?.trainVCDidTapDismiss(self)
  }
  
  
}
