
import {tiaoXinTu_2} from "@/js/common/myechars_2";
import {getData, Q_QArr} from "@/js/common/common";

export default function () {
    // 容器元素
    const box = this.svg.querySelector('#fuliaoxiaohao');

    // 乳化液早班
    tiaoXinTu_2({
        x: 2060.269,
        ele: box.querySelector('#ruhuaye2'),
        data:[getData('report1','A63'),getData('report1','B63')],
        width:2060.269
    });
    // 乳化液早晚班
    tiaoXinTu_2({
        x: 2060.269,
        ele: box.querySelector('#ruhuaye1'),
        data:[getData('report1','A66'),getData('report1','B66')],
        width:2060.269
    });
    
}