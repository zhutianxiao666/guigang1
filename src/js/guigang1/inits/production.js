import {getData, Q_QArr, textAlign} from "@/js/common/common";
import {get_obj} from "@/js/guigang1/tools/changeDataType/to_obj";
import MV from "@/js/guigang1/tools/MV";
import {jieliu} from "@/js/common/commons/jieliu";
import zhexiantu from "@/js/guigang1/tools/eachers/zhexiantu";

export default function () {

    // 公共变量start -------------
    const me = this;
    const svg = this.svg;
    // 机组号ele
    const code_arr = [...svg.querySelectorAll('#shengchan .code')];
    // 数值ele
    const num_arr = [...svg.querySelectorAll('#shengchan .text')];
    // 左右切换ele
    const right = svg.querySelector('#shengchan .right');
    const left = svg.querySelector('#shengchan .left');
    const background = svg.querySelector('#shengchan #bg_8_');

    // 汇总数据
    const total_obj = get_obj(getData('report1','A36'));
    // 明细数据
    /*
    * {
    *   key:{
    *       day
    *   }
    * }
    * */
    // const list_arr = get_obj(getData('report1','A39'));
    // 公共变量end -------------------

    const huizong = new MV({
        data: {
            _index: 0
        },
        cds: [function () {
            // 获取显示机组
            const order_arr = me.order_by.slice(this._index,this._index + 6);
            // 显示机组号
            code_arr.forEach(codeEle => {
                const index = codeEle.getAttribute('data-index');
                codeEle.innerHTML = order_arr[index]  ||  '';
            });
            num_arr.forEach(numELe => {
                const index = numELe.getAttribute('data-index');
                const key = order_arr[index];
                if (!key) {
                    numELe.innerHTML = '';
                    return false;
                }else if (total_obj[key] && !isNaN(Number(total_obj[key]))) {
                    numELe.innerHTML = parseInt(total_obj[key] / 1000);
                }else {
                    numELe.innerHTML = '0';
                }
            });
            textAlign($(svg.querySelectorAll('#shengchan .text,#shengchan .code')));
        }]
    });

    left.onclick = function () {
        if (huizong._index -5 >= 0) {
            huizong._index -= 5;
        }
    };
    right.onclick = function () {
        if (huizong._index + 5 < me.order_by.length) {
            huizong._index += 5
        }
    };
    background.onwheel = jieliu(function (event) {
        if (event.deltaY > 0 ) {
            $(right).click();
        }else if (event.deltaY < 0) {
            $(left).click();
        }
    },500);
    /*
    * {
    *   code:[
    *       {day:1,num:22}
    *   ]
    * }
    * */
    const code_data_arr = Q_QArr(getData('report1','A39')).reduce((obj,list) => {
        if (!obj.hasOwnProperty(list[0])) {
            obj[list[0]] = [];
        };
        obj[list[0]].push({day:list[1].trim().substr(4),num:Number(list[2])})
        return obj
    },{});






    // 明细数据（折线图）
    const mingxi = new MV({
        data:{
            _code: 'H050'
        },
        cds: function () {
            const data = code_data_arr[this._code];
            zhexiantu({
                ele:svg.querySelector('#qushi_3_').children[3],
                arr:data,
                x:99.12,
                y:2062.955,
                height:203,
                width:561,
            })
        }
    });
    svg.querySelector('#shengchan').onclick = function (event) {
        // 获得被点击的元素
        const ele = event.target;
        const _index = ele.getAttribute('data-index');
        if (_index) {
            const code = code_arr.find(value => value.getAttribute('data-index') == _index).innerHTML;
            mingxi._code = code;
        }
    }

}