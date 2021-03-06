var __webpirate__ = {
    timerid: -1,
    islongpress: false,
    currtouch: null,

    rootTextNode: function(element) {
        if(element.parentElement)
            return element.parentElement;

        return element;
    },

    checkLongPress: function(x, y, target) {
        __webpirate__.islongpress = true;
        var rect = target.getBoundingClientRect();

        var data = new Object;
        data.type = "longpress";
        data.x = x;
        data.y = y;
        data.left = rect.left;
        data.top = rect.top;
        data.width = rect.width;
        data.height = rect.height;

        if(target.tagName === "A")
        {
            data.url = target.href;
            data.isimage = false;
        }
        else if(target.parentNode.tagName === 'A')
        {
            data.url = target.parentNode.href;
            data.isimage = false;
        }
        else if(target.tagName === "IMG")
        {
            data.url = target.src;
            data.isimage = true;
        }
        else if(target.textContent) /* 'textContent' is faster than 'innerText', use for test text presence */
        {
            var roottn = __webpirate__.rootTextNode(target);

            if(roottn)
                data.text = roottn.innerText;
        }
        else
        {
            var style = window.getComputedStyle(target, null); // Try to get image from CSS

            if(style.backgroundImage)
            {
                data.url = style.backgroundImage.slice(4, -1);
                data.isimage = true;
            }
            else
              return;
        }

        navigator.qt.postMessage(JSON.stringify(data));
    },

    polishDocument: function() {
        canvg(); /* Convert all SVG Images to canvas objects */
    },

    onTouchStart: function(touchevent) {
        if(touchevent.touches.length === 1)
        {
            __webpirate__.currtouch = touchevent.touches[0];
            __webpirate__.timerid = setTimeout(function() {
                __webpirate__.checkLongPress(__webpirate__.currtouch.clientX, __webpirate__.currtouch.clientY, touchevent.target)
            }, 800);
        }

        var data = new Object;

        if(touchevent.target.tagName === "SELECT")
        {
            data.type = "selector_touch";
            data.selectedIndex = touchevent.target.selectedIndex;
        }
        else
            data.type = "touchstart";

        navigator.qt.postMessage(JSON.stringify(data));
    },

    onTouchEnd: function(touchevent)
    {
        if(__webpirate__.islongpress)
        {
            __webpirate__.islongpress = false;
            touchevent.preventDefault();
        }

        __webpirate__.currtouch = null;
        clearTimeout(__webpirate__.timerid);
    },

    onTouchMove: function(touchevent) {
        if(__webpirate__.islongpress)
        {
            __webpirate__.islongpress = false;
            touchevent.preventDefault();
        }

        clearTimeout(__webpirate__.timerid);
        __webpirate__.currtouch = null;
    },

    onClick: function(event) {
        var target = event.target;

        if((target.tagName === "A") && target.hasAttribute("target"))
        {
            var data = new Object;
            data.type = "newtab";
            data.url = target.href;

            navigator.qt.postMessage(JSON.stringify(data));
        }
    },

    onSubmit: function(event) {
        var inputelements = event.target.getElementsByTagName("input");

        if(!inputelements)
            return;

        var logindata = new Object
        logindata.type = "submit";

        for(var i = 0; i < inputelements.length; i++)
        {
            var input = inputelements[i];

            if((input.id === null && input.name === null) || input.value === null || input.value.length === 0)
                continue;

            if(input.type === "text" || input.type === "email")
            {
                logindata.loginattribute = input.id ? "id" : "name";
                logindata.loginid = input.id ? input.id : input.name;
                logindata.login = input.value;

                if(logindata.password)
                    break;
            }
            else if(input.type === "password")
            {
                logindata.passwordattribute = input.id ? "id" : "name";
                logindata.passwordid = input.id ? input.id : input.name;
                logindata.password = input.value;

                if(logindata.login)
                    break;
            }
        }

        if(logindata.loginid && logindata.login && logindata.passwordid && logindata.password)
            navigator.qt.postMessage(JSON.stringify(logindata));
    }
};

document.addEventListener("touchstart", __webpirate__.onTouchStart, true);
document.addEventListener("touchmove",  __webpirate__.onTouchMove, true);
document.addEventListener("touchend",  __webpirate__.onTouchEnd, true);
document.addEventListener("click",  __webpirate__.onClick, true);
document.addEventListener("submit",  __webpirate__.onSubmit, true);

window.open = function(url) { /* Popup Blocker */
    var data = new Object;
    data.type = "window_open";
    data.url = url;

    navigator.qt.postMessage(JSON.stringify(data));
}
