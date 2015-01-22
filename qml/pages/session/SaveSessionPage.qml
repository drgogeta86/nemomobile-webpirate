import QtQuick 2.0
import Sailfish.Silica 1.0
import "../../components/tabview"
import "../../components/items"
import "../../js/Sessions.js" as Sessions

Dialog
{
    property TabView tabView

    allowedOrientations: Orientation.All
    acceptDestinationAction: PageStackAction.Pop
    canAccept: tfsessionname.text.length > 0
    onAccepted: Sessions.save(tfsessionname.text, tabView.pages, tabView.currentIndex, tsautoload.checked, tsreplacecurrent.checked)

    DialogHeader { id: dlgheader; acceptText: qsTr("Save Session") }

    Column
    {
        id: column
        anchors { left: parent.left; top: dlgheader.bottom; right: parent.right }

        TextField
        {
            id: tfsessionname
            width: parent.width
            placeholderText: qsTr("Session name")
        }

        TextSwitch
        {
            id: tsautoload
            width: parent.width
            text: qsTr("Load at startup")
        }

        TextSwitch
        {
            id: tsreplacecurrent
            width: parent.width
            text: qsTr("Replace current session")
        }
    }

    Label
    {
        id: lbltabs

        anchors { left: parent.left; top: column.bottom; right: parent.right;
                  leftMargin: Theme.paddingSmall; topMargin: Theme.paddingLarge; rightMargin: Theme.paddingSmall; }

        font.pixelSize: Theme.fontSizeSmall
        color: Theme.highlightColor
        text: qsTr("Opened Tabs") + ":"
        wrapMode: Text.WordWrap
    }

    SilicaListView
    {
        anchors { left: parent.left; top: lbltabs.bottom; right: parent.right; bottom: parent.bottom; topMargin: Theme.paddingSmall }
        model: tabView.pages
        clip: true

        delegate: PageItem {
            contentWidth: parent.width
            contentHeight: Theme.itemSizeSmall
            title: tab.getTitle() + (index === tabView.currentIndex ? " (" + qsTr("Selected") + ")" : "" )
            text: tab.getUrl()
        }
    }
}
