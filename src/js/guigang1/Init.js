// 防抖函数
import fangdou from "@/js/common/commons/fangdou";
// 改变尺寸
import changeSize from "@/js/guigang1/inits/changeSize";
// 生产
import production from "./inits/production";
// 质量
import quality from "@/js/guigang1/inits/quality";
// 成本
import cost from "@/js/guigang1/inits/cost";
// 设备
import equipment from "@/js/guigang1/inits/equipment";
// 环保
import protection from "@/js/guigang1/inits/protection";
// 库存
import stock from "@/js/guigang1/inits/stock";
// 综合制造能力
import zonghezhizaonengli from "@/js/guigang1/inits/zonghezhizaonengli";
// 累计产量
import chanliang from "@/js/guigang1/inits/chanliang";
// 机组停检修
import unit_state from "@/js/guigang1/inits/unit_state";
// 碳排放
import tanpaifang from "@/js/guigang1/inits/tanpaifang";
// 中心区域
import gongchang from "@/js/guigang1/inits/gongchang";
// 动画效果
import animation from "@/js/guigang1/inits/animation";
// 安全
import anquan from "@/js/guigang1/inits/anquan";

// 按照区域绑定数据
class Init {
    constructor(that) {
        this._this = that;
        this.svg = that.svg;
        this.ele = {};
        this.data = {};
        this._data= {};
        this.animations = [];
        this.order_by = ['H050','C302','Q101','Q102','Q202','Q302','Q116','Q216'];
        this.init();
    };
    init() {
        // svg尺寸

        window.onresize = fangdou(() => {
            this.changeSize();
        },300);

        this.changeSize();
        // 产量
        this.production();
        // 质量
        this.quality();
        // 成本能源信息
        this.cost();
        // 设备信息
        this.equipment();
        // 环保信息
        this.protection();
        // 库存信息
        this.stock();
        // 综合制造能力
        this.zonghezhizaonengli();
        // 累计实际产量
        this.chanliang();
        // 碳排放
        this.tanpaifang();
        // 机组检修停机
        this.unit_state();

        // 工厂
        this.gongchang();
        // 安全
        this.anquan();
        // 动画效果
        this.animation();

    };
    changeSize = changeSize;
    production = production;
    quality = quality;
    cost = cost;
    equipment = equipment;
    protection = protection;
    stock = stock;
    zonghezhizaonengli = zonghezhizaonengli;
    chanliang = chanliang;
    unit_state = unit_state;
    tanpaifang = tanpaifang;
    gongchang = gongchang;
    animation = animation;
    anquan = anquan;

}
export default Init