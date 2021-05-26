import {$svg} from "../common/init";
import {zhuZhuangTu} from "../common/myechars";
import {getArr, getTd, Q_QArr} from "../common/common";

export default function () {

    zhuZhuangTu({
        width:624.917,
        height:381.12,
        color:['#0C67A5','#2EA7E0','#8034B2','#BF36B5'],
        x:3169.097,
        y:719.129,
        data:Q_QArr(getTd('report1','B16').text()),
        order1:getArr('report1','A16'),
        order2: ['在制品卷数','在制品重量','成品卷数','成品重量'],
        $ele: $svg.find('#kuqu'),
        margin:0.3,
        textY:779.3438
    });
}