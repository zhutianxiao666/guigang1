/*
*
* 折线图
* 数据结构
* [
*   {
*       day:1,
*       num:22
*   }
* ]
*
* */

import {textAlign} from "@/js/common/common";

export default function ({ele,arr,x = 1,y = 1,height = 1,width = 1,color ={},fontType = {}}) {

    if (arr == undefined || arr.length == 0) {
        ele.innerHTML = '';
        return;
    }
    // 最大值
    const max = arr.reduce((max,value) => {
        if (max < Number(value.num)) {
            return Number(value.num);
        }else {
            return max
        }
    },0);
    color = Object.assign({arc:'yellow',path:'orange'},color);
    fontType = Object.assign({fontSize:'18',fontFamily:'ArialMT',color:'white'},fontType);
    // 路径
    const pathArr = [];
    // 圆点
    const arcArr = [];
    // y轴文本
    const yTextArr = [];
    // x轴文本
    const xTextArr = [];
    // 宽度
    const width1 = arr.length == 1 ? width :  width / (arr.length - 1);

    if (arr.length == 1) {
        arcArr.push(`<circle r="6" cx="${x + width1 / 2}" cy="${y - arr[0].num / max * height}" fill="${color.arc}" ></circle>`);
        pathArr.push(`<path d="M${x},${y - height} h${width}" stroke-width="3" stroke="${color.path}"></path>`);
        xTextArr.push(`<text x="${x + width1 / 2}" y="${y + 10}" font-size="${fontType.fontSize}" fill="${fontType.color}" class="x">${arr[0].day}</text>`);
    }else {
        pathArr.push(`<path d="`);
        arr.forEach((value,index)=> {
            if (index == 0) {
                pathArr.push(`M${x + width1 * index},${y - value.num / max * height}`);
            }else {
                pathArr.push(` L${x + width1 * index},${y - value.num / max * height}`);
            };
            arcArr.push(`<circle  r="6" cx="${x + width1 * index}" cy="${y - arr[index].num / max * height}" fill="${color.arc}" ></circle>`);
            xTextArr.push(`<text  x="${x + width1 * index}" y="${y + 10}" font-size="${fontType.fontSize}" fill="${fontType.color}" class="x">${arr[index].day}</text>`);
        });
        pathArr.push(`" stroke="${color.path}" stroke-width="3" fill="none" />`);
    };

    ele.innerHTML = pathArr.join('') + arcArr.join('') + yTextArr.join('') + xTextArr.join('');

    textAlign($(ele.querySelectorAll('.x')));

}