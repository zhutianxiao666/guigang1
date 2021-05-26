import {$svg} from "../common/init";
import {zhuZhuangTu,bingTu} from "../common/myechars";
import {getArr, getTd, Q_QArr} from "../common/common";

export default function () {
    // 获取容器元素
    console.log(Q_QArr(getTd('report1', 'B37').text()));
    zhuZhuangTu({
        width:900,
        height:459,
        color:['#036EB8','#2EA7E0'],
        x:2100,
        y:700,
        data:getTd('report1','B37').text(),
        order1:['Q07','Q05'],
        order2: ['Q412','Q012'],
        $ele: $svg.find('#kucunzhuzhuangtu'),
        margin:0.3,
        textY:800,
        dataType:'竖表'
    });
    bingTu({
        data:getArr('report1','A39'),
        rOut:100,
        rIn:65,
        color:['#F59122','#004DB5','#36C2E5','#EFD95B'],
        x:3443,
        y:370,
        $ele:'#bingtu'
    });

}