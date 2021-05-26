import { doubleArc, table} from "../common/myechars";
import {getArr,getTd} from "../common/common";
import {$svg} from "../common/init";

export default function () {
    // 缺陷改判率
    doubleArc({
        rIn:146.954,
        rOut:180,
        numIn:Number(getTd('report1','B22').text()),
        numOut:Number(getTd('report1','C22').text()),
        xIn:296.249,
        yIn:1280.781,
        xOut:263.204,
        yOut:1282.355,
        $ele:'#quexiangaipanlv',
        length:2
    });
    // 小尾卷发生率早班
    doubleArc({
        rIn:146.954,
        rOut:180,
        numIn:Number(getTd('report1','B23').text()),
        numOut:Number(getTd('report1','C23').text()),
        xIn:877.204,
        yIn:1280.781,
        xOut:844.159,
        yOut:1282.355,
        $ele:'#zaobanxiaoweijuan',
        length:2,
        shift_group:getTd('report1','D23').text()
    });
    // 小尾卷发生率晚班
    doubleArc({
        rIn:146.954,
        rOut:180,
        numIn:Number(getTd('report1','B24').text()),
        numOut:Number(getTd('report1','C24').text()),
        xIn:1308.428,
        yIn:1280.781,
        xOut:1275.383,
        yOut:1282.355,
        $ele:'#wanbanxiaoweijuan',
        length:2,
        shift_group:getTd('report1','D24').text()
    });
    
    // 来料异常
    (function () {
        const list1 = getTd('report1','B26').text();
        table({
            width: 802.623,
            data: list1,
            titles: ['作业计划号','出口材料号','封锁代码'],
            order: [1,1,1],
            $ele: $svg.find('#lailiaoyichang')
        });
    })();
    // 特殊要求
    (function () {
        const list1 = getTd('report1','B27').text();
        table({
            width: 802.623,
            data: list1,
            titles: ['作业计划号','生产命令顺序号','入口材料号'],
            order: [1,1,1],
            $ele: $svg.find('#yonghuteshuxuqiu')
        });
    })();
    // 技术通知单
    (function () {
        const list1 = getTd('report1','B28').text();
        table({
            width: 802.623,
            data: list1,
            titles: ['作业计划号','计划通知单号'],
            order: [1,1],
            $ele: $svg.find('#jishutongzhidan')
        });
    })();
    // 质量异议
    (function () {
        const list1 = getTd('report1','B29').text();
        table({
            width: 802.623,
            data: list1,
            titles: ['用户描述','用户异议抱怨'],
            order: [1,1],
            $ele: $svg.find('#zhiliangyiyi')
        });
    })();

}