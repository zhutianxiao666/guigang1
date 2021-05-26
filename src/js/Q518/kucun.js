import {$svg} from "../common/init";
import {zhuZhuangTu} from "../common/myechars";
import {getArr, getTd, Q_QArr} from "../common/common";

export default function () {
    // 获取容器元素
    zhuZhuangTu({
        width:1100,
        height:459.29,
        color:['#036EB8','#2EA7E0','#9FA0A0'],
        x:2694.014,
        y:719.129,
        data:Q_QArr(getTd('report1','B39').text()),
        order1:getArr('report1','A39'),
        order2: ['Q518','Q018','过度卷'],
        $ele: $svg.find('.content'),
        margin:0.3,
        textY:779.3438
    });


}