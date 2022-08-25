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
{                                                   //there are some other parameters to try
    Mat img = imread("../shape.png",IMREAD_GRAYSCALE);
    imshow("raw",img);

    Mat canvas = Mat::zeros(img.size(),CV_8UC1);
    vector<vector<Point>> contour;
    vector<Vec4i> hierarchy;
    threshold(img,img,10,255,1);     //RETR_EXTERNAL RETR_TREE  //CHAIN_APPROX_NONE CHAIN_APPROX_SIMPLE
    findContours(img,contour,hierarchy,RETR_EXTERNAL,CHAIN_APPROX_NONE,Point(0,0));
    for(auto i =0;i<contour.size();i++)
    {
        cout<<i<<endl;
        for(auto j=0;j<contour[i].size();j++)
        {
            circle(canvas,contour[i][j],2,Scalar(255));
        }
    }
    imshow("contours",canvas);

    waitKey(0);
    return 0;
}

