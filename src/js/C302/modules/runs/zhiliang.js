
import {doubleHalfArc, table} from '@/js/common/myechars_2'
import {getData} from '@/js/Tools';
import {get_deepObj} from "@/js/common/changeDataType/to_obj";


export default function () {
    const box = this.svg.querySelector('#zhiliang');
    // 碳钢缺陷改判率
    doubleHalfArc({
        ele: box.querySelector('#tangangquexiangaipanlv .content'),
        size: {x:230,y:1320,out:150},
        data:{
            out: 0.5,
            in: 1
        },
        label:{
            out: 50 + '%',
            in: 100 + '%'
        },
        fontAttrObj: {
            'font-size':57.024
        }
    });
    // 硅钢缺陷改判率
    const data = get_deepObj(getData.Q_QArr('A3','report1'));
    for (let key in data) {
        data[key] = data[key] / 100;
    }
    console.log(data,'-----');
    doubleHalfArc({
        ele: box.querySelector('#guigangquexiangaipanlv .content'),
        size: {x:570,y:1320,out:150},
        data:data,
        fontAttrObj: {
            'font-size':57.024
        }
    });
    // 机组缺陷返修率
    doubleHalfArc({
        ele: box.querySelector('#jizuquexianfanxiulv .content'),
        size: {x:1070,y:1320,out:150},
        data:data,
        label:{
            out: 50 + '%',
            in: 100 + '%'
        },
        fontAttrObj: {
            'font-size':57.024
        }
    });

    // 硅钢现货发生率
    doubleHalfArc({
        ele: box.querySelector('#guigangxianhuofashenglv .content'),
        size: {x:1570,y:1320,out:150},
        data:{
            out: 0.5,
            in: 1
        },
        label:{
            out: 50 + '%',
            in: 100 + '%'
        },
        fontAttrObj: {
            'font-size':57.024
        }
    });

    // 碳钢缺陷返修率
    doubleHalfArc({
        ele: box.querySelector('#tangangquexianfanxiulv .content'),
        size: {x:870,y:1600,out:150},
        data:{
            out: 0.5,
            in: 1
        },
        label:{
            out: 50 + '%',
            in: 100 + '%'
        },
        fontAttrObj: {
            'font-size':57.024
        }
    });
    // 硅钢缺陷返修率
    doubleHalfArc({
        ele: box.querySelector('#guigangquexianfanxiulv .content'),
        size: {x:1230,y:1600,out:150},
        data:{
            out: 0.5,
            in: 1
        },
        label:{
            out: 50 + '%',
            in: 100 + '%'
        },
        fontAttrObj: {
            'font-size':57.024
        }
    });
    // cp符合率
    doubleHalfArc({
        ele: box.querySelector('#CPfuhelv .content'),
        size: {x:1570,y:1600,out:150},
        data:{
            out: 0.5,
            in: 1
        },
        label:{
            out: 50 + '%',
            in: 100 + '%'
        },
        fontAttrObj: {
            'font-size':57.024
        }
    });

}