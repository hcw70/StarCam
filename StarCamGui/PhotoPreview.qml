import QtQuick 2.12
import QtMultimedia 5.12

Item {
    property alias source : preview.source
    signal closed

    Image {
        id: preview
        anchors.fill : parent
        fillMode: Image.PreserveAspectFit
        smooth: true
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.closed();
        }
    }
}

