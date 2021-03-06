# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-webpirate

QT += sql dbus
CONFIG += sailfishapp

# Install D-Bus Service (Currently Disabled)
# dbus_service.files = org.browser.WebPirate.service
# dbus_service.path = /usr/share/dbus-1/services
# INSTALLS += dbus_service

SOURCES += src/harbour-webpirate.cpp \
    src/webkitdatabase/webkitdatabase.cpp \
    src/downloadmanager/downloadmanager.cpp \
    src/downloadmanager/downloaditem.cpp \
    src/webkitdatabase/webicondatabase.cpp \
    src/favoritesmanager/favoritesmanager.cpp \
    src/faviconprovider.cpp \
    src/favoritesmanager/favoriteitem.cpp \
    src/dbus/webpirateadaptor.cpp \
    src/dbus/webpirateservice.cpp \
    src/mime/mimedatabase.cpp \
    src/adblock/adblockmanager.cpp \
    src/adblock/adblockeditor.cpp \
    src/adblock/adblockfilter.cpp \
    src/adblock/adblockdownloader.cpp \
    src/filepicker/folderlistmodel.cpp

OTHER_FILES += qml/harbour-webpirate.qml \
    rpm/harbour-webpirate.changes.in \
    rpm/harbour-webpirate.spec \
    translations/*.ts \
    harbour-webpirate.desktop \
    qml/js/UrlHelper.js \
    qml/js/SearchEngines.js \
    qml/js/Favorites.js \
    qml/components/navigationbar/SearchBar.qml \
    qml/components/navigationbar/NavigationBar.qml \
    qml/components/LoadingBar.qml \
    qml/components/LoadFailed.qml \
    qml/components/BrowserTab.qml \
    qml/pages/SettingsPage.qml \
    qml/pages/MainPage.qml \
    qml/js/UserAgents.js \
    qml/js/Database.js \
    qml/models/Settings.qml \
    qml/models/FavoritesModel.qml \
    qml/components/FavoritesView.qml \
    qml/js/helpers/WebViewHelper.js \
    qml/pages/searchengine/SearchEnginesPage.qml \
    qml/pages/favorite/FavoritePage.qml \
    qml/pages/searchengine/SearchEnginePage.qml \
    qml/models/SearchEngineModel.qml \
    qml/js/Credentials.js \
    qml/js/GibberishAES.js \
    qml/components/menus/LinkMenu.qml \
    qml/pages/downloadmanager/DownloadsPage.qml \
    qml/components/items/DownloadListItem.qml \
    qml/components/webview/BrowserWebView.qml \
    qml/components/sidebar/ActionSidebar.qml \
    qml/pages/favorite/FavoritesPage.qml \
    qml/js/History.js \
    qml/components/menus/HistoryMenu.qml \
    qml/components/SettingLabel.qml \
    qml/pages/TextSelectionPage.qml \
    qml/components/tabview/TabView.qml \
    qml/components/tabview/TabButton.qml \
    qml/components/quickgrid/QuickGrid.qml \
    qml/components/quickgrid/QuickGridItem.qml \
    qml/components/quickgrid/QuickGridButton.qml \
    qml/pages/QuickGridPage.qml \
    qml/js/QuickGrid.js \
    qml/models/QuickGridModel.qml \
    qml/components/PopupMessage.qml \
    qml/components/sidebar/SidebarItem.qml \
    qml/pages/AboutPage.qml \
    qml/js/canvg/canvg.js \
    qml/js/canvg/rgbcolor.js \
    qml/js/canvg/StackBlur.js \
    qml/js/YouTubeGrabber.js \
    qml/pages/YouTubeSettingsPage.qml \
    qml/pages/VideoPlayerPage.qml \
    qml/components/InfoLabel.qml \
    qml/js/helpers/YouTubeHelper.js \
    qml/components/mediaplayer/MediaPlayerProgressBar.qml \
    qml/components/mediaplayer/MediaPlayerToolBar.qml \
    qml/components/mediaplayer/MediaPlayerTitle.qml \
    qml/components/tabview/TabHeader.qml \
    qml/js/Sessions.js \
    qml/pages/session/SaveSessionPage.qml \
    qml/components/items/PageItem.qml \
    qml/pages/session/SessionSettingsPage.qml \
    qml/pages/session/SessionPage.qml \
    qml/pages/cover/CoverSettingsPage.qml \
    qml/components/items/cover/CoverMenu.qml \
    qml/models/cover/CoverModel.qml \
    qml/components/items/cover/PageCoverActions.qml \
    qml/js/Cover.js \
    org.browser.WebPirate.service \
    rpm/harbour-webpirate.yaml \
    qml/js/helpers/NightMode.js \
    qml/components/sidebar/SidebarSwitch.qml \
    qml/js/helpers/AdBlock.js \
    qml/js/helpers/ForcePixelRatio.js \
    qml/pages/adblock/AdBlockPage.qml \
    adblock.css \
    adblock.table \
    qml/pages/adblock/AdBlockFilter.qml \
    qml/pages/adblock/AdBlockDownloaderPage.qml \
    qml/components/webview/jsdialogs/ItemSelector.qml \
    qml/components/webview/jsdialogs/AlertDialog.qml \
    qml/components/webview/jsdialogs/WebViewDialog.qml \
    qml/components/dialogs/PopupDialog.qml \
    qml/components/dialogs/CredentialDialog.qml \
    qml/components/webview/jsdialogs/RequestDialog.qml \
    qml/components/webview/jsdialogs/PromptDialog.qml \
    qml/components/webview/jsdialogs/AuthenticationDialog.qml \
    qml/pages/picker/FilePickerPage.qml \
    qml/components/pickers/FilePicker.qml \
    qml/components/webview/jsdialogs/FilePickerDialog.qml \
    qml/components/webview/WebViewListener.qml \
    qml/components/webview/jsdialogs/ColorChooserDialog.qml \
    qml/components/navigationbar/ActionBar.qml \
    qml/components/navigationbar/BrowserBar.qml \
    qml/components/navigationbar/FindTextBar.qml \
    qml/pages/popupblocker/PopupBlockerPage.qml \
    qml/pages/downloadmanager/NewDownloadPage.qml \
    qml/pages/history/NavigationHistoryPage.qml \
    qml/models/HistoryModel.qml \
    qml/components/items/NavigationHistoryItem.qml \
    qml/models/ClosedTabsModel.qml \
    qml/pages/closedtabs/ClosedTabsPage.qml \
    qml/components/items/ClosedTabItem.qml \
    qml/js/PopupBlocker.js \
    qml/models/BlockedPopupModel.qml \
    qml/models/PopupModel.qml \
    qml/pages/popupblocker/PopupManagerPage.qml \
    qml/components/items/PopupItem.qml \
    qml/components/items/BlockedPopupItem.qml \
    qml/pages/popupblocker/NewPopupRulePage.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

TRANSLATIONS += translations/harbour-webpirate.ts \
            translations/harbour-webpirate-ca.ts \
            translations/harbour-webpirate-cs_CZ.ts \
            translations/harbour-webpirate-de.ts \
            translations/harbour-webpirate-es.ts \
            translations/harbour-webpirate-fr.ts \
            translations/harbour-webpirate-it.ts \
            translations/harbour-webpirate-ja.ts \
            translations/harbour-webpirate-nl_NL.ts \
            translations/harbour-webpirate-ru_RU.ts \
            translations/harbour-webpirate-sl_SI.ts \
            translations/harbour-webpirate-sv_SE.ts \
            translations/harbour-webpirate-zh_CN.ts

RESOURCES += \
    resources.qrc

HEADERS += \
    src/webkitdatabase/webkitdatabase.h \
    src/downloadmanager/downloadmanager.h \
    src/downloadmanager/downloaditem.h \
    src/webkitdatabase/webicondatabase.h \
    src/favoritesmanager/favoritesmanager.h \
    src/faviconprovider.h \
    src/favoritesmanager/favoriteitem.h \
    src/dbus/webpirateadaptor.h \
    src/dbus/webpirateservice.h \
    src/mime/mimedatabase.h \
    src/adblock/adblockmanager.h \
    src/adblock/adblockeditor.h \
    src/adblock/adblockfilter.h \
    src/adblock/adblockdownloader.h \
    src/filepicker/folderlistmodel.h

