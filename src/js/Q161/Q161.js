import {init,$svg} from '../common/init';
import chengcailv from "../Q161/chengcailv";
import quality from "../Q161/quality";
import production from "../Q161/production";
import zhitaotong from "../Q161/zhitaotong";
import fanxiufasheng from "../Q161/fanxiufasheng";
import benjifanxiu from "../Q161/benjifanxiu";
import device from "../Q161/device";
import kucun from "../Q161/kucun";
import boliao from "../Q161/boliao";
import clickEvent from "../Q161/clickEvent";

(function () {
    // 初始化svg宽高
    init({reportName:'report0',tdId:'a1',id:'Q161'});

    setTimeout(function () {
    // 生产
    production();
    //总体薄料
    boliao();
    // 成材率
    chengcailv();
    // 质量
    quality();
    //库存
    kucun();
    //返修发生量
    fanxiufasheng();
    //本机返修量
    benjifanxiu();
    //纸套茼
    zhitaotong();
    //设备停机
    device();
    //点击
    clickEvent();
    },500)

})();

