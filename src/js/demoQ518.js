
import {init,$svg} from './common/init';

import showSvg from "@/js/common/commons/showSvg";
import production from './Q518/production';
import chengcailv from "./Q518/chengcailv";
import kucun from "./Q518/kucun";
import quality from './Q518/quality';
import shebeitingji from "./Q518/shebeitingji";
import nenghao from "./Q518/nenghao";
import meirixinxi from "./Q518/meirixinxi";

// 初始化svg宽高
init({reportName:'report0',tdId:'a1',id:'Q518'});
let times = 0;
const width = $('#changeText')[0].getBBox().width;
let timer = setInterval(function () {
    times++;
    if (width != $('#changeText')[0].getBBox().width || times > 20) {
        clearInterval(timer);
        // 生产
        try{
            production();
        }catch (e) {
            console.log(e.message);
        };
        // 成材率
        try {
            chengcailv();
        }catch (e) {
            console.log(e.message);
        }
        // 库存
        kucun();
        // 质量
        quality();
        // 设备
        shebeitingji();
        // 能源
        nenghao();
        // 每日信息
        meirixinxi();
        // 现实内容
        showSvg();
    };
},30);


