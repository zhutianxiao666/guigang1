import {getData} from "@/js/common/common";
import {change2Fixed} from "@/js/Q101/tools/changeLength";

export default function () {
    const box = this.svg.querySelector('#shebeitingji');
    box.querySelector('.guzhangcishu').innerHTML = change2Fixed(getData('report1','A55'),0);
    box.querySelector('.guzhangshijian').innerHTML = change2Fixed(getData('report1','B55'),0);


}