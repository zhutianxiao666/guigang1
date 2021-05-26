import changeSize from './runs/changeSize';
import fangdou from "@/js/common/commons/fangdou";
import chengcailv from "@/js/Q102/modules/runs/chengcailv";
import nenghao from "@/js/Q102/modules/runs/nenghao";
import zhiliang from "@/js/Q102/modules/runs/zhiliang";
import zhagun from "@/js/Q102/modules/runs/zhagun";
import kucun from "@/js/Q102/modules/runs/kucun";
import fuliaoxiaohao from "@/js/Q102/modules/runs/fuliaoxiaohao";
import guzhangtingji from "@/js/Q102/modules/runs/guzhangtingji";
import shengchan from "@/js/Q102/modules/runs/shengchan";

const Run = class {
    constructor(svg) {
        this.svg = svg;
        this.init();
    };
    init() {

        this.changeSize();
        window.onresize = fangdou(() => {
            this.changeSize();
        },300);
        // 生产
        this.shengchan();
        // 成材率
        this.chengcailv();
        // 能耗
        this.nenghao();
        // 质量
        this.zhiliang();
        // 轧辊
        this.zhagun();
        // 库存
        this.kucun();
        // 辅料消耗
        this.fuliaoxiaohao();
        // 故障停机
        this.guzhangtingji();

    };
    shengchan = shengchan;
    changeSize = changeSize;
    chengcailv = chengcailv;
    nenghao = nenghao;
    zhiliang = zhiliang;
    zhagun = zhagun;
    kucun = kucun;
    fuliaoxiaohao = fuliaoxiaohao;
    guzhangtingji = guzhangtingji;
};
export default Run;