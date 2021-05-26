import {getData} from "@/js/common/common";
import {get_deepObj} from "@/js/common/changeDataType/to_obj";

export default function (box) {
    // 公共方法
    function showData(ele,data) {
        const code = ele.getAttribute('data-index');
        ele.innerHTML = data.hasOwnProperty(code) ? parseInt(data[code]) + '%' : '0%';
    }
    const banzuEles = box.querySelectorAll('#quexiangaipanlv .banzu');
    const quxiangEles = box.querySelectorAll('#quexiangaipanlv .quxiang');
    const banzuData = get_deepObj(getData('report1','A15'));
    const quxiangData = get_deepObj(getData('report1','A17'));

    banzuEles.forEach(ele => {
        showData(ele,banzuData)
    });

    quxiangEles.forEach(ele => {
        showData(ele,quxiangData)
    })

}