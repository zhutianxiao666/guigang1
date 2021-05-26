import {getTd} from "../common/common";
import {$svg} from "../common/init";

export default function () {
    // 设备停机
    (function () {
            const times = getTd('report1','A44').text();
            const total = getTd('report1','B44').text();
            $svg.find('#tingjicishu_1_ .text').text(Number(times).toFixed(0));
            $svg.find('#tingjishijian_1_ .text').text(Number(total).toFixed(1));
    })();

}