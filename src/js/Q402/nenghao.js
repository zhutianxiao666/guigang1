import {tiaoXinTu,tiaoXingDuiJi} from "../common/myechars";
import {getTd,getArr,textCenter} from "../common/common";
import {$svg} from "../common/init";
export default  function () {
    // 能耗
    (function () {
        // 早班
        const zaobannenghao = {
            'id':'zaobannenghao',
            data: [getTd('report1','B49').text(),getTd('report1','C49').text()],
            shift_group: getTd('report1','D49').text(),
            width: 360.212,
            x: 3224.691
        }
        // 晚班
        const wanbannenghao = {
            'id':'wanbannenghao',
            data: [getTd('report1','B50').text(),getTd('report1','C50').text()],
            shift_group: getTd('report1','D50').text(),
            width: 360.212,
            x: 3224.691
        }
        tiaoXinTu(zaobannenghao);
        tiaoXinTu(wanbannenghao);
    })();
}