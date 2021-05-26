import '@/css/yingguangtiao.css';
import {yingguangtiao} from './common/myechars';
import {getTd} from "@/js/common/common";

setTimeout(function () {
    yingguangtiao({
        data:75,
        position: 'out',
        color:'yellow',
        $ele:getTd('report0','B1').find('.yingguangbao')
    });
},300)





window.f1= function () {
    const script = document.createElement('script');
    script.src = 'http://10.70.16.168:37799/webroot/help/svg/js/guigang1.js?id=' + Math.random();
    document.querySelector('body').appendChild(script);
}