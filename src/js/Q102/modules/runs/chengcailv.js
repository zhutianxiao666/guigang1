import {getData} from "@/js/common/common";
import {get_deepObj} from "@/js/common/changeDataType/to_obj";

export default function () {
    const box = this.svg.querySelector('#chengcailv');
    // 分班组
    const banzuArr = [...box.querySelectorAll('.banzu')];
    // 分取向无取向
    const quxiangArr = [...box.querySelectorAll('.text')]
    // 班组数据
    const data = get_deepObj(getData('report1','A3'));
    // 取向分数据
    const data2 = get_deepObj(getData('report1','A6'));

    banzuArr.forEach(ele => {
        const code = ele.getAttribute('data-index');
        ele.innerHTML =data[code] ?  parseInt(data[code]) + '%' : '0%';
    });
    quxiangArr.forEach(ele => {
        const code = ele.getAttribute('data-index');
        ele.innerHTML = data2[code] ? parseInt(data2[code]) + '%' : '0%';
    })
}