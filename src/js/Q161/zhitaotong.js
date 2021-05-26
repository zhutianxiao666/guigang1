import {getTd} from "../common/common";
import {$svg} from "../common/init";

export default function () {
    // 纸套茼
    (function () {
            const dayData = getTd('report1','A41').text();
            const monthData = getTd('report1','B41').text();
            $svg.find('#zuorichanliang_5_ .text').text(Number(dayData).toFixed(1));
            $svg.find('#dangyuechanliang_1_ .text').text(Number(monthData).toFixed(1));
    })();

}