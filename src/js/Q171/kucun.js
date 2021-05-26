import {$svg} from "../common/init";
import {zhuZhuangTu_171} from "../common/myechars";
import {getArr, getTd, Q_QArr} from "../common/common";
import zhexiantu from "../common/myechars/zhexiantu";

export default function () {

    zhuZhuangTu_171({
        width:1650.835,
        height:207.798,
        color:['#0C67A5','#2EA7E0','#8034B2'],
        x:2137.25,
        y:375.073,
        data:Q_QArr(getTd('report1','B18').text()),
        order1:getArr('report1','A18'),
        order2: ['实际库存','超7天','超30天'],
        $ele: $svg.find('#kuqu'),
        margin:0.3,
        textY:433.0825
    });
    zhexiantu({
        $ele:'#kuquludianqush',
        data:getTd('report1','B69').text(),
        order:['dew_point','DIFF'],
        x:2208.092,
        y:783.599,
        width:1528.481,
        height:219.939,
        colors: ['rgb(0, 204, 255)','rgb(255, 166, 0)']
    });
}