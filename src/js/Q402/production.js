import {tiaoXinTu,tiaoXingDuiJi} from "../common/myechars";
import {getTd,getArr,textCenter} from "../common/common";
import {$svg} from "../common/init";
export default  function () {

    // 日、月、实时产量、完成率
    (function () {
        const monthData = getTd('report1','B4').text();
        const dayData = getTd('report1','A4').text();
        const nowData = getTd('report1','C4').text();
        const wanchenglv = getTd('report1','D4').text();
        $svg.find('#zuorichanliang .num').text(Number(dayData).toFixed(1));
        $svg.find('#dangyuechanliang .num').text(Number(monthData).toFixed(1));
        $svg.find('#shishichanliang .num').text(Number(nowData).toFixed(1));
        $svg.find('#dangyuewanchenglv .num').text(Number(wanchenglv).toFixed(2) +'%');
    })();
    // 取向、无取向
    (function () {
        const qx_day = getTd('report1','A6').text();
        const qx_mon = getTd('report1','A7').text();
        const wqx_day1 = getTd('report1','B6').text();
        const wqx_day2 = getTd('report1','B7').text();
        const wqx_mon1 = getTd('report1','C6').text();
        const wqx_mon2 = getTd('report1','C7').text();
        const day_total = getTd('report1','B8').text();
        const mon_total = getTd('report1','C8').text();
        const quxiang = {
            'id':'quxiang',
            data:[qx_day,qx_mon],
            width: 717.789,
            x: 424.472,
            length: 1,
        }
        const wuquxiang = {
            'id':'wuquxiang',
            data: [[wqx_day1,wqx_day2],[wqx_mon1,wqx_mon2]],
            total: [day_total,mon_total],
            width: 717.789,
            x: 424.472,
            length: 1,
        }
        tiaoXinTu(quxiang);
        tiaoXingDuiJi(wuquxiang);
    })();
    // 连续运行天数
    (function () {
        const FIBRE_MAX = getTd('report1','A12').text();
        const FIBRE_AVG = getTd('report1','B12').text();
        const FIBRE_MAX_PRE = getTd('report1','C12').text();
        const FIBRE_AVG_PRE = getTd('report1','D12').text();
        const FIBRE_MAX_H = getTd('report1','E12').text();
        const FIBRE_AVG_H = getTd('report1','F12').text();
        const FIBRE_NOW = getTd('report1','G12').text();
        $svg.find('#FIBRE_MAX').text(Number(FIBRE_MAX));
        $svg.find('#FIBRE_AVG').text(Number(FIBRE_AVG));
        $svg.find('#FIBRE_MAX_PRE').text(Number(FIBRE_MAX_PRE));
        $svg.find('#FIBRE_AVG_PRE').text(Number(FIBRE_AVG_PRE));
        $svg.find('#FIBRE_MAX_H').text(Number(FIBRE_MAX_H));
        $svg.find('#FIBRE_AVG_H').text(Number(FIBRE_AVG_H));
        $svg.find('#FIBRE_NOW').text(Number(FIBRE_NOW));
    })();
}