import {tiaoXinTu} from "../common/myechars";
import { getData} from "@/js/common/common";

export default function () {
    // 早班
    tiaoXinTu({
        x:2522.767,
        id:'zaobannenghao_2_',
        data:[getData('report1','B63'),getData('report1','C63')],
        width:461.277,
        shift_group:getData('report1','D63')
    });
    // 晚班
    tiaoXinTu({
        x:2522.767,
        id:'wanbannenghao_2_',
        data:[getData('report1','B64'),getData('report1','C64')],
        width:461.277,
        shift_group:getData('report1','D64')
    })
}