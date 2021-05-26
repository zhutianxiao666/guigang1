import {$svg} from "../common/init";
import {getData,getUnitCode} from "../common/common";
import mingxi from "../common/mingxi";

export default function () {
    const unit_code = getUnitCode('Q518');
    // 生产
    $svg.find('#zaoban,#wanban').click(function () {
        FR.doHyperlink(event||window.event, [{"data":"var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({\"url\":\"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E4%25BA%25A7%25E9%2587%258F%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm\",\"para\":{\"__pi__\":true,\"COUNTER.FILTERED\":\"true\",\"REF_C\":\"e7c8cfdb-5183-4e58-b37e-1f899de1705f\",\"FORMLETNAME\":\"Form1.frm\",\"WIDGETVERSION\":\"1\",\"REF_T\":\"design\",\"CMD\":\"load_content\",\"HEADERADDED\":\"true\",\"_\":\"1612842446122\",\"type\":\"MD\",\"ITEM_ENAME\":\"PROD_\",\"SORT\":\"\",\"unit\":\"吨\"},\"target\":\"_dialog\",\"feature\":{\"width\":1300,\"height\":800,\"isCenter\":true,\"title\":\"\"},\"title\":\"网络报表1\"})}, this, as)","name":"网络报表1"}], true);
    });
    // 质量
    // 缺陷改判率
    $svg.find('#quexiangaipanlv_1_,#quexiangaipanlvzaoban,#quexiangaipanlvwanban').click(function () {
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/弹出明细/缺陷改判率.frm","para":{"__pi__":true,"unit_code":"${unit_code}"},"target":"_dialog","feature":{"width":1600,"height":1000,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true)
    });
    // cp符合率
    $svg.find('#xianhuowanchenglv_1_,#cpgaipanlvzaoban,#cpgaipanlvwanban').click(function () {
        IPlatInterop.Call4CForm('ZHPJ0003');
    });
    // 成材率
    $svg.find('#zaobanchengcailv_5_').click(function () {
        const shift_group = getData('report1','A16').toUpperCase();
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2588%2590%25E6%259D%2590%25E7%258E%2587%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"COUNTER.FILTERED":"true","REF_C":"d146747a-f587-4c28-9522-85be3dfb3587","FORMLETNAME":"Form1.frm","WIDGETVERSION":"1","REF_T":"design","CMD":"load_content","HEADERADDED":"true","_":"1612858559410","type":"MD","ITEM_ENAME":"PROD_","SORT":"","unit":"吨","item_ename_day":"OUTPUT_RATE_GROUP_D","item_ename_month":"OUTPUT_RATE_GROUP_M","table_name":"TIMSIJ4GT","unit_code":"Q314","shift_group":"${shift_group}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    $svg.find('#wanbanchengcailv_1_').click(function () {
        const shift_group = getData('report1','A19').toUpperCase();
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2588%2590%25E6%259D%2590%25E7%258E%2587%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"COUNTER.FILTERED":"true","REF_C":"d146747a-f587-4c28-9522-85be3dfb3587","FORMLETNAME":"Form1.frm","WIDGETVERSION":"1","REF_T":"design","CMD":"load_content","HEADERADDED":"true","_":"1612858559410","type":"MD","ITEM_ENAME":"PROD_","SORT":"","unit":"吨","item_ename_day":"OUTPUT_RATE_GROUP_D","item_ename_month":"OUTPUT_RATE_GROUP_M","table_name":"TIMSIJ4GT","unit_code":"Q314","shift_group":"${shift_group}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 停机
    $svg.find('#tingjicishu_1_,#tingjishijian_1_').click(function () {

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
AND UNIT_CODE = 'Q314'
AND SD_DESCRIPTION = '成品卷停机'`,
            order:[1,1,1,1,1,1,1,1,1,1,1],
            title:['机组代码','停机开始','停机结束','小计','简述','原因简述','停机类型','停机时间','专业属性','序号','备用时间'],
            width:150
        });

        // FR.doHyperlink(event||window.event, [{"data":"var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({\"url\":\"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E5%2581%259C%25E6%259C%25BA%25E6%2598%258E%25E7%25BB%2586.cpt\",\"para\":{\"__pi__\":true,\"UNIT_CODE\":\"Q314\",\"REF_T\":\"design\",\"HEADERADDED\":\"true\",\"COUNTER.FILTERED\":\"true\",\"REF_C\":\"d146747a-f587-4c28-9522-85be3dfb3587\",\"FORMLETNAME\":\"硅钢/314热拉伸平整机组可视化画面.frm\",\"WIDGETVERSION\":\"1\",\"TABLEA\":\"TMMQ314\",\"CMD\":\"load_content\",\"_\":\"1612855982976\"},\"target\":\"_dialog\",\"feature\":{\"width\":1100,\"height\":800,\"isCenter\":true,\"title\":\"\"},\"title\":\"网络报表1\"})}, this, as)","name":"网络报表1"}], true);
    });
    // $svg.find('#tingjishijian_1_').click(function () {
    //     FR.doHyperlink(event||window.event, [{"data":"var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({\"url\":\"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E5%2581%259C%25E6%259C%25BA%25E6%2598%258E%25E7%25BB%2586.cpt\",\"para\":{\"__pi__\":true,\"UNIT_CODE\":\"Q314\",\"REF_T\":\"design\",\"HEADERADDED\":\"true\",\"COUNTER.FILTERED\":\"true\",\"REF_C\":\"d146747a-f587-4c28-9522-85be3dfb3587\",\"FORMLETNAME\":\"硅钢/314热拉伸平整机组可视化画面.frm\",\"WIDGETVERSION\":\"1\",\"TABLEA\":\"TMMQ314\",\"CMD\":\"load_content\",\"_\":\"1612855982976\"},\"target\":\"_dialog\",\"feature\":{\"width\":1100,\"height\":800,\"isCenter\":true,\"title\":\"\"},\"title\":\"网络报表1\"})}, this, as)","name":"网络报表1"}], true)
    // });

    // 表单明细
    $svg.find('#yichangtixing .mingxi').click(function () {
        if ($(this).attr('data-index') == 'left') {
            mingxi({
                system:'DBPRODE7',
                sqlStr:`select  plan_no||'Q_Q'||out_mat_no||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 生产质量  from IMSIJ4.TIMSIJ4GC where PRE_UNIT_CODE='${getUnitCode('Q314')}' and unit_code = ' '`,
                order:[1,1,1,2,2],
                title:["作业计划号","出口材料号","封锁代码","封闭缺陷","其他缺陷"],
                width:100});
        }else if ($(this).attr('data-index') == 'right') {
            mingxi({
                system:'DBPRODE7',
                sqlStr:`select  plan_no||'Q_Q'||in_mat_no||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 生产质量  from IMSIJ4.TIMSIJ4GC where UNIT_CODE='${getUnitCode('Q314')}'`,
                order:[1,1,1,2,2],
                title:["作业计划号","入口材料号","封锁代码","封闭缺陷","其他缺陷"],
                width:100});
        }

    });
    $svg.find('#chanpinjianhuatixing .mingxi').on('click',function () {
        if ($(this).attr('data-index') == 'right') {
            mingxi({
                system:'硅钢L3',
                sqlStr:`select 
MAT_NO||'Q_Q'||SMP_POS||'Q_Q'||TEST_TIMES||'Q_Q'||COAT_THICK_TD||'Q_Q'||COAT_THICK_TC||'Q_Q'||COAT_THICK_TW||'Q_Q'||COAT_THICK_TA||'Q_Q'||COAT_THICK_BD||'Q_Q'||COAT_THICK_BC||'Q_Q'||COAT_THICK_BW||'Q_Q'||COAT_THICK_BA||'-*-'  检化验指标
from
((SELECT A.MAT_NO,A.SMP_POS,A.TEST_TIMES,A.COAT_THICK_TD,A.COAT_THICK_TC,A.COAT_THICK_TW,A.COAT_THICK_TA,A.COAT_THICK_BD,A.COAT_THICK_BC,A.COAT_THICK_BW,A.COAT_THICK_BA FROM TCMRS11 A,TMMQ314 B,TMMQ171 C 
    WHERE A.MAT_NO = C.OUT_MAT_NO
      AND C.MAT_TRACK_NO = B.MAT_TRACK_NO
      AND B.PROD_END_TIME >= to_char(current date - 30 days,'yyyymmdd')||'00000'
      AND B.PROD_END_TIME <= to_char(current date,'yyyymmdd')||'00000')
   UNION 
   (SELECT A.MAT_NO,A.SMP_POS,A.TEST_TIMES,A.COAT_THICK_TD,A.COAT_THICK_TC,A.COAT_THICK_TW,A.COAT_THICK_TA,A.COAT_THICK_BD,A.COAT_THICK_BC,A.COAT_THICK_BW,A.COAT_THICK_BA FROM TCMRS11 A,TMMQ314 B,TMMQ172 C 
    WHERE A.MAT_NO = C.OUT_MAT_NO
      AND C.MAT_TRACK_NO = B.MAT_TRACK_NO
      AND B.PROD_END_TIME >= to_char(current date - 30 days,'yyyymmdd')||'00000'
      AND B.PROD_END_TIME <= to_char(current date,'yyyymmdd')||'00000')
   UNION 
   (SELECT A.MAT_NO,A.SMP_POS,A.TEST_TIMES,A.COAT_THICK_TD,A.COAT_THICK_TC,A.COAT_THICK_TW,A.COAT_THICK_TA,A.COAT_THICK_BD,A.COAT_THICK_BC,A.COAT_THICK_BW,A.COAT_THICK_BA FROM TCMRS11 A,TMMQ314 B,TMMQ173 C 
    WHERE A.MAT_NO = C.OUT_MAT_NO
      AND C.MAT_TRACK_NO = B.MAT_TRACK_NO
      AND B.PROD_END_TIME >= to_char(current date - 30 days,'yyyymmdd')||'00000'
      AND B.PROD_END_TIME <= to_char(current date,'yyyymmdd')||'00000')
   UNION 
   (SELECT A.MAT_NO,A.SMP_POS,A.TEST_TIMES,A.COAT_THICK_TD,A.COAT_THICK_TC,A.COAT_THICK_TW,A.COAT_THICK_TA,A.COAT_THICK_BD,A.COAT_THICK_BC,A.COAT_THICK_BW,A.COAT_THICK_BA FROM TCMRS11 A,TMMQ314 B,TMMQ174 C 
    WHERE A.MAT_NO = C.OUT_MAT_NO
      AND C.MAT_TRACK_NO = B.MAT_TRACK_NO
      AND B.PROD_END_TIME >= to_char(current date - 30 days,'yyyymmdd')||'00000'
      AND B.PROD_END_TIME <= to_char(current date,'yyyymmdd')||'00000')
   UNION 
   (SELECT A.MAT_NO,A.SMP_POS,A.TEST_TIMES,A.COAT_THICK_TD,A.COAT_THICK_TC,A.COAT_THICK_TW,A.COAT_THICK_TA,A.COAT_THICK_BD,A.COAT_THICK_BC,A.COAT_THICK_BW,A.COAT_THICK_BA FROM TCMRS11 A,TMMQ314 B,TMMQ175 C 
    WHERE A.MAT_NO = C.OUT_MAT_NO
AND C.MAT_TRACK_NO = B.MAT_TRACK_NO
AND B.PROD_END_TIME >= to_char(current date - 30 days,'yyyymmdd')||'00000'
AND B.PROD_END_TIME <= to_char(current date,'yyyymmdd')||'00000'))
where SMP_POS >0 or  COAT_THICK_TD >0 or COAT_THICK_TC >0 or COAT_THICK_TW >0 or COAT_THICK_TA >0 or COAT_THICK_BD >0 or COAT_THICK_BC >0 or COAT_THICK_BW >0 or COAT_THICK_BA > 0
      `,
                title: ['材料号','取样位置(实绩)','试验次数','涂层厚度(TD)','涂层厚度(TC)','涂层厚度(TW)','涂层厚度(TA)','涂层厚度(BD)','涂层厚度(BC)','涂层厚度(BW)','涂层厚度(BA)'],
                width: 150
            });
        } else if ($(this).attr('data-index') == 'left') {
            mingxi({
                system: '硅钢L3',
                sqlStr: `select UNIT_NO||'Q_Q'||TEST_TIME||'Q_Q'||SHIFT_NO||'Q_Q'||LOT_NO||'Q_Q'||ACS_H2SO4||'Q_Q'||ACS_FE||'Q_Q'||SCRUB_MG0||'Q_Q'||SCRUB_PH||'Q_Q'||SCRUB_C1||'Q_Q'||RINSE_CONDUCT_1||'Q_Q'||RINSE_CONDUCT_2||'Q_Q'||RINSE_CONDUCT_3||'Q_Q'||RINSE_PH_1||'Q_Q'||RINSE_PH_2||'Q_Q'||RINSE_PH_3||'-*-'  检化验指标
from BGSIM1.TCMRS34
where unit_no = 'Q314'
order by TEST_TIME desc`,
                title: ['机组号','试验时间','班次号','批次号','酸洗液－硫酸','酸洗液（铁离子）','刷洗液残留MGO','刷洗液PH','刷洗液残留C1','1号漂洗槽电导率','2号漂洗槽电导率','3号漂洗槽电导率','1号漂洗槽PH值','2号漂洗槽PH值','3号漂洗槽PH值'],
                width: 150
            });
        }
    });
    $svg.find('#meirixinxi_1_').click(function () {
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/每日信息.frm","para":{"__pi__":true},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    $svg.find('#chaoqiyichangtixing .mingxi').click(function () {
        mingxi({
            system: '硅钢L3',
            sqlStr: `SELECT STOCK_NO||'Q_Q'||MAT_NO||'Q_Q'||MAT_ACT_THICK||'Q_Q'||ST_NO||'Q_Q'||NEXT_UNIT_NO||'Q_Q'||PROD_END_TIME||'Q_Q'||DIFF||'-*-'
  FROM 
((SELECT STOCK_NO,MAT_NO,MAT_ACT_THICK,ST_NO,NEXT_UNIT_NO,PROD_END_TIME,(DAYS(current timestamp)-DAYS(to_date(SUBSTR(PROD_END_TIME,1,8),'yyyy-mm-dd'))) AS DIFF
  FROM TMMCR01 
 WHERE STOCK_NO IN ('Q15','Q18')
   AND DAYS(current timestamp)-DAYS(to_date(SUBSTR(PROD_END_TIME,1,8),'yyyy-mm-dd')) >=7
   AND LENGTH(PROD_END_TIME) = 14)
 UNION
(SELECT STOCK_NO,MAT_NO,MAT_ACT_THICK,ST_NO,NEXT_UNIT_NO,PROD_END_TIME,(DAYS(current timestamp)-DAYS(to_date(SUBSTR(PROD_END_TIME,1,8),'yyyy-mm-dd'))) AS DIFF
  FROM TMMFR01 
 WHERE STOCK_NO IN ('Q15','Q18')
   AND DAYS(current timestamp)-DAYS(to_date(SUBSTR(PROD_END_TIME,1,8),'yyyy-mm-dd')) >=7
   AND LENGTH(PROD_END_TIME) = 14))
 ORDER BY STOCK_NO,DIFF`,
            title: ['库区','卷号','厚度','出钢记号','下道机组','产出时间','超期时间'],
            width: 100
        });
    });
    // 能耗
    $svg.find('#nenghao').click(function () {
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/弹出明细/能耗趋势.frm","para":{"__pi__":true,"unit_code":"${unit_code}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });

};