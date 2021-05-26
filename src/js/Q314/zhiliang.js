import {doubleArc,table} from "../common/myechars";
import {getData} from "../common/common";
import {$svg} from "../common/init";

export default function () {
    // 缺陷改判率
    doubleArc({
        rIn:130.638,
        xIn:139.924,
        yIn:1182.63,
        numIn:getData('report1','A23'),
        rOut:160,
        xOut:110.548,
        yOut:1184.03,
        numOut:getData('report1','B23'),
        length:2,
        $ele:'#quexiangaipanlv_1_'
    });
    // 缺陷改判率早
    doubleArc({
        rIn:130.638,
        xIn:521.26,
        yIn:1180,
        numIn:getData('report1','B29'),
        rOut:160,
        xOut:491.885,
        yOut:1181.657,
        numOut:getData('report1','C29'),
        length:2,
        $ele:'#quexiangaipanlvzaoban',
        shift_group:getData('report1','A29')
    });
    // 缺陷改判率晚      M866.371,1178.084c0-88.372,71.637-160.008,160.009-160.008c49.71,0,94.126,22.667,123.475,58.228
    doubleArc({
        rIn:130.638,
        xIn:895.746,
        yIn:1176.686,
        numIn:getData('report1','B32'),
        rOut:160,
        xOut:866.371,
        yOut:1178.084,
        numOut:getData('report1','C32'),
        length:2,
        $ele:'#quexiangaipanlvwanban',
        shift_group:getData('report1','A32')
    });
    // cp符合率
    doubleArc({
        rIn:130.634,
        xIn:139.924,
        yIn:1524.887,
        numIn:getData('report1','A26'),
        rOut:160,
        xOut:110.548,
        yOut:1526.283,
        numOut:getData('report1','B26'),
        length:2,
        $ele:'#xianhuowanchenglv_1_'
    });

    // cp符合率早班
    doubleArc({
        rIn:130.634,
        xIn:521.26,
        yIn:1522.516,
        numIn:getData('report1','B35'),
        rOut:160,
        xOut:491.885,
        yOut:1523.912,
        numOut:getData('report1','C35'),
        length:2,
        $ele:'#cpgaipanlvzaoban',
        shift_group:getData('report1','A35')
    });
    // cp符合率晚班 M865.371,1512.901c0-88.371,71.637-160.008,
    doubleArc({
        rIn:130.639,
        xIn:894.746,
        yIn:1511.503,
        numIn:getData('report1','B38'),
        rOut:160,
        xOut:865.371,
        yOut:1512.901,
        numOut:getData('report1','C38'),
        length:2,
        $ele:'#cpgaipanlvwanban',
        shift_group:getData('report1','A38')
    });
    // 产品检化验
    $svg.find('#chanpinjianhuatixing .left').click(function () {
        $svg.find('#chanpinjianhuatixing .mingxi').attr('data-index','left');
        table({
            $ele:'#chanpinjianhuatixing',
            width: 790.938,
            data: getData('report1','A41'),
            titles: ['机组号','试验时间','班次号','批次号'],
            order:[1,2,1,1]
        });
    });
    // 初始化
    $svg.find('#chanpinjianhuatixing .left').click();
    $svg.find('#chanpinjianhuatixing .right').click(function () {
        $svg.find('#chanpinjianhuatixing .mingxi').attr('data-index','right');
        table({
            $ele:'#chanpinjianhuatixing',
            width: 790.938,
            data: getData('report1','B41'),
            titles: ['材料号','取样位置','试验次数','涂层厚度'],
            order:[2,1,1,1]
        });
    });



    // 生产异常提醒
    $svg.find('#yichangtixing .left').click(function () {
        $svg.find('#yichangtixing .mingxi').attr('data-index','left');
        table({
            $ele:'#yichangtixing',
            width: 1080,
            data: getData('report1','A44'),
            titles: ['作业计划号','出口材料号','封锁代码'],
            order:[1,2,1]
        });
    });
    $svg.find('#yichangtixing .left').click();
    // 来料异常提醒
    $svg.find('#yichangtixing .right').click(function () {
        $svg.find('#yichangtixing .mingxi').attr('data-index','right');
        table({
            $ele:'#yichangtixing',
            width: 1080,
            data: getData('report1','B44'),
            titles: ['作业计划号','入口材料号','封锁代码'],
            order:[1,2,1]
        });
    });


    // 技术通知单
    table({
        $ele: '#jishutongzhidan',
        width: 890,
        data: getData('report1','A47'),
        titles: ['作业计划号','计划通知单号'],
        order: [1,1]
    });
}