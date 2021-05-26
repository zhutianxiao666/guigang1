import {huanxingtu, zhuzhuangtu} from '@/js/common/myechars_2'
import {get_deepObj} from "@/js/common/changeDataType/to_obj";
import {getData} from "@/js/common/common";
export default function () {
    const box = this.svg.querySelector('#kucun');
    console.log(get_deepObj(getData('report1', 'A25')));
    zhuzhuangtu({
        width:950,
        height:466.093,
        x:1856.232,
        y:733.0225,
        ele:box.querySelector('.zhuzhuangtu'),
        data:get_deepObj(getData('report1','A25')),
        order1:['Q01','Q03','Q04'],
        order2:['无取向一轧程','无取向二轧程','取向']
    });
    huanxingtu({
        size:{
            x:2960.8733,
            y:220,
            rOut:110,
            rIn: 80
        },
        ele: box.querySelector('.kucunliang'),
        data: {
            num: 0.3,
            text: 'tttt'
        }
    });
    huanxingtu({
        size:{
            x:2960.8733,
            y:540,
            rOut:110,
            rIn: 80
        },
        ele: box.querySelector('.chaoqiliang'),
        data: {
            num: 0.3,
            text: '100'
        }
    });

}