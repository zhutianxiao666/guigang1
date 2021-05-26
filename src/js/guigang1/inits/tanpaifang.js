import {getData} from "@/js/common/common";

export default function () {
    this.svg.querySelector('#tanpaifang .text').innerHTML = Number(getData('report1','A10')).toFixed(2);
}