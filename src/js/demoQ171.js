import {getTd,textCenter} from "./common/common";
import {init,$svg} from './common/init';
import production from './Q171/production';
import chengcailv from "./Q171/chengcailv";
import kucun from "./Q171/kucun";
import quality from './Q171/quality';
import others from './Q171/others';
import clickEvent from './Q171/clickEvent';

(function () {
    // 初始化svg宽高
    init({reportName:'report0',tdId:'a1',id:'Q171'});
    $('body').append('<div id="TipsText" style="position: absolute;left: 0;top: 0;display: none;color: white;background-color: rgba(0,0,0,0.2)">分类名：机组号</div>')
    setTimeout(function () {
        // 生产
        production();
        // 成材率
        chengcailv();
        // 库存
        kucun();
        // 质量
        quality();
        // 其他
        others();
        // 点击异常
        clickEvent();
    },1000)

})();