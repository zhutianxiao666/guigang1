import {$svg} from "../common/init";
import {getData,getUnitCode} from "../common/common";
import mingxi from "../common/mingxi";

export default function () {
    console.log('点击事件');
    // 生产
    $svg.find('#dangyuechanliang').click(function () {
        console.log('取向无取向');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E4%25BA%25A7%25E9%2587%258F%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"MD","ITEM_ENAME":"PROD_","SORT":"","unit":"吨"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    //取向
    $svg.find('#quxiang').click(function () {
        console.log('取向');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%25E7%25A1%2585%25E9%2592%25A2%252F%25E5%258F%2596%25E5%2590%2591%25E4%25BA%25A7%25E9%2587%258F%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"MD","ITEM_ENAME":"PROD_","SORT":"Q1","unit":"吨"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    //无取向
    $svg.find('#wuquxiang').click(function () {
        console.log('无取向');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2597%25A0%25E5%258F%2596%25E5%2590%2591%25E4%25BA%25A7%25E9%2587%258F%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"MD","ITEM_ENAME":"PROD_","SORT":"S1","unit":"吨"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 断带
    $svg.find('#lianxuyunxing .dangniandu').click(function () {
        console.log('当年度');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/断带明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"当年度"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    $svg.find('#lianxuyunxing .shangyiniandu').click(function () {
        console.log('上一年度');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/断带明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"上一年度"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    $svg.find('#lianxuyunxing .lishi').click(function () {
        console.log('历史');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/断带明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"历史"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    $svg.find('#lianxuyunxing .dangqian').click(function () {
        console.log('当前');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/断带明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"当前月"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    //断带分析模型
    $svg.find('#duandaifenxi').click(function () {
        console.log('断带分析模型');
        IPlatInterop.Call4CForm('QCQT4000');
    });
    //轧辊周期预测模型
    $svg.find('#zhagunzhouqiyuce').click(function () {
        console.log('轧辊周期预测模型');
        IPlatInterop.Call4CForm('PMRLJ421A1');
    });
    //原料评价模型
    $svg.find('#yuanliaopingjia').click(function () {
        console.log('原料评价模型');
        IPlatInterop.Call4CForm('PMHCJ401A1');
    });
    //轧制工艺分析模型
    $svg.find('#gongyifenxi').click(function () {
        console.log('轧制工艺分析模型');
        IPlatInterop.Call4CForm('QMZJJ4CW');
    });

    // 库存
    $svg.find('#kuqu .hover').click(function () {

        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/库存明细.cpt","para":{"__pi__":true,"STOCK_NO":"${$(this).attr('data-stock-no')}","NEXT_UNIT_NO":"Q002","ST_NO_ROLL_TYPE":"${$(this).attr('data-st-no')}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });

    // 成材率
    $svg.find('#wanbanchengcailv,#zaobanchengcailv,#zongtichengcailv').click(function () {
        console.log('成材率');
        console.log(getUnitCode());
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2588%2590%25E6%259D%2590%25E7%258E%2587%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"MD","ITEM_ENAME":"OUTPUT_RATE_","SORT":"","unit":"%"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    //能耗
    $svg.find('#nenghao').click(function () {
        console.log('能耗明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/弹出明细/能耗趋势.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });

    // 停机明细
    $svg.find('#guzhangshijian_2_').click(function () {
        console.log('停机明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/停机明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 改判
    $svg.find('#quexiangaipanlv').click(function () {
        console.log('缺陷改判明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/弹出明细/缺陷改判率.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    //C级品率
    $svg.find('#cjipinlv').click(function () {
        console.log('C级品率');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/弹出明细/C级品率.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 现货
    $svg.find('#xianhuowanchenglv').click(function () {
        console.log('现货明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/弹出明细/现货明细.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 每日信息
    $svg.find('#meirixinxi').click(function () {
        console.log('每日信息');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/每日信息.frm","para":{"__pi__":true},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // CP
    $svg.find('#CPfuhelv').click(function () {
        console.log('CP');
        IPlatInterop.Call4CForm('ZHPJ0003');
    });
    // 来料热卷
    $svg.find('#lailiaorejuan').click(function () {
        console.log('来料热卷');
        IPlatInterop.Call4CForm('PMHCJ401A1');
    });
    // 来料异常
    $svg.find('#lailiaoyichang .mingxi').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`select (CASE WHEN UNIT_CODE = 'Q216' THEN (plan_no||'(联动)') ELSE plan_no END)||'Q_Q'||in_mat_no||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 来料异常  from IMSIJ4.TIMSIJ4GC
            where UNIT_CODE='${getUnitCode('Q502')}'  or (UNIT_CODE='Q216' and SPARE_ITEM_1='${getUnitCode('Q502')}')
            order by UNIT_CODE,MAT_SEQ_NO`,
            order:[1,1,1,2,2],
            title:['作业计划号','入口材料号','封锁代码','封闭缺陷','其他缺陷'],
            width:100
        });
    });
    // 生产异常
    $svg.find('#shengchanyichang .mingxi').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`select SPARE_ITEM_1||'Q_Q'||out_mat_no||'Q_Q'||SPARE_ITEM_3||'Q_Q'||SPARE_TIME_1||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 来料异常  from IMSIJ4.TIMSIJ4GC
            where PRE_UNIT_CODE='${getUnitCode('Q502')}'`,
            order:[1,1,1,1,1,2,2],
            title:['产出机组','出口材料号','轧制出口材料号','轧制产出时间','封锁代码','封闭缺陷','其他缺陷'],
            width:100
        });
    });
    // 检化验
    $svg.find('#jianhuayan .mingxi').click(function () {
        mingxi({
            system:'硅钢L3',
            sqlStr:`SELECT REC_STATUS||'Q_Q'|| UNIT_NO||'Q_Q'|| TEST_TIME||'Q_Q'|| SHIFT_NO||'Q_Q'|| GRP_NO||'Q_Q'|| LOT_NO||'Q_Q'|| EMUL_PH_1||'Q_Q'|| EMUL_CON_1||'Q_Q'|| EMUL_SAP_1||'Q_Q'|| EMUL_FFA_1||'Q_Q'|| EMUL_TFE_1||'Q_Q'|| EMUL_CL_1||'Q_Q'|| EMUL_OIL_1||'Q_Q'|| EMUL_ASH_1||'Q_Q'|| EMUL_ESI_1||'Q_Q'|| EMUL_CLEAN_1||'Q_Q'|| EMUL_CLEANFE_1||'Q_Q'|| EM_CLEANOIL_1||'-*-' as 检化验
            FROM TCMRS32
            WHERE UNIT_NO = '${getUnitCode()}'
             AND TEST_TIME > to_char(current date - 2 months,'yyyymmdd')
             order by test_time desc`,
            title:['记录状态','机组号','试验时间','班次号','班别号','批次号','1#乳化槽-PH值','1#乳化槽-电导率','1#乳化槽-皂化值','1#乳化槽-游离脂肪酸','1#乳化槽-总铁','1#乳化槽-氯离子','1#乳化槽-油浓度','1#乳化槽-灰份','1#乳化槽-ESI','1#乳化槽-清洗剂浓度','1#乳化槽-清洗剂中铁分含量','1#乳化槽-清洗剂油浓度'],
            width:150
        });
    });
    // 轧辊
    // 一中间
    $svg.find('#yizhongjian').click(function () {
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E5%25BC%25B9%25E5%2587%25BA%25E6%2598%258E%25E7%25BB%2586%252F%25E8%25BD%25A7%25E8%25BE%258A%25E8%25B6%258B%25E5%258A%25BF.frm","para":{"__pi__":true,"unit_code":"${getUnitCode('Q402')}","item_value_content":"一中间"},"target":"_dialog","feature":{"width":1500,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true)
    });

    // 二中间
    $svg.find('#erzhongjian').click(function () {
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E5%25BC%25B9%25E5%2587%25BA%25E6%2598%258E%25E7%25BB%2586%252F%25E8%25BD%25A7%25E8%25BE%258A%25E8%25B6%258B%25E5%258A%25BF.frm","para":{"__pi__":true,"unit_code":"${getUnitCode('Q402')}","item_value_content":"二中间"},"target":"_dialog","feature":{"width":1500,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true)
    });

    // 支撑辊
    $svg.find('#zhichenggun').click(function () {
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E5%25BC%25B9%25E5%2587%25BA%25E6%2598%258E%25E7%25BB%2586%252F%25E8%25BD%25A7%25E8%25BE%258A%25E8%25B6%258B%25E5%258A%25BF.frm","para":{"__pi__":true,"unit_code":"${getUnitCode('Q402')}","item_value_content":"支撑辊"},"target":"_dialog","feature":{"width":1500,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true)
    });
    // 生产异常
    $svg.find('#shengchanyichang .mingxi').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`select SPARE_ITEM_1||'Q_Q'||out_mat_no||'Q_Q'||SPARE_ITEM_3||'Q_Q'||to_char(to_date(SPARE_TIME_1,'yyyyMMddhh24miss'),'yyyy-mm-dd hh:mm:ss')||'Q_Q'||(case when 
SPARE_TIME_2 = ''  then SPARE_TIME_2
else to_char(to_date(SPARE_TIME_1,'yyyyMMddhh24miss'),'yyyy-mm-dd hh:mm:ss')
end
)||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 来料异常  
  from IMSIJ4.TIMSIJ4GC
            where PRE_UNIT_CODE='${getUnitCode('Q502')}'`,
            order:[1,1,1,1,1,1,2,2],
            title:['产出机组','出口材料号','轧制出口材料号','轧制产出时间','封闭机组产出时间','封锁代码','封闭缺陷','其他缺陷'],
            width:100
        });
    });
};