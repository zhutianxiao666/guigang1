// 1 将svg添加到容器中
// 2 对svg元素绑定数据 事件监听
// 3 将克隆的元素再添加到容器中。
import '@babel/polyfill';
import apppendSvg from "@/js/guigang1/appendSvg/apppendSvg";
import Init from "@/js/guigang1/Init";




class Main {
    // 如果用到class 则建议参考webpack中的rules内容
    // ele 为td容器就可以
    constructor(ele) {
        // 声明变量----------------------------------
        // 传递进来的ele
        this.ele = ele;
        // 原始的svg
        this.svg = null;
        // 容器
        this.content = null;
        // 1.克隆元素,并删除原来的svg--------------------------
        /*
        * 此时 应该已经有cloneSvg元素
        * init只处理cloneSvg
        * */
        this.init();
        // 3 将虚拟dom绑定到元素中

    };
    init() {
        // 1 移动svg
        this.appendSvg();
        // 2 渲染数据 绑定事件
        new Init(this);
    };
    appendSvg = apppendSvg;

}

new Main(document.querySelector('div[widgetname="REPORT0"] td[id^="A1-0-"]'))
