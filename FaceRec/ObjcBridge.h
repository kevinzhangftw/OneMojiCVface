//
//  ObjcBridge.h
//  Onemoji
//
//  Created by June Kim on 2017-03-13.
//  Copyright © 2017 Soulcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjcBridge : NSObject

+ (UIImage*) blackImage;

//+ (UIImage*) processImageWithOpenCV: (UIImage*) inputImage;
//
//+ (UIImage*) processWithOpenCVImage1:(UIImage*)inputImage1 image2:(UIImage*)inputImage2;
//
//+ (UIImage*) processWithArray:(NSArray<UIImage*>*)imageArray;

+ (void) learn:(UIImage*) inputImage label:(int) label;
+ (int) recognize:(UIImage*) inputImage;


@end

NS_ASSUME_NONNULL_END

