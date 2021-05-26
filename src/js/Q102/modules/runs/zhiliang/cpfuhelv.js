import {doubleArc} from "@/js/common/myechars_2"
import {getData} from "@/js/common/common";

export default function (box) {
    doubleArc({
        rIn:147,
        xIn:631,
        yIn:1333.724,
        numIn:getData('report1','A24'),
        rOut:180,
        xOut:598,
        yOut:1333.724,
        numOut:getData('report1','B24'),
        length:0,
        $ele:box.querySelector('#CPfuhelv_1_')
    });

    doubleArc({
        rIn:147,
        xIn:1125.911,
        yIn:1337.724,
        numIn:getData('report1','A28'),
        rOut:180,
        xOut:1093,
        yOut:1339,
        numOut:getData('report1','B28'),
        length:0,
        $ele:box.querySelector('#xianhuofashenglv')
    });
}