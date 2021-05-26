import appendSvg from "@/js/Q101/modules/appendSvg";
import {Run} from "@/js/Q101/modules/Run";

class Main {
    constructor(ele) {
        this.svg = ele;

        this.init();
    };
    init () {
        this.appendSvg();
        new Run(this.svg);
    };
    appendSvg = appendSvg;
}

new Main(document.querySelector('div[widgetname="REPORT0"] td[id^="A1-0-"] embed').getSVGDocument().querySelector('svg'))