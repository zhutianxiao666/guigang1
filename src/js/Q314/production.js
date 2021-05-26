import {getArr, getTd ,textCenter} from "../common/common";
import {arc, changeText, tiaoXinTu} from "../common/myechars";
import {$svg} from "../common/init";

export default function () {
    // 产量
    (function () {
        changeText({$ele:'#zuorichanliang',reportName:'report1',tdId:'A3',length:2,type:'number'});
        changeText({$ele:'#dangyuechanliang',reportName:'report1',tdId:'B3',length:2,type:'number'});
    })();
    // 早晚班
    (function () {
        // 早班
        tiaoXinTu({
            x:387.831,
            id:'zaoban',
            data:getArr('report1','B6'),
            shift_group:getTd('report1','A6').text(),
            width:384.125
        });
        // 晚班
        tiaoXinTu({
            x:387.831,
            id:'wanban',
            data:getArr('report1','B9'),
            shift_group:getTd('report1','A9').text(),
            width:384.125
        });
    })();
    // 设备精度
    // arc({$ele:'#fanhuijuan',num,type,x,y,r})
}