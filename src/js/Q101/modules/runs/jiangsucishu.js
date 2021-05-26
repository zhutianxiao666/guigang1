import {get_deepObj} from "@/js/common/changeDataType/to_obj";
import {getData} from "@/js/common/common";
import {change2Fixed} from "@/js/H050/tools/changeLength";

export default function () {
    const box = [...this.svg.querySelectorAll('#jiangsucishu .text')];
    const data = get_deepObj(getData('report1','A69'));
    box.forEach(ele => {
        const key = ele.getAttribute('data-index');
        ele.innerHTML = change2Fixed(data[key],0);
    })
}