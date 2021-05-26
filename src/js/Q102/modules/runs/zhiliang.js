import {getData} from "@/js/common/common";
import {get_deepObj} from "@/js/common/changeDataType/to_obj";
import quexian from "@/js/Q102/modules/runs/zhiliang/quexian";
import cpfuhelv from "@/js/Q102/modules/runs/zhiliang/cpfuhelv";
import yichangtixing from "@/js/Q102/modules/runs/zhiliang/yichangtixing";

export default function () {
    const box = this.svg.querySelector('#zhiliang');

    // 缺陷改判率
    quexian(box);
    // C极品率

    // cp符合率
    cpfuhelv(box);

    // 异常提醒
    yichangtixing(box);

}