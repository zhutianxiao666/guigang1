
import '../css/main.styl'
import changeSize from "../js/init/changeSize";
import drawSvg from "@/projects/gantetu/js/drawSvg/drawSvg";




// 初始化尺寸
changeSize();
// 甘特图显示
drawSvg();
const obj = {
    name:'ztx'
}
Object.defineProperty(obj,'name',{
    get() {
        console.log(this);
        return 'zzz'
    }
});
console.log(obj.name);