import {init} from "./common/init";
import production from "./Q161/production";


init({reportName:'report0',id:'Q161',tdId:'A1'});
const width = $('#changeText')[0].getBBox().width;


let times = 0;
(function () {
    let timer = setInterval(function () {
        times++;
        if (width != $('#changeText')[0].getBBox().width || times > 20) {
            clearInterval(timer);
        }else {
            return;
        };
        // 生产
        production();
    },30);
})();