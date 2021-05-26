// 质量
import MV from "@/js/guigang1/tools/MV";
import {getData, Q_QArr} from "@/js/common/common";

export default function () {

    const me = this;
    const order_by = ['OUTPUT_RATE_D','OUTPUT_RATE_M','OUTPUT_RATE_Y','JUDGE_RATE_D_IH','JUDGE_RATE_M_IH','JUDGE_RATE_Y_IH'];

    // 标签元素
    const children = [
        me.svg.querySelector('#H050_1_'),
        me.svg.querySelector('#C302_1_'),
        me.svg.querySelector('#C101'),
        me.svg.querySelector('#C102'),
        me.svg.querySelector('#C202'),
    ];
    /*
    * 数据
    * 原本数据结构为
    * [
    *   ['code','name','value]
    * ]
    *
    * 结构为
    * {
    *   机组名称1: {
    *       item_ename: item_value
    *   },
    *   机组名称2: [计划，实际],
    *   机组名称3: [计划，实际],
    *   机组名称4: [计划，实际],
    * }
    * */
    const content_data = (function () {
        const obj = {};
        const bigList = Q_QArr(getData('report1','A13'));
        bigList.forEach(smallList => {
            const key = smallList[0].trim();
            if (obj.hasOwnProperty(key)) {
                // 对象里面添加属性
                obj[key][smallList[1]] = smallList[2];
            } else {
                // 赋值一个对象
                obj[key] = {[smallList[1]]:smallList[2]};
            }
        })
        return obj;
    })();
    console.log(content_data,'---------');

    const mv1 = new MV({
        data: {
            // _index:0,
            _index : {
                num: 0
            }
        },
        cds:function () {
            // 节取显示内容的code
            const show_code = me.order_by.slice(this._index.num,this._index.num + 5);
            // 显示code
            children.forEach((content , index) => {
                // 机组号名称
                const key = show_code[index];
                if (key) { // 没超出范围
                    // 显示机组号
                    content.querySelector('.code').innerHTML = key;
                    // 显示百分比
                    [...content.querySelectorAll('.text')].forEach((ele,index2) => {
                        const item_ename = order_by[ele.getAttribute('data-index')];

                        ele.innerHTML = content_data[key] && content_data[key][item_ename] ? content_data[key][item_ename] * 100 .toFixed(2) + "%" : '0%';

                    });
                }else { // 超出范围
                    content.querySelector('.code').innerHTML = '';
                    [...content.querySelectorAll('.text')].forEach(ele => {
                        ele.innerHTML = '';
                    })
                }
            })
        }
    });

    me.svg.querySelector('#zhiliang').onwheel = function (event) {
        console.log('滚动');

        if (event.deltaY > 0 && mv1._index.num + 5 <= Object.keys(content_data).length - 1) {
            mv1._index = {
                num:mv1._index.num + 5
            }
        }else if (event.deltaY < 0 && mv1._index - 5 >= 0) {
            mv1._index = {
                num:mv1._index.num - 5
            }
        }
    }


}