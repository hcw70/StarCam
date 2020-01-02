import QtQuick 2.0
import QuickFlux 1.1
import "../actions"

Store {

    property bool nightColorMode: false

    Filter {
        // Views do not write to showCompeletedTasks directly.
        // It asks AppActions.nightColorMode() to do so.
        type: ActionTypes.setShowCompletedTasks
        onDispatched: {
            nightColorMode = message.value;
        }
    }

}
