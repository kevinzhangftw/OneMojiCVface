//
//  ButtonsVC.swift
//  Facial
//
//  Created by June Kim on 2017-04-01.
//  Copyright © 2017 Soulcast. All rights reserved.
//

import UIKit

protocol ButtonsVCDelegate: class {
  func didTapTrainButton(_ :ButtonsVC)
  func didTapRecognizeButton(_ :ButtonsVC)
}

class ButtonsVC: UIViewController {
  
  weak var buttonsDelegate: ButtonsVCDelegate?
  
  let trainButton = UIButton()
  let recognizeButton = UIButton()
  let logoLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    trainButton.frame = CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.7, width: view.frame.width * 0.4, height: view.frame.height * 0.1)
    view.addSubview(trainButton)
    trainButton.backgroundColor = .darkGray
    trainButton.setTitle("Train", for: .normal)
    trainButton.setTitleColor(.white, for: .normal)
    trainButton.addTarget(self, action: #selector(didTapTrainButton), for: .touchUpInside)
    
    recognizeButton.frame = CGRect(x: trainButton.frame.minX, y: trainButton.frame.maxY + 10, width: trainButton.frame.width, height: trainButton.frame.height)
    view.addSubview(recognizeButton)
    recognizeButton.backgroundColor = .black
    recognizeButton.setTitle("Recognize", for: .normal)
    recognizeButton.setTitleColor(.white, for: .normal)
    recognizeButton.addTarget(self, action: #selector(didTapRecognizeButton), for: .touchUpInside)
    
    
    logoLabel.frame = CGRect(x: 0, y: view.frame.height * 0.45, width: view.frame.width, height: view.frame.height * 0.1)
    logoLabel.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
    logoLabel.text = "Onemoji"
    logoLabel.font = UIFont(name: "chalkduster", size: 30)
    logoLabel.textAlignment = .center
    view.addSubview(logoLabel)
  }
  
  func didTapTrainButton() {
    buttonsDelegate?.didTapTrainButton(self)
  }
  func didTapRecognizeButton() {
    buttonsDelegate?.didTapRecognizeButton(self)
  }
}
