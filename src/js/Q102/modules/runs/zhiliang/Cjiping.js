import {get_deepObj} from "@/js/common/changeDataType/to_obj";
import {getData, Q_QArr} from "@/js/common/common";

export default function (box) {
    // 公共方法
    function showData(ele,data) {
        const code = ele.getAttribute('data-index');
        ele.innerHTML = data.hasOwnProperty(code) ? parseInt(data[code]) + '%' : '0%';
    }
    const banzuEles = box.querySelectorAll('#cjipinlv .banzu');
    const banzuData = get_deepObj(getData('report1',''))

}