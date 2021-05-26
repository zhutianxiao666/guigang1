// 质量
import MV from "@/js/guigang1/tools/MV";
import {getData, Q_QArr} from "@/js/common/common";
import {get_deepObj} from "@/js/common/changeDataType/to_obj";

export default function () {

    const box = this.svg.querySelector('#zhiliang');
    const order_by_code = this.order_by;
    const order_by_ename = ['OUTPUT_RATE_D','OUTPUT_RATE_M','OUTPUT_RATE_Y','JUDGE_RATE_D_IH','JUDGE_RATE_M_IH','JUDGE_RATE_Y_IH'];

    // 查询到的数据
    const dataObj = get_deepObj(Q_QArr(getData('report1','A13')));
    // 个组容器
    const boxList = [
        box.querySelector('#H050_1_'),
        box.querySelector('#C302_1_'),
        box.querySelector('#C101'),
        box.querySelector('#C102'),
        box.querySelector('#C202'),
    ];
    let _index = 0;
    function run() {
        // 获取所需显示的机组
        const codeArr = order_by_code.slice(_index,_index + 5);

        boxList.forEach((box,index) => {
            // 获取机组号
            const code = codeArr[index];
            // 渲染机组号
            box.querySelector('.code').innerHTML = code || '';
            // 渲染数值
            [...box.querySelectorAll('.text')].forEach(ele => {
                // 如果有机组号 则
                if (code){
                    if (!dataObj[code]) {
                        ele.innerHTML = '0%';
                    }else {
                        const data_index = ele.getAttribute('data-index');
                        const ename = order_by_ename[data_index];

                        ele.innerHTML = dataObj[code][ename] ? Number(dataObj[code][ename]).toFixed(0) + '%' : '0%'
                    }
                }
                else { // 如果连机组号都没有 就取消渲染任何内容
                    ele.innerHTML = ''
                }

            })
        });
    };
    run();
    box.onwheel = function (event) {
        if (event.deltaY > 0) {
            if (_index + 5 < order_by_code.length) {
                _index += 5;
            }else {
                return
            }
        }else if (event.deltaY < 0) {
            if (_index - 5 >= 0) {
                _index -= 5;
            }else {
                return;
            }
        };
        run();
    }




}