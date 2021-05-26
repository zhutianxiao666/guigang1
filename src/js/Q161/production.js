import {tiaoXinTu,arc} from "../common/myechars";
import {getTd,getArr,textCenter} from "../common/common";
import {$svg} from "../common/init";

export default function () {
    // 总产量
    (function () {
            const dayData = getTd('report1','B2').text();
            const monthData = getTd('report1','B3').text();
            $svg.find('#zuorichanliang .text').text(Number(dayData).toFixed(1));
            $svg.find('#dangyuechanliang .text').text(Number(monthData).toFixed(1));
    })();

       // 早晚班
    (function () {
        const banzu = getArr('report1','B4');
        const rishuju = getArr('report1','C4');
        const yueshuju = getArr('report1','D4');
        const zaoban = {
            'id':'zaoban',
            data: [rishuju[0],yueshuju[0]],
            width: 384.125,
            x: 387.831,
            shift_group:banzu[0]
        }
        const banzu2 = getArr('report1','B5');
        const rishuju2 = getArr('report1','C5');
        const yueshuju2 = getArr('report1','D5');
        const wanban = {
            'id':'wanban',
            data: [rishuju2[0],yueshuju2[0]],
            width: 384.125,
            x: 387.831,
            shift_group:banzu2[0]
        }
        tiaoXinTu(zaoban);
        tiaoXinTu(wanban);
    })();
}