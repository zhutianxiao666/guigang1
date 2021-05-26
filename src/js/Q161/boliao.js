import {bingTu} from "../common/myechars";
import {getArr, getTd} from "../common/common";
import {$svg} from "../common/init";

export default function () {
    bingTu({
        data:getArr('report1','A17'),
        rOut:140,
        rIn:80,
        color:['#F59122','#004DB5','#36C2E5','#EFD95B'],
        total:getTd('report1','B3').text(),
        x:1400.616,
        y:430.285,
        $ele:'#bingtu'
    });
    (function () {
            const total = getTd('report1','B17').text();
            $svg.find('#bingtutotal .text').text(Number(total).toFixed(1));
    })();
}