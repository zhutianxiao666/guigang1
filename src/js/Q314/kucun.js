import {zhuZhuangTu,table} from "../common/myechars";
import {getData} from "../common/common";

export default function () {
    // 柱状图
    zhuZhuangTu({
        x : 2122.101,
        y: 723.304,
        width: 703.337,
        height: 482.52,
        data:getData('report1','A51'),
        color:['#036EB8','#2EA7E0','#9FA0A0'],
        order1: ['Q15','Q18'],
        order2:['实际库存','超7天','超30天'],
        $ele:'#kucunzhuzhuangtu',
        margin: 0.3,
        textY:800,
        dataType:'竖表'
    })

    // 超期异常提醒
    table({
        width:890,
        data:getData('report1','A53'),
        titles:['超期时间','超期重量','库存号'],
        $ele: '#chaoqiyichangtixing',
        order:[1,1,1]
    });
}