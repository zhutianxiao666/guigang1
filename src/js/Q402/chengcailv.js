import {getTd} from "../common/common";
import {doubleArc} from "../common/myechars";
export default function () {
    // 早班
    doubleArc({
        rIn:95.353,
        rOut:116.792,
        numIn:Number(getTd('report1','B16').text()),
        numOut:Number(getTd('report1','C16').text()),
        xIn:3022.188,
        yIn:713.896,
        xOut:3000.746,
        yOut:714.917,
        $ele:'#zaobanchengcailv',
        shift_group:getTd('report1','D16').text(),
        length:2
    })
    // 晚班
    doubleArc({
        rIn:95.353,
        rOut:116.792,
        numIn:Number(getTd('report1','B17').text()),
        numOut:Number(getTd('report1','C17').text()),
        xIn:3294.397,
        yIn:715.365,
        xOut:3272.957,
        yOut:716.385,
        $ele:'#wanbanchengcailv',
        shift_group:getTd('report1','D17').text(),
        length:2
    })
    // 总体
    doubleArc({
        rIn:95.353,
        rOut:116.792,
        numIn:Number(getTd('report1','B18').text()),
        numOut:Number(getTd('report1','C18').text()),
        xIn:3566.607,
        yIn:711.652,
        xOut:3545.167,
        yOut:712.671,
        $ele:'#zongtichengcailv',
        length:2
    })

}