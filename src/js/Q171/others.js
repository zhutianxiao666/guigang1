import {tiaoXingDuiJi,arc} from "../common/myechars";
import {getTd,textCenter} from "../common/common";
import {$svg} from "../common/init";
export default  function () {
    // 切边
    tiaoXingDuiJi({
        id:'qiebianliangxianshi',
        data: [[getTd('report1','B35').text(),getTd('report1','C35').text()],[getTd('report1','B36').text(),getTd('report1','C36').text()]],
        total: [getTd('report1','D35').text(),getTd('report1','D36').text()],
        width: 382.508,
        x: 1889.986
    });
    // 返修发生量
    tiaoXingDuiJi({
        id:'fanxiufashengliang',
        data: [[getTd('report1','B40').text(),getTd('report1','C40').text()],[getTd('report1','B41').text(),getTd('report1','C41').text()]],
        total: [getTd('report1','D40').text(),getTd('report1','D41').text()],
        width: 382.508,
        x: 1889.986
    });
    // 本级返修量
    tiaoXingDuiJi({
        id:'benjifanxiuliang',
        data: [[getTd('report1','B45').text(),getTd('report1','C45').text()],[getTd('report1','B46').text(),getTd('report1','C46').text()]],
        total: [getTd('report1','D45').text(),getTd('report1','D46').text()],
        width: 382.508,
        x: 1889.986
    });
    // 平均宽度
    tiaoXingDuiJi({
        id:'pingjunkuandu',
        data: [[getTd('report1','B50').text(),getTd('report1','C50').text()],[getTd('report1','B51').text(),getTd('report1','C51').text()]],
        total: [getTd('report1','D50').text(),getTd('report1','D51').text()],
        width: 382.508,
        x: 2608.91
    });
    // 平均重量
    tiaoXingDuiJi({
        id:'pingjunzhongliang',
        data: [[getTd('report1','B55').text(),getTd('report1','C55').text()],[getTd('report1','B56').text(),getTd('report1','C56').text()]],
        total: [getTd('report1','D55').text(),getTd('report1','D56').text()],
        width: 382.508,
        x: 2608.91
    });
    // 缴库
    (function(){
        const act = getTd('report1','B61').text();
        const plan = getTd('report1','C61').text();
        $svg.find('#jiaokuliang_act').text(Number(act).toFixed(2));
        $svg.find('#jiaokuliang_plan').text('/' + Number(plan).toFixed(2));

        // 昨日
        arc({
            num: 100,//getTd('report1','D60').text(),
            $ele: $svg.find('#zuorijiaoku'),
            r: 132.652,
            x: 2669.263,
            y: 1730.058,
            num1: getTd('report1','B60').text()
        })
        // 本月
        arc({
            num: getTd('report1','D61').text(),
            $ele: $svg.find('#benyuejiaoku'),
            r: 132.652,
            x: 3002.719,
            y: 1717.929,
            num1: getTd('report1','B61').text()
        })
    })();
    // 停机
    (function(){
        const times = getTd('report1','A64').text();
        const total = getTd('report1','B64').text();
        $svg.find('#guzhangtingjicishu').text(Number(times));
        $svg.find('#guzhangtingjishichang').text(Number(total));
    })();
}