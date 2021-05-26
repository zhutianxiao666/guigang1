// 环保
import {bingTu_2} from "@/js/common/myechars";
import { getData} from "@/js/common/common";
import {get_obj} from "@/js/guigang1/tools/changeDataType/to_obj";

export default function () {
    const box = this.svg.querySelector('#huanbao');
    box.onclick = function() {
        IPlatInterop.Call4CForm('HBHA03');
    };
    box.style.cursor = 'pointer';
    // 准备数据
    // 字符串改对象

    bingTu_2({
        ele:box.querySelector('#nox'),
        data:get_obj(getData('report1','A7')),
        x:3008.849,
        y:1488.707125,
        rOut:80,
        rIn:40,
        color:['#004DB5','#36C2E5','#EFD95B','#F59122'],
        title: {
            text:'NOX',
            fontSize: 30,
            color: 'white'
        }
    });

    bingTu_2({
        ele:box.querySelector('#fenchen'),
        data:get_obj(getData('report1','B7')),
        x:3008.849,
        y:1669.487375,
        rOut:80,
        rIn:40,
        color:['#004DB5','#36C2E5','#EFD95B','#F59122'],
        title: {
            text:'粉尘',
            fontSize: 30,
            color: 'white'
        }
    });

    bingTu_2({
        ele:box.querySelector('#SO2'),
        data:get_obj(getData('report1','C7')),
        x:3008.849,
        y:1850.267625,
        rOut:80,
        rIn:40,
        color:['#004DB5','#36C2E5','#EFD95B','#F59122'],
        title: {
            text:'SO2',
            fontSize: 30,
            color: 'white'
        }
    });

    bingTu_2({
        ele:box.querySelector('#zonghe'),
        data:get_obj(getData('report1','D7')),
        x:3008.849,
        y:2031.047875,
        rOut:80,
        rIn:40,
        color:['#004DB5','#36C2E5','#EFD95B','#F59122'],
        title: {
            text:'综合',
            fontSize: 30,
            color: 'white'
        }
    });


}