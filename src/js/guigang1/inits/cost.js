import {getData, Q_QArr, textAlign} from "@/js/common/common";
import MV from "@/js/guigang1/tools/MV";

export default function () {
    // 声明公共变量
    const me = this;
    const svg = this.svg;
    // 机组号
    const code_arr = [...svg.querySelectorAll('#chengben .code')];
    // 成本计划值
    const cost_plan_arr = [...svg.querySelectorAll('#chengben .cost_plan')];
    // 成本实际值
    const cost_actual_arr = [...svg.querySelectorAll('#chengben .cost_actual')];
    // 成本百分比
    const cost_percentage_arr = [...svg.querySelectorAll('#chengben .cost_percentage')];
    // 百分比箭头
    const cost_pointer_arr = [...svg.querySelectorAll('#chengben .pointer')];
    // 成本数据
    /*
    * 数据结构为
    * {
    *   机组名称1: [计划，实际],
    *   机组名称2: [计划，实际],
    *   机组名称3: [计划，实际],
    *   机组名称4: [计划，实际],
    * }
    * */
    const cost_data = get_cost('report1','A16');



    function get_cost(report,td) {
        const obj = {};
        const bigList = Q_QArr(getData(report,td));
        bigList.forEach(littleList => {
            obj[littleList[0]] = littleList.slice(1);
        })
        return obj
    }
    const mv1 = new MV({
        data:{
            _index:0
        },
        cds:function () {
            // 获取显示机组
            const show_code = me.order_by.slice(this._index,this._index + 5);

            // 显示机组号
            code_arr.forEach(ele => {
                // 获得下标
                const index = ele.getAttribute('data-index');
                if (show_code[index]) { // 如果存在 则显示内容
                    ele.innerHTML = show_code[index];
                    textAlign($(ele));
                }else { // 如果不存在则 清除内容
                    ele.innerHTML = '';
                }
            });
            // 显示成本计划
            cost_plan_arr.forEach(ele => {
                // 获得下标
                const index = ele.getAttribute('data-index');
                const key = show_code[index];
                if (key) { // 如果存在 则显示内容
                    ele.innerHTML = cost_data[key] ? cost_data[key][0] : '0';
                }else { // 如果不存在则 清除内容
                    ele.innerHTML = '';
                }
            });
            // 显示成本实际
            cost_actual_arr.forEach(ele => {
                const index = ele.getAttribute('data-index');
                const key = show_code[index];
                if (key) {
                    ele.innerHTML = cost_data[key] ? ' / ' + cost_data[key][0] : ' / 0';
                }else {
                    ele.innerHTML = '';
                }
            });
            // 百分比
            cost_percentage_arr.forEach(ele => {
                const index = ele.getAttribute('data-index');
                const pointer = cost_pointer_arr.find(ele => ele.getAttribute('data-index') == index);
                const key = show_code[index];
                if (key) { // 有key
                    let num = '';


                    if (!cost_data[key] || cost_data[key][0] == 0) { // 如果没有数据
                        ele.innerHTML = '0%';
                        pointer.innerHTML = '↓';
                        pointer.setAttribute('fill','#8DC21F');
                    }else if (cost_data[key][0] == 0) {  // 如果计划之为0
                        num = parseInt((Math.abs(cost_data[key][1]) - Math.abs(cost_data[key][0])) / cost_data[key][0] * 100);
                        ele.innerHTML = num + '%';
                        if (num <= 0) {
                            pointer.innerHTML = '↓';
                            pointer.setAttribute('fill','#8DC21F');
                        }else {
                            pointer.innerHTML = '↑';
                            pointer.setAttribute('fill','#F29600');
                        };
                    }

                }else {  // 没有key
                    ele.innerHTML = '';
                    pointer.innerHTML = '';
                    // pointer.setAttribute('fill','#8DC21F');
                }
            });
        }
    });
    svg.querySelector('#chengben').onclick = function (event) {
        const list = [...event.target.classList];
        if (list.includes('top')) {
            mv1._index - 5 >= 0 &&  (mv1._index -= 5);
        } else if (list.includes('bottom')) {
            mv1._index + 5 < me.order_by.length  &&  (mv1._index += 5);
        }
    }
    svg.querySelector('#chengben').onwheel = function (event) {
        if (event.deltaY > 0) {

            $(svg.querySelector('#chengben .bottom')).click();
        }else if (event.deltaY < 0) {

            $(svg.querySelector('#chengben .top')).click();
        }
    }


}