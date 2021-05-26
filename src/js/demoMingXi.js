import {Q_QArr,getData} from "./common/common";
import './MingXi/css/a1.css';
import init from './MingXi/init';
import showData from "./MingXi/showData";

let timer;
let times = 0;
timer = setInterval(function () {
    times++;
    const data = Q_QArr(getData('report0','A2'));
    if (data.length == 0 && times < 10) {
        return;
    };
    clearInterval(timer);
    // 初始化
    init();
    // 渲染数据
    showData(data);
},500)