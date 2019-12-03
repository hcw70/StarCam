import QtQuick 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.12

Rectangle {
    id : cameraUI

    width: 800
    height: 480

    color: "black"
    state: "PhotoCapture"

    states: [
        State {
            name: "PhotoCapture"
            StateChangeScript {
                script: {
                    camera.captureMode = Camera.CaptureStillImage
                    camera.start()
                }
            }
        },
        State {
            name: "PhotoPreview"
        }
    ]

    Camera {
        id: camera
        captureMode: Camera.CaptureStillImage

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview
                stillControls.previewAvailable = true
                cameraUI.state = "PhotoPreview"
                console.log("Captured image: " + preview.toString())
            }
            onImageSaved: {
                console.log("Saved image: " + path.toString())
            }

            onErrorStringChanged: {
                console.log("Got camera error:",errorString)
            }

        }

    }

    PhotoPreview {
        id : photoPreview
        anchors.fill : parent
        onClosed: cameraUI.state = "PhotoCapture"
        visible: cameraUI.state == "PhotoPreview"
        focus: visible
    }

    VideoOutput {
        id: viewfinder

        visible: cameraUI.state == "PhotoCapture"

        x: 0
        y: 0
        width: parent.width
        height: parent.height

        source: camera
        autoOrientation: true
        fillMode: VideoOutput.PreserveAspectCrop

        Rectangle {
            id: grid
                color: Qt.rgba(0.0, 0.0, 0.0, 0.0)
                border.color: Qt.rgba(0.4, 0.4, 0.4, 0.2)
                width: parent.width / 2;
                height: parent.height / 2;
                anchors.centerIn: parent;
                border.width: 2
       }

    }

    PhotoCaptureControls {
        id: stillControls

        anchors.fill: parent
        camera: camera
        videoOutput: viewfinder
        visible: cameraUI.state == "PhotoCapture"
        onPreviewSelected: cameraUI.state = "PhotoPreview"
    }

}
