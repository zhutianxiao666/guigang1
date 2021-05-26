import {getData} from "@/js/common/common";
import {textAlign} from "@/js/common/common";

export default function () {
    const ele = this.ele;
    const equipment = this.svg.querySelector('#shebei');
    ele.equipment = {self:equipment};
    ele.equipment.cishu = equipment.querySelector('.text[data-index="0"]');
    ele.equipment.shijian = equipment.querySelector('.text[data-index="1"]');
    ele.equipment.guzhangcishu = equipment.querySelector('.text[data-index="2"]');
    ele.equipment.guzhangshijian = equipment.querySelector('.text[data-index="3"]');


    ele.equipment.cishu.innerHTML = getData('report1','A3');
    ele.equipment.shijian.innerHTML = getData('report1','B3');
    ele.equipment.guzhangcishu.innerHTML = getData('report1','C3');
    ele.equipment.guzhangshijian.innerHTML = getData('report1','D3');


    textAlign($(ele.equipment.cishu),'right');
    textAlign($(ele.equipment.shijian),'right');
    textAlign($(ele.equipment.guzhangcishu),'right');
    textAlign($(ele.equipment.guzhangshijian),'right');

    // console.log(ele.equipment.cishu.getBBox());

    // const shebei = this._this.svg.querySelector('#shebei');
    // const cishu = shebei.querySelector('.text[data-index="0"]');
    // const shijian = shebei.querySelector('.text[data-index="1"]');
    // const guzhangcishu = shebei.querySelector('.text[data-index="2"]');
    // const guzhangshijian = shebei.querySelector('.text[data-index="3"]');
    // cishu.innerText = getData('report1',)
}