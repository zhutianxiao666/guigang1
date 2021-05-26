import {getData, Q_QArr, Q_QObj} from "@/js/common/common";
import MV from "@/js/guigang1/tools/MV";

export default function () {
    // 公共变量
    const me = this;
    const svg = this.svg;
    const eles = {
        H050: {
            run:svg.querySelector('#H050yunxing'), // 运行
            stop:svg.querySelector('#H050tingji'), // 停机
            check:svg.querySelector('#H050jianxiu') // 检修
        },
        C302: {
            run:svg.querySelector('#C302yunxing'), // 运行
            stop:svg.querySelector('#C302tingji'), // 停机
            check:svg.querySelector('#C302jianxiu') // 检修
        },
        Q101: {
            run:svg.querySelector('#Q101yunxing'), // 运行
            stop:svg.querySelector('#Q101tingji'), // 停机
            check:svg.querySelector('#Q101jianxiu') // 检修
        },
        Q216: {
            run:svg.querySelector('#RPLyunxing'), // 运行
            stop:svg.querySelector('#RPLtingji'), // 停机
            check:svg.querySelector('#RPLjianxiu') // 检修
        },
        Q102: {
            run:svg.querySelector('#RCM1yunxing'), // 运行
            stop:svg.querySelector('#RCM1tingji'), // 停机
            check:svg.querySelector('#RCM1jianxiu') // 检修
        },
        Q202: {
            run:svg.querySelector('#RCM1yunxing_1_'), // 运行
            stop:svg.querySelector('#RCM2tingji'), // 停机
            check:svg.querySelector('#RCM2jianxiu') // 检修
        },
        Q302: {
            run:svg.querySelector('#RCM3yunxing'), // 运行
            stop:svg.querySelector('#RCM3tingji'), // 停机
            check:svg.querySelector('#RCM3jianxiu') // 检修
        },
        Q116: {
            run:svg.querySelector('#CPLyunxing'), // 运行
            stop:svg.querySelector('#CPLtingji'), // 停机
            check:svg.querySelector('#CPLjianxiu') // 检修
        }
    };
    const stateArr = [...svg.querySelectorAll('#gongchang text[class^="ability_"]')];
    // 公共变量结束
    function get_data(report,td) {
        const obj = {};
        const list = Q_QArr(getData(report,td));
        list.forEach(value => {
            if (value[0]) {
                obj[value[0]] = value[1];
            }
        });
        return obj;
    };
    // 正则表达式
    const  reg = /^ability_/;
    // 创建mv
    const m1 = new MV({
        data:{
            freshData:{
                stateArr:get_data('report2','A6'),
                zonghechengcailvArr:get_data('report2','A9'),
                cailiaohaoArr: get_data('report2','A12')

            }
        },
        cds:function () {
            // 改变图片颜色
            for (let key in eles) {
                let type = '';
                if (this.freshData.stateArr[key] == '1000') {
                    type = 'run';
                }else {
                    type = 'stop';
                };
                for (let key2 in eles[key]) {
                    if (key2 == type) {
                        eles[key][key2].setAttribute('display','');
                    }else {
                        eles[key][key2].setAttribute('display','none');
                    }
                }
            }
            // 改变文本颜色
            stateArr.forEach(ele => {
                const _index = ele.getAttribute('data-index');
                let code = ele.getAttribute('class').substr(8);
                code = Array.from(ele.classList).find(value => {
                    return reg.test(value);
                }).substr(8);
                let color = ''
                // 先判断开停机状态
                if (this.freshData.stateArr[code] == '1000') { // 开机

                    switch (_index) {
                        case '0': // 机组号
                            color = '#ffffff';
                            break;
                        case '1':
                            color = '#03FFFF';
                            break;
                        case '2':
                            color = '#00DCFF';
                            break;
                    }
                }else {
                    color = '#888888';
                }
                // 修改颜色
                ele.setAttribute('fill',color);

                // 修改文本
                if (_index == '1') {
                    ele.innerHTML = this.freshData.zonghechengcailvArr[code] ? (this.freshData.zonghechengcailvArr[code] * 100).toFixed(0) + '%' : '0%'
                }else if (_index == '2') {
                    ele.innerHTML = this.freshData.cailiaohaoArr[code] ? this.freshData.cailiaohaoArr[code] : '...'

                }
            });
        }
    });
    window.test = function () {
        console.log('ok');

        m1.freshData = {
            stateArr:get_data('report2','A6'),
            zonghechengcailvArr:get_data('report2','A9'),
            cailiaohaoArr: get_data('report2','A12')
        };
    };

    // 点击明细
    stateArr.forEach(ele => {
        const data_index = ele.getAttribute('data-index');
        if (data_index == 0) {
            let code = ''
            ele.onclick = function () {
                const str = Array.from(this.classList).find(value => {
                    return reg.test(value);
                });
                if (str == 'ability_H050' || str == 'ability_C302') {
                    code = str.substr(8);
                }else {
                    code = str.substr(9);
                };
                IPlatInterop.Call4CForm('QMZJJ4CP' + code);
            }
        }
    });
    const list = ['Q102','Q202','Q302'];
    for (let key in eles) {
        for (let key2 in eles[key]) {
            const ele = eles[key][key2];
            ele.style.cursor = 'pointer';
            ele.onclick = function () {
                let name;
                if (list.includes(key)) {
                    name = `Q102机组运行管控.frm&unit_code=${key}`;
                }else {
                    name = `${key}机组运行管控.frm`
                };
                FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢一期/${name}","para":{"__pi__":true},"target":"_blank","feature":{"width":600,"height":400,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
            }
        };
    };


}