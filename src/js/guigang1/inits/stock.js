import {getData, Q_QArr} from "@/js/common/common";
import zhuzhuangtu_1 from '../tools/eachers/zhuzhuangtu_1'
import MV from "@/js/guigang1/tools/MV";
import bingTu_2 from "@/js/common/myechars/bingTu_2";
import {get_obj} from "@/js/guigang1/tools/changeDataType/to_obj";

export default function () {
    const me = this;
    const svg = this.svg;
    const avg = svg.querySelector('#kucun .avg');
    const total = svg.querySelector('#kucun .total');
    avg.innerHTML = parseInt(getData('report1','A23')).toString();
    total.innerHTML = parseInt(getData('report1','B23')).toString();
    function get_data(report,td) {
        return Q_QArr(getData(report,td)).reduce((list,item) => {
            list.push([...item]);
            return list
        },[])
    }
    const mv1 = new MV({
        data: {
            type:'total'
        },
        cds:function () {
            if (this.type == 'total') {
                zhuzhuangtu_1({
                    ele:me.svg.querySelector('#qushi_1_ .content'),
                    data: get_data('report1','B26'),
                    x:3254,
                    y:2075,
                    width:515,
                    height:220
                })
            } else if (this.type == 'avg') {
                zhuzhuangtu_1({
                    ele:me.svg.querySelector('#qushi_1_ .content'),
                    data: get_data('report1','A26'),
                    x:3254,
                    y:2075,
                    width:515,
                    height:220
                })
            }
        }
    });

    svg.querySelector('#kucun .avg').onclick = function () {
        if (mv1.type !== 'avg') {
            mv1.type = 'avg';
        }
    };
    svg.querySelector('#kucun .total').onclick = function () {
        if (mv1.type != 'total') {
            mv1.type = 'total';
        }
    };
    // 饼图
    bingTu_2({
        ele:svg.querySelector('#kuling').children[1],
        data:get_obj(getData('report1','A32')),
        x:3408,
        y:1730,
        rOut:80,
        color:['#FF8726','#FFB172','#FFCFA8','#C9C9C9','#D9D9D9'],
        orderArr:['OVER_STOCK_WGT_O','OVER_STOCK_WGT_3','OVER_STOCK_WGT_W','OVER_STOCK_WGT_M'],
        label: {
            fontFamily:'AgencyFB-Reg',
            color:'#3E3A39'
        }
    });

    // 条形图
    // 获取数据


    function run() {
        const orderArr = ['TOL_STOCK_WGT_D_IH_1','TOL_STOCK_WGT_D_NH_1','TOL_STOCK_WGT_D_DU_1']
        const data = get_obj(getData('report1','A29'));
        const width = 108;

        const max = Object.keys(data).reduce((max,key) => {
            if (max < Number(data[key])) {
                return Number(data[key]);
            }else {
                return max;
            }
        },0);
        // 元素
        const elements = [...svg.querySelectorAll('#kucun .zhonglei')];
        elements.forEach(ele => {
            const _index = ele.getAttribute('data-index');
            const key = orderArr[_index];
            const num = data[key];
            ele.setAttribute('width',num <= 0 ? 0 : num / max * width);
        });
    };
    run();
}