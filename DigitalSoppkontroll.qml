import Morph.Web 0.1
import QtWebEngine 1.7
import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Controls.Suru 2.2

ApplicationWindow {
    visible: true

    WebEngineView {
        id: webview
        anchors.fill: parent
        url: "https://app.soppkontroll.no"
        zoomFactor: 1.0 // scales the webpage on the device, range allowed from 0.25 to 5.0; the default factor is 1.0
        profile: webViewProfile
    }

    WebEngineProfile {
        id: webViewProfile
        persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies;
        httpCacheType: WebEngineProfile.DiskHttpCache; //cache qml content to file
        httpUserAgent: "Mozilla/5.0 (Linux, Mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.92 Safari/537.36";
        property alias dataPath: webViewProfile.persistentStoragePath
        dataPath: dataLocation
    }

    ProgressBar {
        id: loadingIndicator
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        // aquire the webviews loading progress for the indicators value
        value: webview.loadProgress / 100
        // hide loadingIndicator when page has been loaded successfully
        visible: webview.loadProgress === 100 ? false : true
    }

    Rectangle {
        //show placeholder while the page is loading to avoid ugly flickering of webview
        id: webViewPlaceholder
        anchors {
            top: loadingIndicator.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        z: 1
        color: Suru.backgroundColor
        visible: webview.loadProgress === 100 ? false : true

        BusyIndicator {
            id: busy
            anchors.centerIn: parent
        }
    }
}