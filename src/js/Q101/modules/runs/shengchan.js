import {getData, getArr, textAlign} from "@/js/common/common";
import {change2Fixed} from "@/js/Q101/tools/changeLength";
import {tiaoXinTu_2} from '@/js/common/myechars_2'

export default function () {
    const box = this.svg.querySelector('#shengchan_1_');

    // 昨日总产量
    box.querySelector('.zuori').innerHTML = change2Fixed(getData('report1','A3'),1)
    // 当月
    box.querySelector('.dangyue').innerHTML = change2Fixed(getData('report1','A6'),1);
    // 早班
    const list1 = getArr('report1','A9');

    tiaoXinTu_2({
        x:869.639,
        ele:box.querySelector('#zaoban_2_'),
        width:670.976,
        shift_group:list1[0],
        data:list1.slice(1)
    });
    const list2 = getArr('report1','A12');
    tiaoXinTu_2({
        x:869.639,
        ele:box.querySelector('#wanban'),
        width:670.976,
        shift_group:list2[0],
        data:list2.slice(1),
    });

    const xiaoshi = box.querySelector('.xiaoshi');

    xiaoshi.innerHTML = change2Fixed(getData('report1','A15'),2);
    textAlign($(xiaoshi));
}