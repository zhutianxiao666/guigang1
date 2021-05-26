
import zhiliang from "@/js/C302/modules/runs/zhiliang";
import fangdou from "@/js/common/commons/fangdou";
import changeSize from "@/js/C302/modules/runs/changeSize";
class Run {
    constructor(svg) {
        this.svg = svg;
        this.init();
    };
    init() {
        this.changeSize();
        window.onresize = fangdou(() => {
            this.changeSize()
        },300)
        this.zhiliang();
    };
    // 改变尺寸
    changeSize = changeSize;
    // 质量
    zhiliang = zhiliang;

}

export default Run
