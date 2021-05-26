import {getData} from "../common/common";
import {doubleArc} from "../common/myechars";

export default function () {
    // 早班
    doubleArc({
        $ele:'#zaobanchengcailv_5_',
        rIn: 158.607,
        xIn: 1678.215,
        yIn: 365.357,
        numIn: getData('report1','B16'),
        rOut: 194.271,
        xOut: 1642.551,
        yOut: 367.054,
        numOut: getData('report1','C16'),
        length:2,
        shift_group:getData('report1','A16')
    });
    // 晚班
    doubleArc({
        $ele:'#wanbanchengcailv_1_',
        rIn: 158.61,
        xIn: 1678.215,
        yIn: 714.312,
        numIn: getData('report1','B19'),
        rOut: 194.269,
        xOut: 1642.551,
        yOut: 716,
        numOut: getData('report1','C19'),
        length:2,
        shift_group:getData('report1','A19')
    });
}