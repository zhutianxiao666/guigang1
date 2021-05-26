import {tiaoXinTu} from "../common/myechars";
import {getData, getUnitCode} from "@/js/common/common";
import {$svg} from "@/js/common/init";

export default function () {
    // 早班
    tiaoXinTu({
        x:2522.767,
        id:'zaobannenghao_2_',
        data:[getData('report1','B49'),getData('report1','C49')],
        width:461.277
    });
    // 晚班
    tiaoXinTu({
        x:2522.767,
        id:'wanbannenghao_2_',
        data:[getData('report1','B50'),getData('report1','C50')],
        width:461.277
    });

    // 点击弹出
    $svg.find('#nenghao').click(function () {
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/弹出明细/能耗趋势.frm","para":{"__pi__":true,"unit_code":"${getUnitCode('Q518')}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    })
}