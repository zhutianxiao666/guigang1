import {tiaoXinTu,arc} from "../common/myechars";
import {getTd, getArr, textCenter, getUnitCode} from "../common/common";
import {$svg} from "../common/init";
export default  function () {
    // 日月产量
    (function () {
        const dayData = getTd('report1','A6').text();
        const monthData = getTd('report1','B6').text();
        const monthComplete = getTd('report1','C6').text();
        const wanban = getTd('report1','E6').text();
        $svg.find('#zuorichanliang .text').text(Number(dayData).toFixed(1));
        $svg.find('#zuorichanliang_1_ .text').text(Number(wanban).toFixed(1));
        $svg.find('#dangyuechanliang .text').text(Number(monthData).toFixed(1));
        $svg.find('#dangyuewanclv .text').text((monthComplete * 100).toFixed(2) + '%');

    })();

    // 小时产量
    (function () {
        const hourData = getTd('report1','A9').text();
        const $ele = $svg.find('#xiaoshichanliang .text');
        $ele.text(Number(hourData).toFixed(2));
        textCenter($ele);
    })();

    // 早晚班
    // 获取数据

    (function () {
        const banzu = getArr('report1','B3');
        const rishuju = getArr('report1','C3');
        const yueshuju = getArr('report1','D3');
        const zaoban = {
            'id':'zaoban',
            data: [rishuju[0] , yueshuju[0]],
            width: 373.971,
            x: 772.624,
            shift_group:banzu[0] || ''
        };
        const wanban = {
            'id':'wanban',
            data: [rishuju[1], yueshuju[1] || 0],
            width: 373.971,
            x: 772.624,
            shift_group:banzu[1] || ''
        };
        tiaoXinTu(zaoban);
        tiaoXinTu(wanban);
    })();

    // 速度符合率
    (function () {
        // 速度符合率
        arc({
            x:1551.67,
            y:186.31,
            r:144,
            num:getTd('report1','A12').text(),
            $ele: $svg.find('#sudufuhelv')
        });
        // 时间开动率
        arc({
            x:1929.659,
            y:191.358,
            r:144,
            num:getTd('report1','B12').text(),
            $ele: $svg.find('#shijiankaidonglv')
        });
    })();
    // 返回卷
    (function () {
        const fanhujuan = $svg.find('#fanhuijuan');
        fanhujuan.find('.time').text(parseInt(getTd('report1','A15').text()));
        fanhujuan.find('.total').text(Number(getTd('report1','B15').text()).toFixed(2));
    })();

    // 明细
    $svg.find('#chanliang').on('click',function () {
        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E4%25BA%25A7%25E9%2587%258F%25E8%25B6%258B%25E5%258A%25BF%252B%25E6%2598%258E%25E7%25BB%2586%25E5%2590%25AB%25E6%25B6%2582%25E5%25B1%2582TAB.frm","para":{"__pi__":true,"unit":"吨","unit_code":"${getUnitCode('Q518')}"},"target":"_dialog","feature":{"width":1800,"height":1000,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true)
    });
    $svg.find('#sudufuhelv,#shijiankaidonglv').click(function () {

        FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/弹出明细/速度趋势.frm","para":{"__pi__":true,"unit_code":"${getUnitCode('Q518')}"},"target":"_dialog","feature":{"width":1800,"height":1000,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true)
    })
};
