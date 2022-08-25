//
// Created by rm on 2021/9/10.
//

#include <iostream>
#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/video.hpp>

using namespace cv;
using namespace std;

int main()
{
    Mat img;
    VideoCapture cap(0);
    while(true)
    {
        cap>>img;
        imshow("test_windows", img);
        waitKey(1);
    }
    return 0;//a joke,aha
}