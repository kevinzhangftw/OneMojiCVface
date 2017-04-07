//
//  VersionPrinter.cpp
//  Onemoji
//
//  Created by June Kim on 2017-03-13.
//  Copyright © 2017 Soulcast. All rights reserved.
//

#include "VersionPrinter.hpp"
#include <iostream>

using namespace std;
using namespace cv;

void printVersion() {
    cout << "OpenCV version : " << CV_VERSION << endl;
    cout << "Major version : " << CV_MAJOR_VERSION << endl;
    cout << "Minor version : " << CV_MINOR_VERSION << endl;
    cout << "Subminor version : " << CV_SUBMINOR_VERSION << endl;
}

Mat VersionPrinter::blankImage() {
    printVersion();
    Mat blank;
    blank.create(100, 100, 0);
    return blank;
}
