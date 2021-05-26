
import {doubleHalfArc, table,default as aa} from "@/js/common/myechars_2";
import {getArr, getData, Q_QArr} from "@/js/common/common";
import {change2Fixed} from "@/js/Q101/tools/changeLength";
import {get_deepObj} from "@/js/common/changeDataType/to_obj";


export default function () {
    // 容器元素
    const box = this.svg.querySelector('#zhiliang');
    // cp符合率
    const list1 = getArr('report1','A38');
    doubleHalfArc({
        ele: box.querySelector('.zaoban'),
        size: {x:280,y:1180,out:165,in:140},
        data:{
            out: list1[2] / 100,
            in: list1[1] / 100
        },
        label:{
            out: change2Fixed(list1[2],0) + '%',
            in: change2Fixed(list1[1],0) + '%'
        },
        fontAttrObj: {
            'font-size':63.5
        }
    });
    const list2 = getArr('report1','A41');
    doubleHalfArc({
        ele: box.querySelector('.wanban'),
        size: {x:720,y:1180,out:165,in:140},
        data:{
            out: list2[2] / 100,
            in: list2[1] / 100
        },
        label: {
            out: change2Fixed(list2[2],0) + '%',
            in: change2Fixed(list2[1],0) + '%'
        },
        fontAttrObj: {
            'font-size':63.5
        }
    });
    // 缺陷改判率

    const data = get_deepObj(getData('report1','A44'));
    // 甲
    doubleHalfArc({
        ele: box.querySelector('.jia'),
        size: {x:1096,y:1180,out:125,in:105},
        data:data['A'],
        label: {
            out: change2Fixed(data['A'].out * 100,2) + '%',
            in: change2Fixed(data['A'].in * 100,2) + '%'
        },
        fontAttrObj: {
            'font-size':48
        }
    });

    // 乙
    doubleHalfArc({
        ele: box.querySelector('.yi'),
        size: {x:1376,y:1180,out:125,in:105},
        data:data['B'],
        label: {
            out: change2Fixed(data['B'].out * 100,2) + '%',
            in: change2Fixed(data['B'].in * 100,2) + '%'
        },
        fontAttrObj: {
            'font-size':48
        }
    });

    // 丙
    doubleHalfArc({
        ele: box.querySelector('.bing'),
        size: {x:1653,y:1180,out:125,in:105},
        data:data['C'],
        label: {
            out: change2Fixed(data['C'].out * 100,2) + '%',
            in: change2Fixed(data['C'].in * 100,2) + '%'
        },
        fontAttrObj: {
            'font-size':48
        }
    });

    // 丁
    doubleHalfArc({
        ele: box.querySelector('.ding'),
        size: {x:1927,y:1180,out:125,in:105},
        data:data['D'],
        label: {
            out: change2Fixed(data['D'].out * 100,2) + '%',
            in: change2Fixed(data['D'].in * 100,2) + '%'
        },
        fontAttrObj: {
            'font-size':48
        }
    });
    // 来料异常
    table({
        width:952.551,
        data: getData('report1','A47'),
        titles:['作业计划号','入口材料号','出口材料号','封锁代码'],
        order:[1,1,1,1],
        $ele: $(box.querySelector('#yichangtixing'))
    });

    // 生产异常

    table({
        width:952.551,
        data:getData('report1','A50'),
        titles:['作业计划号','入口材料号','出口材料号','封锁代码'],
        order:[1,1,1,1],
        $ele: $(box.querySelector('#yichangtixing_1_'))
    });



}