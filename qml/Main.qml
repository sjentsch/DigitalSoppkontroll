/*
 * Copyright (C) 2021  Sebastian Jentschke
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * DigitalSoppkontroll is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Suru 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtWebEngine 1.7
import Morph.Web 0.1

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'digitalsoppkontroll.sjentsch'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    WebEngineView {
        id: webview
        anchors.fill: parent
        url: "https://app.soppkontroll.no/"
        zoomFactor: 1.0 //scales the webpage on the device, range allowed from 0.25 to 5.0; the default factor is 1.0
        profile: webViewProfile
    }

    WebEngineProfile {
        // for more profile options see https://doc.qt.io/qt-5/qml-qtwebengine-webengineprofile.html
        // id: webViewProfile
        persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies;
        httpCacheType: WebEngineProfile.DiskHttpCache; //cache qml content to file
        httpUserAgent: "Mozilla/5.0 (Linux, mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.92 Safari/537.36";
        property alias dataPath: webViewProfile.persistentStoragePath
        dataPath: dataLocation
    }

//    ProgressBar {
//        id: loadingIndicator
//        anchors {
//            top: parent.top
//            left: parent.left
//            right: parent.right
//        }
//        // aquire the webviews loading progress for the indicators value
//        value: webview.loadProgress / 100
//        // hide loadingIndicator when page has been loaded successfully
//        visible: webview.loadProgress === 100 ? false : true
//    }

//    Rectangle {
//        //show placeholder while the page is loading to avoid ugly flickering of webview
//        id: webViewPlaceholder
//        anchors {
//            top: loadingIndicator.bottom
//            left: parent.left
//            right: parent.right
//            bottom: parent.bottom
//        }
//        z: 1
//        color: Suru.backgroundColor
//        visible: webview.loadProgress === 100 ? false : true

//        BusyIndicator {
//            id: busy
//            anchors.centerIn: parent
//        }
//    }
}
