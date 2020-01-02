import QtQuick 2.0
import QuickFlux 1.1

Store {

    property alias camStore: camStore
    CamStore {
        id: camStore
    }

    // It hold user's perference. (e.g should it show completed tasks?)
    property alias userPrefs: userPrefs

    UserPrefsStore {
        id: userPrefs
    }

}
