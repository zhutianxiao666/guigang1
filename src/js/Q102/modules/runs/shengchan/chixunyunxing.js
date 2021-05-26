import {getData} from "@/js/common/common";
import {get_deepObj} from "@/js/common/changeDataType/to_obj";

export default function (box) {
    const dangnian_max = box.querySelector('#dangnian_max');
    const dangnian_avg = box.querySelector('#dangnian_avg');
    const shangnian_max = box.querySelector('#shangnian_max');
    const shangnian_avg = box.querySelector('#shangnian_avg');
    const lishi_max = box.querySelector('#lishi_max');
    const lishi_avg = box.querySelector('#lishi_avg');
    const now = box.querySelector('#now');

    const data = get_deepObj(getData('report1','A97'));
    dangnian_max.innerHTML = data.FIBRE_MAX

}