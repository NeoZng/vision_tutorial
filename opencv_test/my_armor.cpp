//
// Created by rm on 2021/9/10.
//
#include <iostream>
#include <opencv2/opencv.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/video.hpp>

//encapsulate these functions into a class!
//enclose some member variebles..
//now start your first Vision Project!

void Pretreat(Mat& raw_img)
{
    //code goes here...
    //extract the trait of Armors
}

void FixArmor(Mat& processed_img)
{
    //use eclipse or rect to approximate light bars...maybe also armors!
}


//it can draw an armor using four vertexes of an rotatedrect
void DrawRect(Mat& canvas,RotatedRect object)
{
    Point2f vertexes[4];
    object.points(vertexes);
    for (int i = 0; i < 4; i++)
    {
        line(canvas, vertexes[i],vertexes[i+1] , Scalar(255,255,0), 3);
    }
}