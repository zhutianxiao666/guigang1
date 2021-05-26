import fangdou from "@/js/common/commons/fangdou";
import initSize from "./initSize";
import getContentSize from "@/projects/gantetu/js/init/getContentSize";
export default function () {
    // 容器宽高
    let contentSize = getContentSize();
    Object.keys(contentSize).forEach(key => {
        Object.defineProperty(contentSize,key,{
            get() {

            }
        })
    })
    // 初始化
    initSize(contentSize);
    // 调整页面尺寸
    window.onresize = fangdou(() => {
        contentSize = getContentSize()
        initSize(contentSize);
    },300);

    // Object.defineProperty(contentSize)
}