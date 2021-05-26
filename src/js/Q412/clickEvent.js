import {$svg} from "../common/init";
import {getData,getUnitCode} from "../common/common";
import mingxi from "../common/mingxi";

export default function () {
    const unit_code = getUnitCode('Q412')
    // 生产
    $svg.find('#shengchan').click(function () {
        FR.doHyperlink(event||window.event, [{"data":"var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({\"url\":\"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E4%25BA%25A7%25E9%2587%258F%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm\",\"para\":{\"__pi__\":true,\"COUNTER.FILTERED\":\"true\",\"REF_C\":\"d146747a-f587-4c28-9522-85be3dfb3587\",\"FORMLETNAME\":\"Form1.frm\",\"WIDGETVERSION\":\"1\",\"REF_T\":\"design\",\"CMD\":\"load_content\",\"HEADERADDED\":\"true\",\"_\":\"1612853075454\",\"type\":\"MD\",\"ITEM_ENAME\":\"PROD_\",\"SORT\":\"\",\"unit\":\"吨\"},\"target\":\"_dialog\",\"feature\":{\"width\":1300,\"height\":800,\"isCenter\":true,\"title\":\"\"},\"title\":\"网络报表1\"})}, this, as)","name":"网络报表1"}], true);
    });
    // 成材率跳转
    const chengcailvArr = [
        {
            $ele: '#zaobanchengcailv_2_',
            shift_group:'A'
        },
        {
            $ele: '#zaobanchengcailv_1_',
            shift_group:'B'
        },
        {
            $ele: '#zaobanchengcailv_3_',
            shift_group:'C'
        },
        {
            $ele: '#zaobanchengcailv_4_',
            shift_group:'D'
        },
    ]
    chengcailvArr.forEach(value => {
        $svg.find(value.$ele).click(function () {
            FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2588%2590%25E6%259D%2590%25E7%258E%2587%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"COUNTER.FILTERED":"true","REF_C":"d146747a-f587-4c28-9522-85be3dfb3587","FORMLETNAME":"Form1.frm","WIDGETVERSION":"1","REF_T":"design","CMD":"load_content","HEADERADDED":"true","_":"1612850868131","type":"MD","ITEM_ENAME":"PROD_","SORT":"","unit":"吨","table_name":"TIMSIJ4GT","item_ename_day":"OUTPUT_RATE_GROUP_D","item_ename_month":"OUTPUT_RATE_GROUP_M","shift_group":"${value.shift_group}","unit_code":"Q412"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`, "name":"网络报表1"}], true)
        })
    });
    $svg.find('#jizuchengcailv').click(function () {
        FR.doHyperlink(event||window.event, [{"data":"var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({\"url\":\"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2588%2590%25E6%259D%2590%25E7%258E%2587%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm\",\"para\":{\"__pi__\":true,\"COUNTER.FILTERED\":\"true\",\"REF_C\":\"d146747a-f587-4c28-9522-85be3dfb3587\",\"FORMLETNAME\":\"Form1.frm\",\"WIDGETVERSION\":\"1\",\"REF_T\":\"design\",\"CMD\":\"load_content\",\"HEADERADDED\":\"true\",\"_\":\"1612854949283\",\"type\":\"MD\",\"ITEM_ENAME\":\"PROD_\",\"SORT\":\"\",\"unit\":\"吨\",\"item_ename_day\":\"OUTPUT_RATE_D\",\"item_ename_month\":\"OUTPUT_RATE_M\",\"table_name\":\"TIMSIJ4GS\",\"unit_code\":\"Q412\",\"shift_group\":\"\"},\"target\":\"_dialog\",\"feature\":{\"width\":1300,\"height\":800,\"isCenter\":true,\"title\":\"\"},\"title\":\"网络报表1\"})}, this, as)","name":"网络报表1"}], true)
    })
    // 缺陷改判率
    $svg.find('#quexiangaipanlv_1_').click(function () {
        console.log('缺陷改判明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/缺陷改判明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // cp符合率
    $svg.find('#cpfuhelv').click(function () {
        IPlatInterop.Call4CForm('ZHPJ0003');
    });
    // 来料异常
    $svg.find('#lailiaozhiliangyichang_1_ .mingxi').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`select plan_no||'Q_Q'||out_mat_no||'Q_Q'||to_char(to_date(SPARE_TIME_1,'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss')||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 来料异常  from IMSIJ4.TIMSIJ4GC
            where UNIT_CODE='${getUnitCode()}'`,
            order:[1,1,1,1,2,2],
            title:['作业计划号','出口材料号','产出时间','封锁代码','其它缺陷','封闭缺陷'],
            width:100
        });
    });
    // 生产质量异常
    $svg.find('#shengchanzhiliangyichang .mingxi').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`select plan_no||'Q_Q'||out_mat_no||'Q_Q'||to_char(to_date(SPARE_TIME_1,'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss')||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 生产异常  from IMSIJ4.TIMSIJ4GC
            where PRE_UNIT_CODE='${getUnitCode()}'`,
            order:[1,1,1,1,2,2],
            title:['作业计划号','出口材料号', '产出时间','封锁代码','封闭缺陷','其他缺陷'],
            width:100
        });
    });
    // 检化验提醒
    $svg.find('#chanpinjianhuatixing .mingxi').click(function () {
        mingxi({
            system:'硅钢L3',
            sqlStr:`SELECT C.MAT_NO||'Q_Q'||
        to_char(to_date(A.PROD_END_TIME,'yyyy-MM-dd hh24:mi:ss'),'yyyy-MM-dd hh24:mi:ss')||'Q_Q'||
       round(B.C*10000)||'Q_Q'||
       round(B.O_D*10000)||'Q_Q'||
       round(B.O*10000)||'Q_Q'||
       round(B.O_W*10000)||'Q_Q'||
       round((B.O_D*0.25 + B.O_W*0.25 + B.O*0.5)*10000)||'Q_Q'||
       round(B.N_D*10000)||'Q_Q'||
       round(B.N*10000)||'Q_Q'||
       round(B.N_W*10000)||'Q_Q'||
       round((B.N_D*0.25 + B.N_W*0.25 + B.N*0.5)*10000)||'Q_Q'||
       to_char(C.MGO_WATER,'0.999')||'Q_Q'||
       to_char(C.MGO_FREE_WATER,'0.999')||'Q_Q'||
       to_char(C.T_MG0_THICK_DS,'0.999')||'Q_Q'||
       to_char(C.T_MG0_THICK_WS,'0.999')||'Q_Q'||
       to_char(((C.T_MG0_THICK_DS+C.T_MG0_THICK_WS)/2),'0.999')||'Q_Q'||
       to_char(C.B_MG0_THICK_DS,'0.999')||'Q_Q'||
       to_char(C.B_MG0_THICK_WS,'0.999')||'Q_Q'||
       to_char(((C.B_MG0_THICK_DS+C.B_MG0_THICK_WS)/2),'0.999')||'-*-'  检化验指标
    FROM TMMQ412 A,TCMRS11 B,TCMRS11 C
 WHERE     A.UNIT_NO = '${getUnitCode()}'
       AND A.OUT_MAT_NO = C.MAT_NO
       AND B.MAT_NO = C.MAT_NO
       AND B.C > 0
       AND C.MGO_WATER >0
       AND SUBSTR(A.PROD_END_TIME,1,8) > TO_CHAR(LAST_DAY(current date - 2 months) + 1 DAY,'YYYYMMDD') 
ORDER BY A.PROD_END_TIME DESC`,
            order:[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
            title:['材料号','产出时间','碳成分','氧成分(传动侧D)','氧成分','氧成分（操作侧W）','氧含量三点计算','氮成分（传动侧D）','氮成分','氮成分（操作侧W）','氮含量三点计算值','MGO涂层含水率','MgO自由水率','MGO膜厚上1','MGO膜厚上2','MGO膜厚上平均','MGO膜厚下1','MGO膜厚下2','MgO膜厚下平均'],
            width:150
        });
    });

    // 停机明细
    // $svg.find('#tingji').click(function () {
    //
    //     FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/停机明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    // });


    // 故障停机明细
    $svg.find('#guzhangshijian_1_').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`
SELECT
unit_code||'Q_Q'||
sd_start||'Q_Q'||
sd_end||'Q_Q'||
subtotal||'Q_Q'||
sd_description||'Q_Q'||
rs_description||'Q_Q'||
sd_type||'Q_Q'||
sd_time||'Q_Q'||
attribute||'Q_Q'||
id||'Q_Q'||
spare_time_1||'-*-' as 明细
FROM ttmsij4pe
 WHERE UNIT_CODE = '${unit_code}'
   AND SD_TYPE IN ('3','4')
   AND SUBSTR (SD_DATE, 1, 6) = to_char(current date,'yyyymm')
   AND SD_DESCRIPTION != '断带'`,
            order:[1,1,1,1,1,1,1,1,1,1,1],
            title:['机组代码','停机开始','停机结束','小计','简述','原因简述','停机类型','停机时间','专业属性','序号','备用时间'],
            width:150
        });
    });
    // 整体停机明细
    $svg.find('#tingjishijian_1_,#tingjicishu_1_').click(function () {

        mingxi({
            system:'DBPRODE7',
            sqlStr:`
SELECT
unit_code||'Q_Q'||
sd_start||'Q_Q'||
sd_end||'Q_Q'||
subtotal||'Q_Q'||
sd_description||'Q_Q'||
rs_description||'Q_Q'||
sd_type||'Q_Q'||
sd_time||'Q_Q'||
attribute||'Q_Q'||
id||'Q_Q'||
spare_time_1||'-*-' as 明细
FROM ttmsij4ps
WHERE SUBSTR(SD_DATE,1,6) = to_char(current date,'yyyymm')
AND UNIT_CODE = '${unit_code}'
AND SD_DESCRIPTION = '成品卷停机'`,
            order:[1,1,1,1,1,1,1,1,1,1,1],
            title:['机组代码','停机开始','停机结束','小计','简述','原因简述','停机类型','停机时间','专业属性','序号','备用时间'],
            width:150
        });
    })
        // 每日信息
    $svg.find('#meirixinxi_1_').click(function () {
        console.log('每日信息');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/每日信息.frm","para":{"__pi__":true},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });

}