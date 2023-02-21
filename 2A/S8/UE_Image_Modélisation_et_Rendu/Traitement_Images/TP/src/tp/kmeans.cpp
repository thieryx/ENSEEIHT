#include "ocv_utils.hpp"

#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>
#include <iostream>

using namespace cv;
using namespace std;


void kmeans_custom(Mat image, int k, vect<int> labels, Mat centers) {

}
void printHelp(const string& progName)
{
    cout << "Usage:\n\t " << progName << " <image_file> <K_num_of_clusters> [<image_ground_truth>]" << endl;
}

int main(int argc, char** argv)
{
    if (argc != 3 && argc != 4)
    {
        cout << " Incorrect number of arguments." << endl;
        printHelp(string(argv[0]));
        return EXIT_FAILURE;
    }

    const auto imageFilename = string(argv[1]);
    const string groundTruthFilename = (argc == 4) ? string(argv[3]) : string();
    const int k = stoi(argv[2]);

    // just for debugging
    {
        cout << " Program called with the following arguments:" << endl;
        cout << " \timage file: " << imageFilename << endl;
        cout << " \tk: " << k << endl;
        if(!groundTruthFilename.empty()) cout << " \tground truth segmentation: " << groundTruthFilename << endl;
    }

    // load the color image to process from file
    Mat m, m_ref;
    m = imread(imageFilename, IMREAD_COLOR);
    m_ref = imread(string(argv[3]), IMREAD_COLOR);
    // for debugging use the macro PRINT_MAT_INFO to print the info about the matrix, like size and type
    PRINT_MAT_INFO(m);

    // 1) in order to call kmeans we need to first convert the image into floats (CV_32F)
    // see the method Mat.convertTo()
    m.convertTo(m, CV_32F);
    m_ref.convertTo(m_ref, CV_32F);

    // 2) kmeans asks for a mono-dimensional list of "points". Our "points" are the pixels of the image that can be seen as 3D points
    // where each coordinate is one of the color channel (e.g. R, G, B). But they are organized as a 2D table, we need
    // to re-arrange them into a single vector.
    // see the method Mat.reshape(), it is similar to matlab's reshape
    // now we can call kmeans(...)
    Mat vect = m.reshape(3, m.total());
    Mat vect_ref = m_ref.reshape(3, m_ref.total());
    vector<int> labels;
    Mat1f centers;
    kmeans(vect, k, labels, TermCriteria(TermCriteria::EPS + TermCriteria::COUNT, 10, 1.0), 3, KMEANS_PP_CENTERS, centers);
    
    // Reformer l'image segmentée à partir de labels

    for( int i = 0; i < 3; i++ ) {
        centers.at<float>(0,i) = 255;
        centers.at<float>(1,i) = 0;
    }

     cout << "centers = " << endl << " "  << centers << endl << endl;

    for ( int i = 0; i < m.total(); i++)
    {
        vect.at<float>(i,0) = centers(labels[i], 0 );
        vect.at<float>(i,1) = centers(labels[i], 1 );
        vect.at<float>(i,2) = centers(labels[i], 2 );
    }

    // les critères de précision, sensibilité et similarité
    float TP = 0;
    float FP = 0;
    float FN = 0;
    

    for ( int i = 0; i < m.total(); i++) {
        if (vect_ref.at<float>(i,1) == 0 && vect.at<float>(i,1) == 0) {
            TP += 1;
        } else if (vect_ref.at<float>(i,1) == 255 && vect.at<float>(i,1) == 0) {
            FP += 1;
        } else if (vect_ref.at<float>(i,1) == 0 && vect.at<float>(i,1) == 255) {
            FN += 1;
        }
    }

    float P = TP/(TP+FP);
    float S = TP/(TP+FN);
    float DSC = 2*TP/(2*TP + FP + FN);

    cout << "Précision = " << endl << " "  << P << endl << endl;
    cout << "Sensibilité = " << endl << " "  << S << endl << endl;
    cout << "Coeff de similarité = " << endl << " "  << DSC << endl << endl;

    //Affichage de l'image
    Mat im_seg = vect.reshape(3, m.rows);

    imwrite("image_seg.png", im_seg);

    namedWindow("Image seg", cv::WINDOW_AUTOSIZE);

    imshow("Image seg", im_seg);

    // Wait for a keystroke in the window
    waitKey(0);
    return EXIT_SUCCESS;
}
