import {tiaoXinTu_2} from '@/js/common/myechars_2'
import {getArr} from "@/js/common/common";
export default function () {
    const box = this.svg.querySelector('#nenghao');
    const list1 = getArr('report1','A59');
    console.log(list1,'----------')
    tiaoXinTu_2({
        x:2455.558,
        ele:box.querySelector('#zaobannenghao_2_'),
        data:list1.slice(1),
        width:524.619,
        shift_group:list1[0]
    });

    const list2 = getArr('report1','A62');
    tiaoXinTu_2({
        x:2455.558,
        ele:box.querySelector('#wanbannenghao_2_'),
        data:list2.slice(1),
        width:524.619,
        shift_group:list2[0] || ''
    });

};