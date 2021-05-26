import {getTd} from "../common/common";
import {tiaoXingDuiJi} from "../common/myechars";

export default function () {
     // 返修发生量
    tiaoXingDuiJi({
        id:'zaobannenghao_2_',
        data: [[getTd('report1','B8').text(),getTd('report1','C8').text()],[getTd('report1','B9').text(),getTd('report1','C9').text()]],
        total: [getTd('report1','D8').text(),getTd('report1','D9').text()],
        width: 283.98,
        x: 1923.902
    });
}