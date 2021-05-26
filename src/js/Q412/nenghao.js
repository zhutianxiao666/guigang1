import {tiaoXinTu} from "../common/myechars";
import {getData} from "../common/common";

export default function () {
    // 早班
    tiaoXinTu({
        x:2522.767,
        id:'zaobannenghao_2_',
        data:[getData('report1','B44'),getData('report1','C44')],
        width:461.277
    });
    // 晚班
    tiaoXinTu({
        x:2522.767,
        id:'wanbannenghao_2_',
        data:[getData('report1','B45'),getData('report1','C45')],
        width:461.277
    });
}