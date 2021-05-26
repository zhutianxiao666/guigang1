import {getTd} from "../common/common";
import {tiaoXingDuiJi} from "../common/myechars";

export default function () {
     // 返修发生量
    tiaoXingDuiJi({
        id:'zaobannenghao_1_',
         data: [[getTd('report1','B11').text(),getTd('report1','C11').text()],[getTd('report1','B12').text(),getTd('report1','C12').text()]],
         total: [getTd('report1','D11').text(),getTd('report1','D12').text()],
        width: 283.98,
        x: 2651.364
    });

}