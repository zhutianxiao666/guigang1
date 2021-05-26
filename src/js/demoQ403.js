
import {init,$svg} from './common/init';
import production from './Q403/production';
import chengcailv from "./Q403/chengcailv";
import kucun from "./Q403/kucun";
import quality from './Q403/quality';
import nenghao from "./Q403/nenghao";
import tingji from "./Q403/tingji";
import meirixinxi from './Q403/meirixinxi'

(function () {
    // 初始化svg宽高
    init({reportName:'report0',tdId:'a1',id:'Q403'});
    setTimeout(function () {
        // 生产
        production();
        // 成材率
        chengcailv();
        // 库存
        kucun();
        // 质量
        quality();
        // 能耗
        nenghao();
        // 停机
        tingji();
        // 每日信息
        meirixinxi();

    },1000);
})();
