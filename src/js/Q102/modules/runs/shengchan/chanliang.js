import {getData} from "@/js/common/common";
import {tiaoXinTu_2, tiaoXinTu_duiJi} from "@/js/common/myechars_2";
import {get_deepObj} from "@/js/common/changeDataType/to_obj";

export default function (box) {
    function changeData(data,length = 1) {
        data = isNaN(Number(data)) ? 0 : Number(data);
        return data.toFixed(length);

    }
    // 上方数值
    const dangyue = box.querySelector('#dangyuezongliang');
    const zuori = box.querySelector('#zuorizongliang');
    const dangri = box.querySelector('#dangrichanliang');
    const wanchenglv = box.querySelector('#dangyuewanchenglv');

    dangyue.innerHTML = changeData(getData('report1','A78'));
    zuori.innerHTML = changeData(getData('report1','A81'));
    dangri.innerHTML = changeData(getData('report1','A84'));
    wanchenglv.innerHTML = changeData(getData('report1','A87') * 100 , 2) + '%';

    // 取向
    tiaoXinTu_2({
        x:424.472,
        ele: box.querySelector('#zaoban'),
        data: [getData('report1','A91'),getData('report1','B91')],
        width: 717.789
    });

    // 无取向
    tiaoXinTu_duiJi({
        ele:box.querySelector('#wanban .content'),
        size: {x:424.472,y:660.51,width:717.789,height:100},
        data:get_deepObj(getData('report1','A94')),
        order1:['day','month'],
        order2:['PROD_SR_S1','PROD_SR_S2'],
        margin:0.2
    });


}