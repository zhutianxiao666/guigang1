// import {getData} from "@/modules/common/common";

import {textAlign} from "@/js/common/common";
import {getData} from "@/js/Tools";

export default function () {
    const box = this.svg.querySelector('#leijichanliang');
    const eleObj = {
        '单机架硅钢': box.querySelector('#quxiang'),
        '连轧硅钢':box.querySelector('#guigang'),
        '连轧碳钢':box.querySelector('#tangang')
    };
    let data = getData.Q_QArr('A45','report1').reduce((obj,value) => {
        obj[value[0]] = {
            num:value[1],
            pointer: value[1] / value[2]
        };
        return obj;
    },{});

    for (let key in eleObj) {
        if (!data[key]) {
            data[key] = {
                num:0,
                pointer:0
            }
        }
        eleObj[key].querySelector('.text[data-index="1"]').innerHTML = parseInt(data[key].num).toString();

        // 百分比
        eleObj[key].querySelector('.text[data-index="0"]').innerHTML = (data[key].pointer * 100).toFixed(2) + '%';
        textAlign($(eleObj[key].querySelector('.text[data-index="0"]')));

    };




    // 绑定指针
    // 指针
    for (let key in data) {
        switch (true) {
            case data[key].pointer > 1:
                data[key].pointer = 1;
                break;
            case data[key].pointer < 0:
                data[key].pointer = 0;
                break;
        }
    };
    const pointer_1 = eleObj['连轧碳钢'].querySelector('.pointer');
    const pointer_2 = eleObj['连轧硅钢'].querySelector('.pointer');
    const pointer_3 = eleObj['单机架硅钢'].querySelector('.pointer');


    pointer_1.setAttribute('transform',`rotate(${data['连轧碳钢'].pointer * 180} 3360,999.3)`);
    pointer_2.setAttribute('transform',`rotate(${data['连轧硅钢'].pointer * 180} 3628.9,999.3)`);
    pointer_3.setAttribute('transform',`rotate(${data['单机架硅钢'].pointer * 180} 3497.9,1172.824 )`);
};