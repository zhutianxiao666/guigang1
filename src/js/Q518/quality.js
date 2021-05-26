import {banYuan, changeText, doubleArc, table} from "../common/myechars";
import {getArr, getTd, getUnitCode} from "../common/common";
import {$svg} from "../common/init";
import mingxi from "../common/mingxi";


export default function () {
    const unit_code = getUnitCode('Q518');
    // 异常提醒
    (function () {
        const list1 = getTd('report1','A29').text();
        table({
            width: 1080,
            data: list1,
            titles: ['作业计划号','入口材料号','出口材料号','封锁代码'],
            order: [1,1,1,1],
            $ele: $svg.find('#yichangtixing')
        });
        $svg.find('#yichangtixing .mingxi').click(function () {
            mingxi({
                system:'DBPRODE7',
                sqlStr:`
                select plan_no||'Q_Q'||in_mat_no||'Q_Q'||out_mat_no||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 来料异常  from IMSIJ4.TIMSIJ4GC
where UNIT_CODE='${getUnitCode() || 'Q518'}'`,
                order:[1,1,1,1,2,2],
                title:["作业计划号","入口材料号","出口材料号","封锁代码","封闭缺陷","其它缺陷"],
                width:150
            });
        });
    })();
    // 特殊需求
    (function () {
        const list1 = getTd('report1','B29').text();
        table({
            width: 890,
            data: list1,
            titles: ['作业计划号','顺序号','入口材料号'],
            order: [1,1,1],
            $ele: $svg.find('#teshuyaoqiu')
        });
        $svg.find('#teshuyaoqiu .mingxi').click(function () {
            mingxi({
                system:'硅钢L3',
                sqlStr:`
                SELECT A.PLAN_NO||'Q_Q'||
       B.UNIT_SEQ_NO||'Q_Q'||
       A.IN_MAT_NO||'Q_Q'||
       A.SPECIAL_INST_DESC||'Q_Q'||
       A.TEST_ADD_DESC||'Q_Q'||
       A.ORDER_SPECIAL||'-*-' 特殊需求
  FROM ${getUnitCode() == 'Q318' ? 'TPSQ318' : 'TPSQ518' } A,${getUnitCode() == 'Q318' ? 'TPSM318' : 'TPSM518' } B
 WHERE     A.UNIT_NO = '${getUnitCode() || 'Q518'}'
       AND A.TRACK_STATUS >= '8'
       AND A.IN_MAT_NO = B.IN_MAT_NO
       AND (A.SPECIAL_INST_DESC <> ' ' OR A.TEST_ADD_DESC <> ' ' OR A.ORDER_SPECIAL <> ' ')
ORDER BY UNIT_SEQ_NO`,
                order:[1,1,1,1,2,2],
                title:["计划号","顺序号","入口材料号","特别指令中文说明","试验补充说明","合同特殊要求"],
                width:100
            });
        })
    })();
    (function () {
        // 缺陷改判率
        doubleArc({
            rIn:146.96,
            rOut:180,
            numIn:Number(getTd('report1','A32').text()),
            numOut:Number(getTd('report1','B32').text()),
            xIn:708.82,
            yIn:1189.129,
            xOut:675.775,
            yOut:1190.703,
            $ele:'#quexiangaipanlv_1_',
            length:2
        });
        // 现货发生率
        doubleArc({
            rIn:146.96,
            rOut:180,
            numIn:Number(getTd('report1','A35').text()),
            numOut:Number(getTd('report1','B35').text()),
            xIn:708.82,
            yIn:1519.022,
            xOut:675.775,
            yOut:1520.593,
            $ele:'#xianhuowanchenglv_1_',
            length:2
        });
    })();
    // 成品计划量
    (function () {
        changeText({$ele:'#dangyuechanliang_4_ .text',reportName:'report1',tdId:'D35',length:2});
        changeText({$ele:'#dangyuechanliang_3_ .text',reportName:'report1',tdId:'E35',length:2})
    })();
    // cp符合率
    (function () {
        // 早班
        doubleArc({
            xIn:193.916,
            yIn:1169.952,
            rIn:129.621,
            numIn:Number(getTd('report1','E32').text()),
            xOut:164.769,
            yOut:1171.34,
            rOut:158.767,
            numOut:Number(getTd('report1','F32').text()),
            $ele:$svg.find('#CPfuhelv_1_ .zaoban'),
            shift_group:getTd('report1','D32').text(),
            length:2
        });
        // 晚班
        doubleArc({
            xIn:193.916,
            yIn:1449.777,
            rIn:129.621,
            numIn:Number(getTd('report1','H32').text()),
            xOut:164.769,
            yOut:1451.163,
            rOut:158.767,
            numOut:Number(getTd('report1','I32').text()),
            $ele:$svg.find('#CPfuhelv_1_ .wanban'),
            shift_group:getTd('report1','G32').text(),
            length:2
        });
    })();
    // 放行量放行率
    (function () {

        banYuan({
            x: 1246.038,
            y: 1190.703,
            r: 180,
            numTop: getTd('report1','D29').text(),
            numBottom: getTd('report1','E29').text(),
            $ele:'#fangxinglv_1_month'
        });

        //      M1246.038,1520.593c0-99.41,80.587-180,179.999-180c55.92,0,105.886,25.5,138.9,65.504
        banYuan({
            x: 1246.038,
            y: 1520.593,
            r: 180,
            numTop: getTd('report1','F29').text(),
            numBottom: getTd('report1','G29').text(),
            $ele:'#fangxinglv_1_year'
        });
//         // 跳转链接
//         $svg.find('#fangxinglv_1_month').click(function () {
//
//             mingxi({
//                 system:'DBPRODE7',
//                 sqlStr:`
// SELECT
// substr(COMPLEX_DECIDE_TIME,1,8) date,
// PASS_MAT_WEIGHT,
// ATTR_PLA,
// PDCODE_DESCR,
// COMPLEX_DECIDE_TIME
// FROM BGRAGGDA.SISU_MMSI_TMMSI16
// WHERE ATTR_PLA ='${getUnitCode('Q518')}'
// AND PDCODE_DESCR = '放行'
// AND HOLD_CAUSE NOT IN ('返回卷')
// AND COMPLEX_DECIDE_TIME >= to_char(last_day(sysdate - 1 month),'yyyymmdd')||'220000'
// AND COMPLEX_DECIDE_TIME < to_char(sysdate - 1 days,'yyyymmdd')||'220000'`,
//                 order:[1,1,1,1,1,1],
//                 title:["日期","重量","机组号","描述","综合评定时间"],
//                 width:100
//             });
//         })
    })();
    // 点击跳转
    // 缺陷改判率
    $svg.find('#quexiangaipanlv_1_').on('click',function () {
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/弹出明细/缺陷改判率.frm","para":{"__pi__":true,"unit_code":"${unit_code}"},"target":"_dialog","feature":{"width":1600,"height":1000,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true)
    });
    // cp符合率
    $svg.find('#CPfuhelv_1_').on('click',function () {
        IPlatInterop.Call4CForm('ZHPJ0003');
    });
    // 现货发生率
    $svg.find('#xianhuowanchenglv_1_').on('click',function () {
        console.log('现货明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/弹出明细/现货明细.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode('Q518')}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
        // FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E7%258E%25B0%25E8%25B4%25A7%25E6%2598%258E%25E7%25BB%2586.cpt","para":{"__pi__":true,"unit_code":"${unit_code}"},"target":"_dialog","feature":{"width":1600,"height":1000,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true)
    });
};
