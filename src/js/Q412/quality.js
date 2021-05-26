import {doubleArc, table} from "../common/myechars";
import {getArr,getTd} from "../common/common";
import {$svg} from "../common/init";

export default function () {
    // 产品检化验指标提醒
    const list1 = getTd('report1','A28').text();
    table({
        width: 890,
        data: list1,
        titles: ['材料号','碳成分','氧成份传动侧D','氧成份'],
        order: [2,1,2,1],
        $ele: $svg.find('#chanpinjianhuatixing')
    });
    // 生产质量异常
    const list2 = getTd('report1','A30').text();
    table({
        width: 1080,
        data: list2,
        titles: ['作业计划号','入口材料号','封锁代码'],
        order: [1,2,1],
        $ele: $svg.find('#shengchanzhiliangyichang')
    });
    //来料质量异常提醒
    const list3 = getTd('report1','A32').text();
    table({
        width: 890,
        data: list3,
        titles: ['作业计划号','入口材料号','封锁代码'],
        order: [1,2,1],
        $ele: $svg.find('#lailiaozhiliangyichang_1_')
    });
    // 缺陷改判率
    doubleArc({
        rIn:146.96,
        rOut:180,
        numIn:Number(getTd('report1','A18').text()),
        numOut:Number(getTd('report1','B18').text()),
        //306,1220.594
        xIn:164.306,
        yIn:1220.594,
        //131.261,1222.168c0
        xOut:131.261,
        yOut:1222.168,
        $ele:'#quexiangaipanlv_1_',
        length:2
    });
    // CP符合率
    doubleArc({
        rIn:146.96,
        rOut:180,
        numIn:Number(getTd('report1','B15').text()),
        numOut:Number(getTd('report1','B14').text()),
        //306,1220.594
        xIn:704.808,
        yIn:1217.396,
        //131.261,1222.168c0
        xOut:671.763,
        yOut:1218.966,
        $ele:'#cpfuhelv',
        length:2
    });
}