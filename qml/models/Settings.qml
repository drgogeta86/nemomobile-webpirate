import QtQuick 2.1
import QtSystemInfo 5.0
import WebPirate 1.0
import WebPirate.AdBlock 1.0
import "cover"

QtObject
{
    property DeviceInfo deviceinfo: DeviceInfo { }
    property SearchEngineModel searchengines: SearchEngineModel { }
    property DownloadManager downloadmanager: DownloadManager { }
    property AdBlockManager adblockmanager: AdBlockManager { }
    property QuickGridModel quickgridmodel: QuickGridModel { }
    property WebIconDatabase icondatabase: WebIconDatabase { }
    property CoverModel coveractions: CoverModel { }

    property int searchengine;       /* Search Engine Index */
    property int useragent;          /* User Agent Index */
    property string homepage;        /* HomePage Url */
    property bool clearonexit;       /* Wipe UserData on exit */
    property bool nightmode: false;  /* Night Mode */

    readonly property string version: "0.9.5"
}
