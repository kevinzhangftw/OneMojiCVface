//
//  CamVC.swift
//  Facial
//
//  Created by June Kim on 2017-04-01.
//  Copyright © 2017 Soulcast. All rights reserved.
//

import UIKit
import SwiftyCam

protocol CamVCDelegate: class {
  func didCapture(image: UIImage)
}

class CamVC: SwiftyCamViewController, SwiftyCamViewControllerDelegate {
  
  weak var delegate: CamVCDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    defaultCamera = .front
    cameraDelegate = self
  }

  func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
    // Called when takePhoto() is called or if a SwiftyCamButton initiates a tap gesture
    // Returns a UIImage captured from the current session
    delegate?.didCapture(image: photo)
  }
  
  func swiftyCam(_ swiftyCam: SwiftyCamViewController, didBeginRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
    // Called when startVideoRecording() is called
    // Called if a SwiftyCamButton begins a long press gesture
  }
  
  func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
    // Called when stopVideoRecording() is called
    // Called if a SwiftyCamButton ends a long press gesture
  }
  
  func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishProcessVideoAt url: URL) {
    // Called when stopVideoRecording() is called and the video is finished processing
    // Returns a URL in the temporary directory where video is stored
  }
  
  func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFocusAtPoint point: CGPoint) {
    // Called when a user initiates a tap gesture on the preview layer
    // Will only be called if tapToFocus = true
    // Returns a CGPoint of the tap location on the preview layer
  }
  
  func swiftyCam(_ swiftyCam: SwiftyCamViewController, didChangeZoomLevel zoom: CGFloat) {
    // Called when a user initiates a pinch gesture on the preview layer
    // Will only be called if pinchToZoomn = true
    // Returns a CGFloat of the current zoom level
  }
  
  func swiftyCam(_ swiftyCam: SwiftyCamViewController, didSwitchCameras camera: SwiftyCamViewController.CameraSelection) {
    // Called when user switches between cameras
    // Returns current camera selection
  }
  
}
