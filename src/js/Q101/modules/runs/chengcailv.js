import {get_deepObj} from "@/js/common/changeDataType/to_obj";
import {getData} from "@/js/common/common";
import {change2Fixed} from "@/js/Q101/tools/changeLength";

export default function () {
    const box = this.svg.querySelector('#chengcailv');
    const banzuArr = [...box.querySelectorAll('.banzu')];
    const quxiangArr = [...box.querySelectorAll('.quxiang')];
    const banzuData = get_deepObj(getData('report1','A19'));
    const quxiangData = get_deepObj(getData('report1','A22'));
    banzuArr.forEach(ele => {
        const shift_group = ele.getAttribute('data-index');
        ele.innerHTML = change2Fixed(banzuData[shift_group],2) + '%';
    });
    quxiangArr.forEach(ele => {
        const shift_group = ele.getAttribute('data-index');
        ele.innerHTML = change2Fixed(quxiangData[shift_group],2) + '%';
    });
    
}