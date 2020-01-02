/** Camera State Store
 */
import QtQuick 2.0
import QuickFlux 1.1
import "../actions"

Store {

    property string selectedCamera;

    property real aperture;

    ListModel {
        id: possibleAperture;
        ListElement {
            name: "4.0"
            value: 4.0
        }
        ListElement {
            name: "5.6"
            value: 5.6
        }
        ListElement {
            name: "11"
            value: 11.0
        }
        ListElement {
            name: "22"
            value: 22.0
        }
    }

    property alias possibleAperture: possibleAperture;

    property int ISO: 0;
    ListModel {
        id: possibleISO;
        ListElement {
            name: "Auto"
            value: 0
        }
        ListElement {
            name: "100"
            value: 100
        }
        ListElement {
            name: "200"
            value: 200
        }
        ListElement {
            name: "400"
            value: 400
        }
    }
    property alias possibleISO: possibleISO;


    property real exposureTime: 0;
    ListModel {
        id: possibleExposureTime;
        ListElement {
            name: "Auto"
            value: 0.0
        }
        ListElement {
            name: "1s"
            value: 1.0
        }
        ListElement {
            name: "1/2s"
            value: 0.5
        }
        ListElement {
            name: "1/4s"
            value: 0.25
        }
    }
    property alias possibleExposureTime: possibleExposureTime;


    Filter {
        type: ActionTypes.setCamAperture
        onDispatched: {
            model.aperture=message.newVal;
        }
    }
    Filter {
        type: ActionTypes.setCamExposure
        onDispatched: {
            model.exposureTime=message.newVal;
        }
    }

    Filter {
        type: ActionTypes.setCamIso
        onDispatched: {
            model.ISO=message.newVal;
        }
    }


}



