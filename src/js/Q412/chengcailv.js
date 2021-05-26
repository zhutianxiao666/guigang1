
import {getTd} from "../common/common";
import {arc, doubleArc} from "../common/myechars";
import {$svg} from "../common/init";
export default function () {
    // 早班
    doubleArc({
        rIn: 145.564,
        rOut: 178.294,
        numIn: Number(getTd('report1', 'B22').text()),
        numOut: Number(getTd('report1', 'C22').text()),
        //653.341,364.739
        xIn: 653.341,
        yIn: 364.739,
        //620.61,366.296
        xOut: 620.61,
        yOut: 366.296,
        length:2,
        $ele: '#zaobanchengcailv_2_',
        shift_group: getTd('report1', 'A22').text()
    });
    doubleArc({
        //1107.056,363.108
        rIn: 145.564,
        rOut: 178.295,
        numIn: Number(getTd('report1', 'B23').text()),
        numOut: Number(getTd('report1', 'C23').text()),
        xIn: 1107.056,
        yIn: 363.108,
        xOut: 1074.325,
        yOut: 364.665,
        length:2,
        $ele: '#zaobanchengcailv_1_',
        shift_group: getTd('report1', 'A23').text()
    });
    doubleArc({
        // M654.147,676.329
        rIn:145.564,
        rOut:178.295,
        numIn:Number(getTd('report1','B24').text()),
        numOut:Number(getTd('report1','C24').text()),
        xIn:654.147,
        yIn:676.329,
        xOut:621.417,
        yOut:677.886,
        length:2,
        $ele:'#zaobanchengcailv_3_',
        shift_group:getTd('report1','A24').text()
    });
    // 晚班
    doubleArc({
        // 1106.813,674.698
        rIn:145.564,
        rOut:178.295,
        numIn:Number(getTd('report1','B25').text()),
        numOut:Number(getTd('report1','C25').text()),
        xIn:1106.813,
        yIn:674.698,
        xOut:1074.082,
        yOut:676.255,
        length:2,
        $ele:'#zaobanchengcailv_4_',
        shift_group:getTd('report1','A25').text()
    });

    // 机组成材率
    (function () {
        // 速度符合率
        arc({
            //1763.813,268.062
            x:1763.813,
            y:268.062,
            r:180,
            num:getTd('report1','A12').text(),
            $ele: $svg.find('#jizuchengcailv')
        })
    })();

}