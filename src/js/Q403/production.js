import {table} from "../common/myechars";
import {getTd} from "../common/common";
import {$svg} from "../common/init";
export default  function () {

    // 产量
    (function () {
        const list1 = getTd('report1','B3').text().replace(/\s/g,'');
        table({
            width: 690.544,
            data: list1,
            titles: ['规格','昨日','本月'],
            order: [1,1,1],
            $ele: $svg.find('#chanliang')
        });
    })();
    // 封闭量
    (function () {
        const list1 = getTd('report1','B4').text().replace(/\s/g,'');
        table({
            width: 723.49,
            data: list1,
            titles: ['机组','库区','厚度','封闭量','未封闭量'],
            order: [1,1,1,1,1],
            $ele: $svg.find('#fengbiliang')
        });
    })();
    // 装炉
    (function () {
        const list1 = getTd('report1','B5').text().replace(/\s/g,'');
        table({
            width: 472.15,
            data: list1,
            titles: ['厚度','昨日','本月'],
            order: [1,1,1],
            $ele: $svg.find('#zhuanglupingjunjuanzhong')
        });
    })();
    // 出炉
    (function () {
        const list1 = getTd('report1','B6').text().replace(/\s/g,'');
        table({
            width: 472.15,
            data: list1,
            titles: ['厚度','昨日','本月'],
            order: [1,1,1],
            $ele: $svg.find('#chulupingjunjuanzhong')
        });
    })();
}