
import {zhuzhuangtu} from '../../../common/myechars_2'
import {get_deepObj} from "@/js/common/changeDataType/to_obj";
import {getData} from "@/js/common/common";
export default function () {
    const svg = this.svg;


    zhuzhuangtu({
        width:762.502,
        height:459.29,
        x: 2183.889,
        y: 715,
        margin_: 0.7,
        ele:svg.querySelector('#kucun .content'),
        data: get_deepObj(getData('report1','A59')),
        order1:['Q03','Q04','Q07'],
        order2: ['无取向一轧程','无取向二轧程','取向']
    })
}