
import {getTd} from "../common/common";
import {arc, doubleArc} from "../common/myechars";
import {$svg} from "../common/init";
export default function () {
    // 早班
    console.log(222);
    doubleArc({
        rIn: 158.611,
        rOut: 194.296,
        numIn: Number(getTd('report1', 'B22').text()),
        numOut: Number(getTd('report1', 'C22').text()),
        xIn: 1678.215,
        yIn: 365.357,
        xOut: 1642.551,
        yOut: 367.054,
        length:2,
        $ele: '#zaobanchengcailv_5_',
        shift_group: getTd('report1', 'A22').text()
    });

    // 晚班
    doubleArc({
        rIn:158.61,
        rOut:194.296,
        numIn:Number(getTd('report1','B25').text()),
        numOut:Number(getTd('report1','C25').text()),
        xIn:1678.215,
        yIn:714.312,
        xOut:1642.551,
        yOut:716.009,
        length:2,
        $ele:'#wanbanchengcailv_1_',
        shift_group:getTd('report1','A25').text()
    });

}