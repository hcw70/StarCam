pragma Singleton
import QtQuick 2.0
import QuickFlux 1.1
import "./"

ActionCreator {

    /////////////////////////////
    // Camera input
    
    // select real camera
    signal selectCamera(int id);
    
    //  select a video file to simulate camera input
    signal selectFakeCameraVideo(string fileName)


    /////////////////////////////
    // View modes
    signal switchToLive();
    signal switchToPhoto(string fileName);
    

    /////////////////////////////
    // Live view actions
    
    signal startLiveView();
    signal stopLiveView();
    signal captureImage();
    
    
    /////////////////////////////
    // Camera properties
    signal setCamAperture(float newVal);
    signal setCamExposure(float newVal);
    signal setCamIso(int newVal);

    //
    
}

