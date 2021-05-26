
import {getData, getTd} from "../common/common";
import {doubleArc} from "../common/myechars";
import {$svg} from "../common/init";
export default function () {
    // 早班
    doubleArc({
        rIn:158.607,
        rOut:194.271,
        numIn:Number(getTd('report1','B10').text()),
        numOut:Number(getTd('report1','B11').text()),
        xIn:2752.45,
        yIn:372.451,
        xOut:2716.786,
        yOut:374.147,
        $ele:'#zaobanchengcailv',
        shift_group:getTd('report1','B12').text(),
        length:2
    })
    // 晚班
    doubleArc({
        rIn:158.607,
        rOut:194.271,
        numIn:Number(getTd('report1','C10').text()),
        numOut:Number(getTd('report1','C11').text()),
        xIn:2752.45,
        yIn:721.405,
        xOut:2716.786,
        yOut:723.103,
        $ele:'#wanbanchengcailv',
        shift_group:getTd('report1','C12').text(),
        length:2
    });
    // 跳转链接
    // 早班

    $svg.find('#zaobanchengcailv').click(function () {
        console.log('点击早班')
        const shift_group = getData('report1','B12').toUpperCase();
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2588%2590%25E6%259D%2590%25E7%258E%2587%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"COUNTER.FILTERED":"true","REF_C":"d146747a-f587-4c28-9522-85be3dfb3587","FORMLETNAME":"Form1.frm","WIDGETVERSION":"1","REF_T":"design","CMD":"load_content","HEADERADDED":"true","_":"1612858559410","type":"MD","ITEM_ENAME":"PROD_","SORT":"","unit":"吨","item_ename_day":"OUTPUT_RATE_GROUP_D","item_ename_month":"OUTPUT_RATE_GROUP_M","table_name":"TIMSIJ4GT","unit_code":"Q314","shift_group":"${shift_group}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 晚班

    $svg.find('#wanbanchengcailv').click(function () {
        console.log('点击晚班')
        const shift_group = getData('report1','C12').toUpperCase();
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2588%2590%25E6%259D%2590%25E7%258E%2587%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"COUNTER.FILTERED":"true","REF_C":"d146747a-f587-4c28-9522-85be3dfb3587","FORMLETNAME":"Form1.frm","WIDGETVERSION":"1","REF_T":"design","CMD":"load_content","HEADERADDED":"true","_":"1612858559410","type":"MD","ITEM_ENAME":"PROD_","SORT":"","unit":"吨","item_ename_day":"OUTPUT_RATE_GROUP_D","item_ename_month":"OUTPUT_RATE_GROUP_M","table_name":"TIMSIJ4GT","unit_code":"Q314","shift_group":"${shift_group}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });

}