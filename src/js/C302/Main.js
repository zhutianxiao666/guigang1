import appendSvg from "@/js/C302/modules/appendSvg";
import Run from "@/js/C302/modules/Run";



class Main {
    constructor(svg) {
        this.svg = svg;
        this.init();
    };
    init() {
        this.appendSvg();
        new Run(this.svg);
    };
    appendSvg = appendSvg;


}

new Main(document.querySelector('div[widgetname="REPORT0"] td[id^="A1-0-"] embed').getSVGDocument().querySelector('svg'));
