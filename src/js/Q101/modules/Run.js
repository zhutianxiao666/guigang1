import changeSize from "@/js/Q101/modules/runs/changeSize";
import fangdou from "@/js/common/commons/fangdou";
import shengchan from "@/js/Q101/modules/runs/shengchan";
import chengcailv from "@/js/Q101/modules/runs/chengcailv";
import kucun from "@/js/Q101/modules/runs/kucun";
import zhiliang from "@/js/Q101/modules/runs/zhiliang";
import tingji from "@/js/Q101/modules/runs/tingji";
import nenghao from "@/js/Q101/modules/runs/nenghao";
import gongnengjingdu from "@/js/Q101/modules/runs/gongnengjingdu";
import jiangsucishu from "@/js/Q101/modules/runs/jiangsucishu";

export class Run {
    constructor(svg) {
        this.svg = svg;
        this.init();
    };
    init() {
        this.changeSize();
        window.onresize = fangdou(() => {
            this.changeSize();
        },300);
        this.shengchan();
        this.chengcailv();
        this.kucun();
        this.zhiliang();
        this.tingji();
        this.nenghao();
        this.gongnengjingdu();
        this.jiangsucishu();
    };
    changeSize = changeSize;
    shengchan = shengchan;
    chengcailv = chengcailv;
    kucun = kucun;
    zhiliang = zhiliang;
    tingji = tingji;
    nenghao = nenghao;
    gongnengjingdu = gongnengjingdu;
    jiangsucishu = jiangsucishu;
};