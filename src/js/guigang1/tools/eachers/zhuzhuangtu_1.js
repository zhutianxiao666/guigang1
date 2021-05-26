/*
* 数据结构为数组
* [
*   [day,value],
*
* ]
* */


// 所传参数内容
/*
* data,必传
* order: 如果是多系列 需要传递order
* x:左下角 必传
* y:左下角 必传
* color:[] 可传可不传
* size: 比例
* */
import {textAlign} from "@/js/common/common";

export default function ({ele,data,x,y,height,width}) {

    const color = '<linearGradient id="zhuzhuangtu_grid1" gradientUnits="objectBoundingBox" x1="0" y1="0" x2="0" y2="100%"><stop offset="0" style="stop-color:#29ABE2"></stop><stop offset="1" style="stop-color:#9B4FFF"></stop></linearGradient>';
    const max = data.reduce((max,value) => {
        if (Number(value[1]) > max) {
            return Number(value[1])
        }else {
            return  max
        }
    },0);
    const width1 = width / data.length;
    const width2 = width1 * 0.7 > width / 15 ? width / 15 : width1 * 0.7 ;

    const list = [];
    list.push(color);
    data.forEach((item,index) => {
        const value = item[1];
        const str =
`<g>
    <rect x="${x + index * width1 + 5}" y="${y - value/max * height }" width="${width2}" height="${value/max * height}" fill="url(#zhuzhuangtu_grid1)"></rect>
    <text class="x" x="${x + index * width1 + 5 + width2 / 2}" y="${y + 10}" font-size="9" fill="white">${item[0]}</text>
    
</g>`;
        list.push(str);
    });
    let textY = `<g>`
    for (let i = 0;i < 5 ; i++) {
        textY += `<text class="y" x="${x}" y="${y - height / 4 * i + 10}" font-size="9" fill="white" >${(max / 4 * i / 1000).toFixed(1) + 'k'}</text>`;
    };
    textY += '</g>';
    list.push(textY);
    ele.innerHTML = list.join('');
    textAlign($(ele.querySelectorAll('#kucun .x')));
    textAlign($(ele.querySelectorAll('#kucun .y')),'right');

}