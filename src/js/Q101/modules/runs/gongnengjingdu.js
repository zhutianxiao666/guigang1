import {tiaoXinTu_2} from "@/js/common/myechars_2";
import {getData} from "@/js/common/common";

export default function () {
    const box = this.svg.querySelector('#shebeigongnengjingdu');
    tiaoXinTu_2({
        x:2327.465,
        ele:box,
        data:[getData('report1','A66'),getData('report1','B66')],
        width:597.107
    });
}