import { doubleArc, table} from "../common/myechars";
import {getArr, getTd, getUnitCode} from "../common/common";
import {$svg} from "../common/init";
import mingxi from "../common/mingxi";

export default function () {
    // 缺陷改判率
    doubleArc({
        rIn:146.954,
        rOut:180,
        numIn:Number(getTd('report1','B20').text()),
        numOut:Number(getTd('report1','C20').text()),
        xIn:435.282,
        yIn:1258.425,
        xOut:402.237,
        yOut:1259.999,
        $ele:'#quexiangaipanlv',
        length:2
    });
    // CP符合率
    (function () {
        // 不分班
        doubleArc({
            rIn:146.954,
            rOut:180,
            numIn:Number(getTd('report1','B22').text()),
            numOut:Number(getTd('report1','C22').text()),
            xIn:435.282,
            yIn:1614.703,
            xOut:402.237,
            yOut:1616.277,
            $ele:'#zongtiCPfuhelv',
            length:2
        })
        // 早班
        doubleArc({
            rIn:123.149,
            rOut:150.841,
            numIn:Number(getTd('report1','B23').text()),
            numOut:Number(getTd('report1','C23').text()),
            xIn:1033.8,
            yIn:1556.714,
            xOut:1006.108,
            yOut:1558.033,
            $ele:'#zaobanCPfuhelv',
            shift_group: getTd('report1','D23').text(),
            length:2
        })
        // 晚班
        doubleArc({
            rIn:123.149,
            rOut:150.841,
            numIn:Number(getTd('report1','B24').text()),
            numOut:Number(getTd('report1','C24').text()),
            xIn:1446.448,
            yIn:1556.714,
            xOut:1418.756,
            yOut:1558.033,
            $ele:'#wanbanCPfuhelv',
            shift_group: getTd('report1','D24').text(),
            length:2
        })
    })();
    
    // 来料异常
    (function () {
        const list1 = getTd('report1','B26').text();
        table({
            width: 1080,
            data: list1,
            titles: ['作业计划号','入口材料号','出口材料号','封锁代码'],
            order: [1,1,1,1],
            $ele: $svg.find('#yichangtixing')
        });
    })();
    // 特殊要求
    (function () {
        const list1 = getTd('report1','B27').text();
        table({
            width: 890,
            data: list1,
            titles: ['计划号','生产命令顺序','入口材料号'],
            order: [1,1,1],
            $ele: $svg.find('#teshuyaoqiu')
        });
    })();
    // 点击跳转
    // 缺陷改判率
    $svg.find('#quexiangaipanlv').click(function () {
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E7%25BC%25BA%25E9%2599%25B7%25E6%2594%25B9%25E5%2588%25A4%25E6%2598%258E%25E7%25BB%2586.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode('Q403')}","REF_T":"design","HEADERADDED":"true","COUNTER.FILTERED":"true","REF_C":"e7c8cfdb-5183-4e58-b37e-1f899de1705f","FORMLETNAME":"硅钢/314热拉伸平整机组可视化画面.frm","WIDGETVERSION":"1","TABLEA":"TMMQ314","CMD":"load_content","_":"1612843262471"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    //
    $svg.find('#CPfuhelv').click(function () {
        IPlatInterop.Call4CForm('ZHPJ0003');
    });
    // 异常提醒明细
    $svg.find('#yichangtixing .mingxi').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`select plan_no||'Q_Q'||in_mat_no||'Q_Q'||out_mat_no||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 来料异常  from IMSIJ4.TIMSIJ4GC where UNIT_CODE='${getUnitCode('Q403')}'`,
            order:[1,1,1,1,2,2],
            title:["作业计划号","入口材料号","出口材料号","封锁代码","封闭缺陷","其他缺陷"],
            width:100});
    });
    // 特殊需求提醒
    $svg.find('#teshuyaoqiu .mingxi').click(function () {
        mingxi({
            system:'硅钢L3',
            sqlStr:`SELECT A.PLAN_NO||'Q_Q'||
       B.UNIT_SEQ_NO||'Q_Q'||
       A.IN_MAT_NO||'Q_Q'||
       A.SPECIAL_INST_DESC||'Q_Q'||
       A.TEST_ADD_DESC||'Q_Q'||
       A.ORDER_SPECIAL||'-*-' 特殊需求
  FROM TPSQ203  A,TPSM403 B
 WHERE     A.UNIT_NO = '${getUnitCode('Q403')}'
       AND A.TRACK_STATUS >= '8'
       AND A.IN_MAT_NO = B.IN_MAT_NO
       AND (A.SPECIAL_INST_DESC <> ' ' OR A.TEST_ADD_DESC <> ' ' OR A.ORDER_SPECIAL <> ' ')
ORDER BY UNIT_SEQ_NO`,
            order:[1,1,1,1,2,2],
            title:["计划号","机组生产命令顺序号","入口材料号","特别指令中文说明","试验补充说明","合同特殊要求"],
            width:100});
    });
};