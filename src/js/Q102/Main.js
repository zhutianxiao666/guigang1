import appendSvg from "@/js/Q102/modules/appendSvg";
import Run from './modules/Run';


class Main {
    constructor(ele) {
        // svg元素
        this.svg = ele.getSVGDocument().querySelector('svg');

        this.init();
    };
    init() {
        // 重新渲染svg
        this.appendSvg();
        console.log('ok');
        new Run(this.svg);
    }
    appendSvg = appendSvg;
}
new Main(document.querySelector('div[widgetname="REPORT0"] td[id^="A1-0-"] embed'))