import {$svg} from "../common/init";
import {zhuZhuangTu} from "../common/myechars";
import {getArr, getTd, Q_QArr} from "../common/common";

export default function () {
    // 获取容器元素
    console.log(Q_QArr(getTd('report1', 'B37').text()));
    zhuZhuangTu({
        //matrix(0.9484 0 0 1 2190.2266 800.229)
        width:1700,
        height:410,
        x:2080,
        y:700,
        color:['#036EB8','#2EA7E0','#9FA0A0'],
        data:getTd('report1','A15').text(),
        order1:getArr('report1','B15'),
        order2: ['实际库存','超7天','超30天'],
        $ele: $svg.find('#kucunzhuzhuangtu'),
        margin:0.3,
        textY:800,
        dataType:'竖表'
    });
     (function () {
            const day = getTd('report1','D15').text();
            const month = getTd('report1','E15').text();
            const wanchenglv = getTd('report1','G15').text();
            $svg.find('#zuorichanliang_1_ .text').text(Number(day).toFixed(2));
            $svg.find('#zuorichanliang_2_ .text').text(Number(month).toFixed(2));
            $svg.find('#zuorichanliang_3_ .text').text(wanchenglv);
    })();

}