
import {getTd} from "../common/common";
import {doubleArc} from "../common/myechars";
export default function () {
    // 早班
    doubleArc({
        rIn:141.588,
        rOut:173.418,
        numIn:Number(getTd('report1','B13').text()),
        numOut:Number(getTd('report1','C13').text()),
        xIn:1750.85,
        yIn:360.779,
        xOut:1719.014,
        yOut:362.293,
        $ele:'#zaobanchengcailv',
        shift_group:getTd('report1','D13').text(),
        length:2
    })
    // 晚班
    doubleArc({
        rIn:141.588,
        rOut:173.418,
        numIn:Number(getTd('report1','B14').text()),
        numOut:Number(getTd('report1','C14').text()),
        xIn:1750.85,
        yIn:672.575,
        xOut:1719.014,
        yOut:674.09,
        $ele:'#wanbanchengcailv',
        shift_group:getTd('report1','D14').text(),
        length:2
    })
}