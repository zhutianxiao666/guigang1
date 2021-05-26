import {getTd,textCenter} from "./common/common";
import {init,$svg} from './common/init';
import production from './Q402/production';
import chengcailv from "./Q402/chengcailv";
import kucun from "./Q402/kucun";
import quality from './Q402/quality';
import zhagun from './Q402/zhagun';
import nenghao from './Q402/nenghao';
import fuliao from './Q402/fuliao';
import clickEvent from './Q402/clickEvent';

(function(){
    init({reportName:'report0',tdId:'a1',id:'Q402'});
    setTimeout(function () {
        // 生产
        production();
        // 库存
        kucun();
        // 成材率
        chengcailv();
        // 质量
        quality();
        // 轧辊
        zhagun();
        // 停机
        (function () {
            const times = getTd('report1','B41').text();
            const total = getTd('report1','C41').text();
            $svg.find('#guzhangtingjicishu .tingji_times').text(Number(times));
            $svg.find('#guzhangtingjicishu .tingji_total').text(Number(total));
        })();
        // 能耗
        nenghao();
        // 辅料
        fuliao();
        // 点击事件
        clickEvent();
    },1000)
})();