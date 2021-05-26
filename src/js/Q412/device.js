import {getTd} from "../common/common";
import {$svg} from "../common/init";

export default function () {
    // 设备停机
    (function () {
            const times = getTd('report1','A42').text();
            const total = getTd('report1','B42').text();
            $svg.find('#tingjicishu_1_ .text').text(Number(times).toFixed(0));
            $svg.find('#tingjishijian_1_ .text').text(Number(total).toFixed(1));

            const guzhang_times = Number(getTd('report1','A49').text()).toFixed(0);
            const guzhang_total = Number(getTd('report1','B49').text()).toFixed(1);

            $svg.find('#guzhangcishu').text(guzhang_times);
            $svg.find('#guzhangshijian').text(guzhang_total);
    })();
}