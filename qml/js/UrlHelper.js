.pragma library

var domainregex = new RegExp("http[s]*://[a-zA-Z0-9-_]*[\\.]*[a-zA-Z0-9-_]+\\.[a-zA-Z0-9-_\\.]+");
var urlregex = new RegExp("[-a-zA-Z0-9@:%._\\+~#=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%_\\+.~#?&//=]*)");
var ipregex = new RegExp("[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}");
var httpregex = new RegExp("^(http|https)://");

function adjustUrl(adjurl)
{
    if(isSpecialUrl(adjurl))
        return adjurl;

    if(!httpregex.test(adjurl))
        return "http://" + adjurl

    return adjurl
}

function domainName(url)
{
    return domainregex.exec(adjustUrl(url))[0];
}

function urlPath(url)
{
    var idx = url.indexOf("?");

    if(idx !== -1)
        return url.slice(0, idx);

    return url;
}

function isUrl(url)
{
    return urlregex.test(url) || ipregex.test(url);
}

function isSpecialUrl(url)
{
    return url.indexOf("about:") === 0;
}

function specialUrl(url)
{
    return url.split(":")[1];
}

function decode(url)
{
    var spaceencchar = new RegExp("[+]", "g");
    return decodeURIComponent(url.replace(spaceencchar, "%20"));
}
