import {init} from './common/init';

import production from './Q314/production';
import chengcailv from "./Q314/chengcailv";
import zhiliang from "./Q314/zhiliang";
import kucun from "./Q314/kucun";
import shebeitingji from "./Q314/shebeitingji";
import nenghao from "./Q314/nenghao";
import clickEvent from "./Q314/clickEvent";

init({reportName:'report0',tdId:'A1',id:'Q314'});

const width = $('#changeText')[0].getBBox().width;
let times = 0
const timer = setInterval(function () {
    times++;
    if (width != $('#changeText')[0].getBBox().width || times >=50) {
        clearInterval(timer);
        // 生产
        production();
        // 成材率
        chengcailv();
        // 质量
        zhiliang();
        // 库存
        kucun();
        // 设备
        shebeitingji();
        // 能耗
        nenghao();
        // 点击跳转
        clickEvent();
    };
},10);
