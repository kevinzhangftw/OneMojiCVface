//
//  ContainerVC.swift
//  Facial
//
//  Created by June Kim on 2017-04-01.
//  Copyright © 2017 Soulcast. All rights reserved.
//

import Foundation
import UIKit

enum CaptureMode {
  case none
  case training
  case recognizing
}

class ContainerVC: UIViewController, CamVCDelegate, ButtonsVCDelegate, TrainVCDelegate, RecognizeVCDelegate {
  
  var camVC: CamVC!
  var buttonsVC: ButtonsVC!
  var trainVC: TrainVC!
  var recognizeVC: RecognizeVC!
  var inspectionVC: InspectionVC!
  var captureMode: CaptureMode = .none
  
  override func viewDidLoad() {
    camVC = CamVC()
    camVC.delegate = self

    buttonsVC = ButtonsVC()
    buttonsVC.buttonsDelegate = self
    
    trainVC = TrainVC()
    trainVC.delegate = self
    
    recognizeVC = RecognizeVC()
    recognizeVC.delegate = self
    
    inspectionVC = InspectionVC()
    
    add(camVC)
    add(buttonsVC)
  }
  
  func didCapture(image: UIImage) {
    //TODO: depends on mode...
    //detect eyes mouth 
    let rotatedImage = image.rotatedRight()
    guard let result = CoreImageHelper.detect(from: rotatedImage) else { assert(false); return }
    let mouthRect = result.mouthRect
    var eyePosition:EyePosition = .unknown
    switch result.eyeCount {
    case 0: eyePosition = .bothClosed
    case 1: eyePosition = .openClosed
    case 2: eyePosition = .bothOpen
    default : assert(false, "OOPS")
    }
    let mouthImage = rotatedImage.crop(mouthRect).resized(to: CGSize(width: 200, height: 134))
    if inspectionVC.view.superview == nil {
      add(inspectionVC)
    }
    switch captureMode {
    case .training:
      let label = EmojiTranslation.mouthPosition(from: trainVC.currentEmoji)
      //emojiLearner.train(mouthImage, label)
      //completion:  
      trainVC.instructNext()
    case .recognizing:
      let result = 0
      // let result =  emojiLearner.recognize(mouthImage)
      let mouthPosition = MouthPosition(rawValue: result)!
      let recognizedEmoji = EmojiTranslation.emoji(from: mouthPosition, eyePosition: eyePosition)
      recognizeVC.show(emoji: recognizedEmoji)
    default:
      break
    }
    //inspectionVC.inspect(mouthImage)
    //      UIImage.saveToPhotoLibrary(mouthImage)
    //TODO: save mouthImage into memory...
    
  }
  
  
  func didTapTrainButton(_: ButtonsVC) {
    remove(buttonsVC)
    add(trainVC)
    captureMode = .training
  }
  func didTapRecognizeButton(_: ButtonsVC) {
    remove(buttonsVC)
    add(recognizeVC)
    captureMode = .recognizing
  }
  
  func trainVCDidTapCaptureButton(_: TrainVC) {
    camVC.takePhoto()
  }
  func recognizeVCDidTapCaptureButton(_: RecognizeVC) {
    camVC.takePhoto()
  }
  
  func trainVCDidTapDismiss(_: TrainVC) {
    remove(trainVC)
    add(buttonsVC)
  }
  func recognizeVCDidTapDismiss(_: RecognizeVC) {
    remove(recognizeVC)
    add(buttonsVC)
  }
  
  func add(_ vc:UIViewController) {
    addChildViewController(vc)
    view.addSubview(vc.view)
    vc.didMove(toParentViewController: self)
  }
  
  func remove(_ vc: UIViewController) {
    vc.willMove(toParentViewController: self)
    vc.view.removeFromSuperview()
    vc.removeFromParentViewController()
  }
  
}
