// 能耗
import {tiaoXinTu_2} from "@/js/Q102/tools/eachers";
import {getData} from "@/js/common/common";

export default function () {
    const box = this.svg.querySelector('#nenghao');
    // 早班
    const list1 = [Number(getData('report1','B10')) > 0 ? Number(getData('report1','B10')) : 0,
        Number(getData('report1','C10')) > 0 ? Number(getData('report1','C10')) : 0]
    tiaoXinTu_2({
        x:3224.691,
        ele:box.querySelector('#nenghaozaoban'),
        data:list1,
        width:360,
        shift_group:getData('report1','D10')
    });
    // 晚班
    tiaoXinTu_2({
        x:3224.691,
        ele:box.querySelector('#nenghaowanban'),
        data:[getData('report1','B11'),getData('report1','C11')],
        width:360,
        shift_group:getData('report1','D11')
    });
}