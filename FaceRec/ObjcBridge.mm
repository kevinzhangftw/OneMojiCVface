//
//  ObjcBridge.m
//  Onemoji
//
//  Created by June Kim on 2017-03-13.
//  Copyright © 2017 Soulcast. All rights reserved.
//

#import "ObjcBridge.h"
#import "VersionPrinter.hpp"
#ifdef __cplusplus
#import <opencv2/opencv.hpp>
#endif
#import "UIImage+OpenCV.h"

using namespace cv;

@interface ObjcBridge () {
    Ptr<FaceRecognizer> _faceClassifier;
    vector<cv::Mat> _faceImgs;
    vector<int> _faceLabels;

}
@end

@implementation ObjcBridge

static ObjcBridge *model;

+ (void) learn:(UIImage*) inputImage label:(int) label{
    if (model == nil){
        model = [ObjcBridge new];
    }
    model->_faceClassifier = createLBPHFaceRecognizer();
    Mat inputMat = [UIImage cvMatFromUIImage: inputImage];//[inputImage cvMatRepresentationGray];
    
    model->_faceLabels.push_back(label);
    model->_faceImgs.push_back(inputMat);
    model->_faceClassifier->train(model->_faceImgs, model->_faceLabels);
}

+ (int) recognize:(UIImage*) inputImage{
    int emojiClass = 0;
    Mat inputMat = [UIImage cvMatFromUIImage: inputImage];
    emojiClass = model->_faceClassifier->predict(inputMat);
    return emojiClass;
}

+ (UIImage*) blackImage {
//    printVersion();
//    std::shared_ptr<VersionPrinter> printer;
//    cv::Mat blackMat = printer->blankImage();
//    UIImage* blackImage = [UIImage imageWithCVMat:blackMat];;
//    return blackImage;
    printVersion();
    NSLog(@"getting black image");
    UIImage* img = [UIImage imageNamed:@""];
    return img;
}


@end
