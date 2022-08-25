//
// Created by rm on 2021/9/10.
//
#include <iostream>
#include <vector>
#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/video.hpp>


using namespace cv;
using namespace std;

int main()
{
    Mat img = imread("../Hero.jpg");
    imshow("origin",img);

    Mat grey;
    cvtColor(img,grey,COLOR_BGR2GRAY);
    imshow("grey",grey);

    Mat bivalue;
    threshold(grey,bivalue,100,255,0);
    imshow("bivalue",bivalue);

    vector<Mat> bgr(3);
    split(img,bgr);
    //attention here!you may think this is same to grey img,take it seriously.
    imshow("bgr",bgr[1]);

    Mat sub_br;
    subtract(bgr[0],bgr[2],sub_br);
    threshold(sub_br,sub_br,50,255,0);
    imshow("b sub r then thres",sub_br);

//    rotate();
//    rect();
//    resize();
    waitKey(0);
    return 0;
}
