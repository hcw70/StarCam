import QtQuick 2.12

Item {
    id: button

    signal clicked

    property string text
    property color bordercolor: "white"
    property color bgcolor: "black"
    property color bgcolor_pressed: "darkgrey"
    property color color: "lightgrey"

    width : 144
    height: 70

    Rectangle {
        id: buttonRect
        width: button.width; height: button.height
        border.width: 2
        border.color: button.bordercolor
        color:  mouseRegion.containsPress ? button.bgcolor_pressed : button.bgcolor
        radius: 10
    }

    MouseArea {
        id: mouseRegion
        anchors.fill: buttonRect
        onClicked: { button.clicked(); }
    }
    Text {
        id: btnText
        anchors.fill: buttonRect
        anchors.margins: 5
        text: button.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        color: button.color
        font.bold: true
        style: Text.Raised
        styleColor: "black"
        font.pixelSize: 20

    }
}
