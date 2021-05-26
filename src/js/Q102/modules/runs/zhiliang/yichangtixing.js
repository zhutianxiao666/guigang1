import {table} from "@/js/common/myechars_2";
import {getData, Q_QArr} from "@/js/common/common";

export default function (box) {

    function changeLength(data,sizeArr = []) {
        return data.map(arr => {
            return arr.map((value,index) => {
                if (value.length > sizeArr[index]) {
                    return value.substr(0,sizeArr[index] || 7) + '...'
                }else {
                    return value
                }
            })
        })
    };
    // 来料异常
    table({
        width:910,
        data:changeLength(Q_QArr(getData('report1','A31')),[10,10,7,7]),
        titles:['作业计划号','入口材料号','缺陷封闭代码','封闭缺陷'],
        order:[1,1,1,1],
        $ele:box.querySelector('#yichangtixing')
    });
    // 生产异常

    table({
        width:910,
        data: changeLength(Q_QArr(getData('report1','A34'))),
        titles:['作业计划号','入口材料号','封锁代码','封闭缺陷'],
        order:[1,1,1,1],
        $ele:box.querySelector('#yichangtixing_1_')
    });
    // 产品检化验指标提醒

    table({
        width:1844.314,
        data: changeLength(Q_QArr(getData('report1','A37'))),
        titles: ['记录状态','机组号','试验时间','班次号','班别号','批次号','1#乳化槽-PH值'],
        order: [1,1,2,1,1,1,1],
        $ele: box.querySelector('#teshuyaoqiu')
    });

}