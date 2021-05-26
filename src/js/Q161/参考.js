import {$svg} from "../common/init";
import {getData,getUnitCode} from "../common/common";
import mingxi from "../common/mingxi";

export default function () {
    console.log('点击事件');
    // 生产
    $svg.find('#quxiang,#wuquxiang').click(function () {
        console.log('取向无取向');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E4%25BA%25A7%25E9%2587%258F%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"MD","ITEM_ENAME":"PROD_","SORT":"","unit":"吨"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
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
    // 库存
    $svg.find('#kuqu .kuqu_click').click(function () {
        console.log('库存明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/库存明细.cpt","para":{"__pi__":true,"STOCK_NO":"${$(this).attr('STOCK_NO')}","NEXT_UNIT_NO":"Q002","ST_NO_ROLL_TYPE":"${$(this).attr('ST_NO_ROLL_TYPE')}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 成材率
    $svg.find('#wanbanchengcailv,#zaobanchengcailv,#zongtichengcailv').click(function () {
        console.log('成材率');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2588%2590%25E6%259D%2590%25E7%258E%2587%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"MD","ITEM_ENAME":"OUTPUT_RATE_","SORT":"","unit":"%"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 停机明细
    $svg.find('#guzhangshijian_2_').click(function () {
        console.log('停机明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/停机明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 改判
    $svg.find('#quexiangaipanlv').click(function () {
        console.log('缺陷改判明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/缺陷改判明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 现货
    $svg.find('#xianhuowanchenglv').click(function () {
        console.log('现货明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/现货明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
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
            sqlStr:`select plan_no||'Q_Q'||in_mat_no||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 来料异常  from IMSIJ4.TIMSIJ4GC
            where UNIT_CODE='${getUnitCode()}'`,
            order:[1,1,1,2,2],
            title:['作业计划号','入口材料号','封锁代码','封闭缺陷','其他缺陷'],
            width:100
        });
    });
    // 生产异常
    $svg.find('#shengchanyichang .mingxi').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`select plan_no||'Q_Q'||out_mat_no||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 来料异常  from IMSIJ4.TIMSIJ4GC
            where PRE_UNIT_CODE='${getUnitCode()}'`,
            order:[1,1,1,2,2],
            title:['作业计划号','出口材料号','封锁代码','封闭缺陷','其他缺陷'],
            width:100
        });
    });
    // 检化验
    $svg.find('#jianhuayan .mingxi').click(function () {
        mingxi({
            system:'硅钢L3',
            sqlStr:`SELECT REC_STATUS||'Q_Q'|| UNIT_NO||'Q_Q'|| TEST_TIME||'Q_Q'|| SHIFT_NO||'Q_Q'|| GRP_NO||'Q_Q'|| LOT_NO||'Q_Q'|| EMUL_PH_1_C||'Q_Q'|| EMUL_CONDUCT_1_C||'Q_Q'|| EMUL_SOAP_1_C||'Q_Q'|| EMUL_FFA_1_C||'Q_Q'|| EMUL_TFE_1_C||'Q_Q'|| EMUL_CL_1_C||'Q_Q'|| EMUL_OIL_1_C||'Q_Q'|| EMUL_ASH_1_C||'Q_Q'|| EMUL_ESI_1_C||'Q_Q'|| EMUL_CLEAN_1_C||'Q_Q'|| EMUL_CLEANFE_1_C||'Q_Q'|| EM_CLEANOIL_1_C||'-*-' as 检化验
            FROM TCMIS32
            WHERE UNIT_NO = '${getUnitCode()}'
             AND TEST_TIME <= to_char(current date - 1 days,'yyyymmdd')`,
            title:['记录状态','机组号','试验时间','班次号','班别号','批次号','1#乳化槽-PH值','1#乳化槽-电导率','1#乳化槽-皂化值','1#乳化槽-游离脂肪酸','1#乳化槽-总铁','1#乳化槽-氯离子','1#乳化槽-油浓度','1#乳化槽-灰份','1#乳化槽-ESI','1#乳化槽-清洗剂浓度','1#乳化槽-清洗剂中铁分含量','1#乳化槽-清洗剂油浓度'],
            width:150
        });
    });
};