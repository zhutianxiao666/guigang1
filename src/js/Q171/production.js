import {bingTu_171,tiaoXinTu} from "../common/myechars";
import {getTd,textCenter,getArr} from "../common/common";
import {$svg} from "../common/init";
export default  function () {

    (function(){
        // 昨日总产量
        const yesterday = getTd('report1','B3').text();
        textCenter($svg.find('#zuorichanliang .text').text(Number(yesterday).toFixed(1)));
        // 当月总产量
        const last_mon = getTd('report1','B4').text();
        textCenter($svg.find('#dangyuechanliang .text').text(Number(last_mon).toFixed(1)));
    })();
    
    tiaoXinTu({            
        id:'zaoban',
        data: [getTd('report1','B7').text(),getTd('report1','C7').text()],
        width: 299.264,
        x: 371.987,
        shift_group: getTd('report1','D7').text()
    });
    tiaoXinTu({
        id:'wanban',
        data: [getTd('report1','B8').text(),getTd('report1','C8').text()],
        width: 299.264,
        x: 371.987,
        shift_group: getTd('report1','D8').text()
    });
    // 0.2薄料
    bingTu_171({
        data:getArr('report1','A67'),
        rOut:110,
        rIn:69,
        color:['#F4A017','#0075D8','#36C2E5','#EFD95B'],
        x: 1183.246,
        y:338.082,
        $ele:'#boliaobi02',
        total:  getTd('report1','B4').text()
    })
    // 0.23薄料
    bingTu_171({
        data:getArr('report1','B67'),
        rOut:110,
        rIn:69,
        color:['#F4A017','#0075D8','#36C2E5','#EFD95B'],
        x: 1554.696,
        y:338.082,
        $ele:'#boliaobi023',
        total: getTd('report1','B4').text()
    })
    // 出钢记号
    bingTu_171({
        data:getArr('report1','C67'),
        rOut:110,
        rIn:69,
        color:['#F4A017','#0075D8','#36C2E5','#EFD95B'],
        x: 1183.246,
        y:687.728,
        $ele:'#chugangjihao',
        total:  getTd('report1','B4').text()
    })
    // 出钢记号比
    bingTu_171({
        data:getArr('report1','D67'),
        rOut:110,
        rIn:69,
        color:['#F4A017','#0075D8','#36C2E5','#EFD95B'],
        x: 1554.696,
        y:687.728,
        $ele:'#chugangjihaobi',
        danwei:'%'
    })
}