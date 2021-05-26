import {tiaoXinTu,tiaoXingDuiJi} from "../common/myechars";
import {getTd,getArr,textCenter} from "../common/common";
export default  function () {
    // 能耗
    (function () {
        // 早班
        const ruhuayezaoban = {
            id:'ruhuayezaoban',
            data: [getTd('report1','B54').text(),getTd('report1','C54').text()],
            width: 276.096,
            x: 1868.238,
            danwei:'%'
        }
        // 晚班
        const ruhuayewanban = {
            id:'ruhuayewanban',
            data: [getTd('report1','B55').text(),getTd('report1','C55').text()],
            width: 276.096,
            x: 1868.238,
            danwei:'%'
        }
        tiaoXinTu(ruhuayezaoban);
        tiaoXinTu(ruhuayewanban);
    })();
}