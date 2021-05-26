import {$svg} from "../common/init";
import {getTd,getUnitCode} from "../common/common";
import mingxi from "../common/mingxi";
import zhexiantu from "../common/myechars/zhexiantu"

export default function () {
    console.log('点击事件');
    // 生产
    $svg.find('#wanban,#zaoban').click(function () {
        console.log('早晚班产量');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E4%25BA%25A7%25E9%2587%258F%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"MD","ITEM_ENAME":"PROD_","SORT":"","unit":"吨"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 库存
    $svg.find('#kuqu .kuqus').click(function () {
        console.log('库区点击');
        const unit_code = getUnitCode();
        let tablea = (unit_code == 'Q173'?'TPSQ171':(unit_code == 'Q174'?'TPSQ174':(unit_code == 'Q175'?'TPSQ175':'Q173')));
        let tableb = (unit_code == 'Q173'?'TPSM173':(unit_code == 'Q174'?'TPSM174':(unit_code == 'Q175'?'TPSM175':'Q173')));
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){var widgetName = 'report1';var widget = _g().name_widgets[widgetName.toUpperCase()];widget && widget.formHyperlink && widget.formHyperlink({para:{"REF_T":"design","HEADERADDED":"true","COUNTER.FILTERED":"true","REF_C":"09a7fa1a-128a-4043-bdce-012bc9d3d229","FORMLETNAME":"硅钢/171取向精整机组可视化画面svg.frm","WIDGETVERSION":"1","TABLEA":"${tablea}","CMD":"load_content","TABLEB":"${tableb}","_":"1614135189997","STOCK_NO":"${$(this).attr('STOCK_NO')}"}, widgetName:widgetName, animateType:'none'});FR.recalculateElementTitle({"REF_T":"design","HEADERADDED":"true","COUNTER.FILTERED":"true","REF_C":"09a7fa1a-128a-4043-bdce-012bc9d3d229","FORMLETNAME":"硅钢/171取向精整机组可视化画面svg.frm","WIDGETVERSION":"1","TABLEA":"${tablea}","CMD":"load_content","TABLEB":"${tableb}","_":"1614135189997","STOCK_NO":"${$(this).attr('STOCK_NO')}"}, 'TITLE_REPORT1', 'T');}, this, as)`,"name":"当前决策报表对象1"}], true);
        setTimeout(() => {
            zhexiantu({
                $ele:'#kuquludianqush',
                data:getTd('report1','B69').text(),
                order:['dew_point','DIFF'],
                x:2208.092,
                y:783.599,
                width:1528.481,
                height:219.939,
                colors: ['rgb(0, 204, 255)','rgb(255, 166, 0)']
            });
        }, 1000);
    });

    // 成材率
    $svg.find('#wanbanchengcailv,#zaobanchengcailv').click(function () {
        console.log('成材率');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%25E7%25A1%2585%25E9%2592%25A2%252F%25E6%2588%2590%25E6%259D%2590%25E7%258E%2587%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586TAB.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"MD","ITEM_ENAME":"OUTPUT_RATE_","SORT":"","unit":"%"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });

    // 停机明细
    $svg.find('#guzhangtingji .tingji_click').click(function () {
        console.log('停机明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/停机明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 改判
    $svg.find('#quexiangaipanlv').click(function () {
        console.log('缺陷改判明细');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/缺陷改判明细.cpt","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 小尾卷
    $svg.find('#zaobanxiaoweijuan,#wanbanxiaoweijuan').click(function () {
        console.log('小尾卷趋势');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/趋势.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"MD","ITEM_ENAME":"SMALL_COIL_RATE_","SORT":"","unit":"%"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 每日信息
    $svg.find('#meirixinxi').click(function () {
        console.log('每日信息');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/每日信息.frm","para":{"__pi__":true},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 返修发生量 厚度
    $svg.find('#fanxiufashengliang .houdu').click(function () {
        console.log('返修发生量 厚度');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/返修量明细.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"spare_item_n2","ITEM_ENAME":"REPAIR_U_WT_GROUP_D"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 返修发生量 出钢记号
    $svg.find('#fanxiufashengliang .chugangjihao').click(function () {
        console.log('返修发生量 出钢记号');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/返修量明细.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"spare_item_1","ITEM_ENAME":"REPAIR_U_WT_GROUP_D"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 本机返修 厚度
    $svg.find('#benjifanxiuliang .houdu').click(function () {
        console.log('本机返修 厚度');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/返修量明细.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"spare_item_n2","ITEM_ENAME":"REPAIR_BU_WT_GROUP_D"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 本机返修 出钢记号
    $svg.find('#benjifanxiuliang .chugangjihao').click(function () {
        console.log('本机返修 出钢记号');
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/返修量明细.frm","para":{"__pi__":true,"UNIT_CODE":"${getUnitCode()}","type":"spare_item_1","ITEM_ENAME":"REPAIR_BU_WT_GROUP_D"},"target":"_dialog","feature":{"width":1300,"height":800,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
    });
    // 来料异常
    $svg.find('#lailiaoyichang .mingxi').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`select plan_no||'Q_Q'||out_mat_no||'Q_Q'||hold_code||'Q_Q'||hold_defect||'Q_Q'||other_defect||'-*-' as 来料异常  from IMSIJ4.TIMSIJ4GC
            where UNIT_CODE='${getUnitCode()}'`,
            order:[1,1,1,2,2],
            title:['作业计划号','出口材料号','封锁代码','封闭缺陷','其他缺陷'],
            width:100
        });
    });
    // 特殊需求
    $svg.find('#yonghuteshuxuqiu .mingxi').click(function () {
        const unit_code = getUnitCode();
        let tablea = (unit_code == 'Q173'?'TPSQ171':(unit_code == 'Q174'?'TPSQ174':(unit_code == 'Q175'?'TPSQ175':'Q173')));
        let tableb = (unit_code == 'Q173'?'TPSM173':(unit_code == 'Q174'?'TPSM174':(unit_code == 'Q175'?'TPSM175':'Q173')));
        mingxi({
            system:'硅钢L3',
            sqlStr:`SELECT A.PLAN_NO||'Q_Q'||
            B.UNIT_SEQ_NO||'Q_Q'||
            A.IN_MAT_NO||'Q_Q'||
            A.SPECIAL_INST_DESC||'Q_Q'||
            A.TEST_ADD_DESC||'Q_Q'||
            A.ORDER_SPECIAL||'-*-' 特殊需求
       FROM ${tablea} A,${tableb} B
      WHERE     A.UNIT_NO = '${getUnitCode()}'
            AND A.TRACK_STATUS >= '8'
            AND A.IN_MAT_NO = B.IN_MAT_NO
            AND (A.SPECIAL_INST_DESC <> ' ' OR A.TEST_ADD_DESC <> ' ' OR A.ORDER_SPECIAL <> ' ')
     ORDER BY UNIT_SEQ_NO`,
            order:[1,1,1,1,1,1],
            title:['作业计划号', '生产命令顺序号', '入口材料号', '特殊需求描述', '实验补充说明', '合同特殊要求'],
            width:100
        });
    });
    // 技术通知单
    $svg.find('#jishutongzhidan .mingxi').click(function () {
        mingxi({
            system:'硅钢L3',
            sqlStr:`select unit_no,PLAN_NO||'Q_Q'||tech_note_no||'-*-' 技术通知单 from((
                SELECT A.UNIT_NO,A.PLAN_NO,A.tech_note_no
                FROM TPSQ171 A,TPSM173 B  
                WHERE A.UNIT_NO= 'Q173' AND A.TRACK_STATUS >= '8' AND A.IN_MAT_NO = B.IN_MAT_NO ORDER BY UNIT_SEQ_NO)
                union
                
                (SELECT A.UNIT_NO,A.PLAN_NO,A.tech_note_no 
                FROM TPSQ174 A,TPSM174 B  
                WHERE A.UNIT_NO= 'Q174' AND A.TRACK_STATUS >= '8' AND A.IN_MAT_NO = B.IN_MAT_NO ORDER BY UNIT_SEQ_NO) 
                
                union
                (SELECT A.UNIT_NO,A.PLAN_NO,A.tech_note_no 				
                FROM TPSQ175 A,TPSM175 B  
                WHERE A.UNIT_NO= 'Q175' AND A.TRACK_STATUS >= '8' AND A.IN_MAT_NO = B.IN_MAT_NO ORDER BY UNIT_SEQ_NO))
                where tech_note_no <> ' '				`,
            order:[1,1],
            title:['作业计划号','计划通知单号'],
            width:100
        });
    });
    // 质量异议
    $svg.find('#zhiliangyiyi .mingxi').click(function () {
        mingxi({
            system:'硅钢L3',
            sqlStr:`select user_desc||'Q_Q'||cust_disc||'-*-' 异议  from TQMDISC`,
            order:[1,5],
            title:['用户描述','用户异议抱怨'],
            width:100
        });
    });
};