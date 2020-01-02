import QtQuick 2.12
import QtQuick.Controls 2.12
import QtMultimedia 5.12

import Qt.labs.folderlistmodel 2.12

FocusScope {
    property Camera camera
    property VideoOutput videoOutput
    property bool previewAvailable : false

    property int buttonsPanelWidth: buttonPaneShadow.width

    signal previewSelected
    signal videoModeSelected
    id : captureControls

    Rectangle {
        id: buttonPaneShadow
        width: bottomColumn.width + 16
        height: parent.height
        anchors.top: parent.top
        anchors.right: parent.right
        color: Qt.rgba(0.08, 0.08, 0.08, 0.1)

        Column {
            anchors {
                right: parent.right
                top: parent.top
                margins: 8
            }

            id: buttonsColumn
            spacing: 8
/*
            FocusButton {
                camera: captureControls.camera
                visible: camera.cameraStatus == Camera.ActiveStatus && camera.focus.isFocusModeSupported(Camera.FocusAuto)
            }
*/
            CameraButton {
                text: "Capture"
                visible: camera.imageCapture.ready
                onClicked: camera.imageCapture.capture()
            }
/*
            CameraPropertyButton {
                id : wbModesButton
                value: CameraImageProcessing.WhiteBalanceAuto
                model: ListModel {
                    ListElement {
                        icon: "images/camera_auto_mode.png"
                        value: CameraImageProcessing.WhiteBalanceAuto
                        text: "Auto"
                    }
                    ListElement {
                        icon: "images/camera_white_balance_sunny.png"
                        value: CameraImageProcessing.WhiteBalanceSunlight
                        text: "Sunlight"
                    }
                    ListElement {
                        icon: "images/camera_white_balance_cloudy.png"
                        value: CameraImageProcessing.WhiteBalanceCloudy
                        text: "Cloudy"
                    }
                    ListElement {
                        icon: "images/camera_white_balance_incandescent.png"
                        value: CameraImageProcessing.WhiteBalanceTungsten
                        text: "Tungsten"
                    }
                    ListElement {
                        icon: "images/camera_white_balance_flourescent.png"
                        value: CameraImageProcessing.WhiteBalanceFluorescent
                        text: "Fluorescent"
                    }
                }
                onValueChanged: captureControls.camera.imageProcessing.whiteBalanceMode = wbModesButton.value
            }
*/
            CameraButton {
                text: "View"
                onClicked: captureControls.previewSelected()
                visible: captureControls.previewAvailable
            }
        }

        Column {
            anchors {
                bottom: parent.bottom
                right: parent.right
                margins: 8
            }

            id: bottomColumn
            spacing: 8

            CameraListButton {
                id: cameraSelect
                model: QtMultimedia.availableCameras
                onValueChanged:
                {
                    console.log("Got: " , value)
                    captureControls.camera.deviceId = value
                    videoPlayer.stop()
                    camera.stop()
                    videoOutput.source = camera
                    camera.start()
                }
            }

            ComboBox {
                id: videoSelect
                model: videoFolderModel

                width : 144
                height: 70
                textRole: 'fileName'
                background: Rectangle {
                     radius: 10
                     color: Qt.rgba(0.0, 0.0, 0.0, 0.2)
                }
                onActivated:
                {
                    console.log("Got: " , index, " ", currentText)
                    videoPlayer.stop()
                    camera.stop()
                    videoPlayer.source = videoFolderModel.folder + "/" + currentText
                    videoOutput.source = videoPlayer
                    videoPlayer.loops = MediaPlayer.Infinite
                    videoPlayer.play()
                }
            }
            MediaPlayer {
                id: videoPlayer
                loops: 100
            }

            FolderListModel {
                id: videoFolderModel
                folder: "file:///home/hcw/work/Priv/StarCam/TestVideos"
                caseSensitive: false
                nameFilters: ["*.mp4", "*.mkv"]
                onStatusChanged:
                {
                    console.log("Folder: " + folder)
                    videoSelect.currentIndex = 0
                }

            }

        }


    }

/*
    ZoomControl {
        x : 0
        y : 0
        width : 100
        height: parent.height

        currentZoom: camera.digitalZoom
        maximumZoom: Math.min(4.0, camera.maximumDigitalZoom)
        onZoomTo: camera.setDigitalZoom(value)
    }
    */
}
