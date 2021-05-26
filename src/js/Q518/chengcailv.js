import {$svg} from "@/js/common/init";
import {getTd, getUnitCode} from "../common/common";
import {doubleArc} from "../common/myechars";
export default function () {
    // 早班
    doubleArc({
        rIn:158.6,
        rOut:194.271,
        numIn:Number(getTd('report1','B22').text()),
        numOut:Number(getTd('report1','C22').text()),
        xIn:2264.622,
        yIn:372.451,
        xOut:2228.958,
        yOut:374.147,
        $ele:'#zaobanchengcailv_2_',
        shift_group:getTd('report1','A22').text(),
        length:2
    })
    // 晚班
    doubleArc({
        rIn:158.6,
        rOut:194.271,
        numIn:Number(getTd('report1','B25').text()),
        numOut:Number(getTd('report1','C25').text()),
        xIn:2264.622,
        yIn:721.405,
        xOut:2228.958,
        yOut:723.103,
        $ele:'#wanbanchengcailv_1_',
        shift_group:getTd('report1','A25').text(),
        length:2
    });
    // 成材率点击
    $svg.find('#chengcailv').click(function () {

        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2588%2590%25E6%259D%2590%25E7%258E%2587%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode('Q518')}","type":"MD","ITEM_ENAME":"OUTPUT_RATE_","SORT":"","unit":"%"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });

}