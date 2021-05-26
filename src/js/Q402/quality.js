import {banYuan, doubleArc, table} from "../common/myechars";
import {getArr,getTd} from "../common/common";
import {$svg} from "../common/init";

export default function () {
    // 缺陷改判率
    doubleArc({
        rIn:146.954,
        rOut:180,
        numIn:Number(getTd('report1','B22').text()),
        numOut:Number(getTd('report1','C22').text()),
        xIn:200.071,
        yIn:1189.123,
        xOut:167.026,
        yOut:1190.697,
        $ele:'#quexiangaipanlv',
        length:2
    });
    // CP符合率
    doubleArc({
        rIn:146.954,
        rOut:180,
        numIn:Number(getTd('report1','B23').text()),
        numOut:Number(getTd('report1','C23').text()),
        xIn:761.16,
        yIn:1189.128,
        xOut:728.115,
        yOut:1190.698,
        $ele:'#CPfuhelv',
        length:2
    })
    // 现货发生率
    banYuan({
        x: 1230,
        y: 1200,
        r: 60,
        numTop: getTd('report1','D24').text(),
        $ele:'#xianhuowanchenglv'
    });
    // C级品率
    banYuan({
        x: 1500,
        y: 1200,
        r: 60,
        numTop: getTd('report1','E24').text(),
        $ele:'#cjipinlv'
    });

    // 来料异常
    (function () {
        const list1 = getTd('report1','D25').text();
        table({
            width: 802.623,
            data: list1,
            titles: ['作业计划号','入口材料号','封锁代码'],
            order: [1,1,1],
            $ele: $svg.find('#lailiaoyichang')
        });
    })();

    // 生产异常
    (function () {
        const list1 = getTd('report1','D26').text();
        table({
            width: 802.623,
            data: list1,
            titles: ['产出机组','出口材料号','封锁代码'],
            order: [1,1,1],
            $ele: $svg.find('#shengchanyichang')
        });
    })();

    // 检化验
    (function () {
        const list1 = getTd('report1','D27').text();
        table({
            width: 1439.288,
            data: list1,
            titles: ['记录状态','机组号','试验时间','班次号','班别号','批次号','1#乳化槽-PH值'],
            order: [1,1,2,1,1,1,1],
            $ele: $svg.find('#jianhuayan')
        });
    })();

}