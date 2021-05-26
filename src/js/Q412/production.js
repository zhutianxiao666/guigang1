import {tiaoXinTu,arc} from "../common/myechars";
import {getTd,getArr,textCenter} from "../common/common";
import {$svg} from "../common/init";

export default  function () {
    // 本月产量
    (function () {
        // 速度符合率
        arc({
            x:276.86,
            y:262.442,
            r:180,
            type:'double',
            num1:Number(getTd('report1','B9').text()).toFixed(1),
            num2:Number(getTd('report1','C9').text()).toFixed(1),
            $ele: $svg.find('#shengchan')
        });
        textCenter($svg.find('#shengchan .num1'));
        textCenter($svg.find('#shengchan .num2'));
        
    })();
}