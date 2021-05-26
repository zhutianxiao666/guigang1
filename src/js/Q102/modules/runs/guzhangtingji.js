import {getData} from "@/js/common/common";

export default function () {
    // 容器
    const box = this.svg.querySelector('#guzhangshijian_2_');
    box.querySelector('.day').innerHTML = getData('report1','A70') ?  parseInt(getData('report1','A70')) : '0';
    box.querySelector('.month').innerHTML = getData('report1','A73') ? parseInt(getData('report1','A73')) : '0';
};