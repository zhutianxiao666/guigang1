import {getArr} from "@/js/common/common";
import MV from "@/js/guigang1/tools/MV";

export default function () {
    const me = this;
    // 容器
    const box = this.svg.querySelector('#gongchang');
    const kucunArr = [...box.querySelectorAll('.num')];
    const codeArr = [...box.querySelectorAll('[class^="ability_"][data-index="0"]')];
    function getKucunData() {
        const kucunCodeArr = getArr('report2','A3');
        const kucunNumArr = getArr('report2','B3');
        const kucunData = {};
        kucunCodeArr.forEach((value,index) => {
            if (!value.trim().length) return false
            kucunData[value] = kucunNumArr[index];
        });
        return kucunData;
    };

    function run() {
        const kucunCodeArr = getArr('report2','A3');
        const kucunNumArr = getArr('report2','B3');
        const kucunData = {};
        kucunCodeArr.forEach((value,index) => {
            if (!value.trim().length) return false
            kucunData[value] = kucunNumArr[index];
        });
        kucunArr.forEach(ele => {
            const num = this.kucunData[ele.getAttribute('data-index')];
            if (!num) {
                ele.innerHTML = '0%';
                ele.setAttribute('fill','#9FD200');
                return
            }
            let color = '';
            if (num >= 0.9) {
                color = '#FF2A00';
            }else if (num >= 0.7) {
                color = '#F29600';
            }else {
                color = '#9FD200';
            }
            ele.innerHTML =  parseInt(num * 100) + '%';
            ele.setAttribute('fill',color);
        });
    }


    const m1 = new MV({
        data:{
            kucunData:getKucunData()
        },
        cds:run
    });
    const reg = /^ability_/;
    codeArr.forEach(ele => {
        const code = Array.from(ele.classList).find(value => {
            return reg.test(value);
        });
        if (code) {
            ele.onclick = function() {
                IPlatInterop.Call4CForm('QMZJJ4CP' + code.substr(8));
            }
        }
    });
    kucunArr.forEach(ele => {
        ele.onclick = function() {
            FR.doHyperlink(event||window.event, [{"data":`var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({"url":"/webroot/decision/view/form?viewlet=硅钢/库区.frm","para":{"__pi__":true,"STOCK_NO":"${this.getAttribute('data-index')}"},"target":"_blank","feature":{"width":600,"height":400,"isCenter":true,"title":""},"title":"网络报表1"})}, this, as)`,"name":"网络报表1"}], true);
        };
        ele.style.cursor = 'pointer';
    })




}