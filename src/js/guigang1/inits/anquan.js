import { getData} from "@/js/common/common";

export default function () {
    const me = this;
    const svg = this.svg;
    const data = getData('report1','A19').trim().replace('检查信息','<tspan fill="#F29600" font-size="40" font-weight="900">检查信息</tspan>').replace('公司安全信息','<tspan fill="#F29600" font-size="40" font-weight="900">公司安全信息</tspan>').replace('动火预报','<tspan fill="#F29600" font-size="40" font-weight="900">动火预报</tspan>').replace('高危预报','<tspan fill="#F29600" font-size="40" font-weight="900">高危预报</tspan>');
    const text = svg.querySelector('#anquan_2_ .move_anquan');
    text.innerHTML = data;
    const width = text.getBBox().width;
    const style = document.createElement('style');

    style.innerHTML = `
@keyframes move_anquan {
    from {
        transform: translateX(0);
    }
    to {
        transform: translateX(-${width}px);
    }
}
@keyframes move_anquan_2 {
    from {
        transform: translateX(0);
    }
    to {
        transform: translateX(${width}px);
    }
}
.move_anquan {
    animation: move_anquan ${parseInt(width/120)}s infinite linear;
}
#anquan_3_ {
    animation: move_anquan_2 ${parseInt(width/120)}s infinite linear;
}
#anquan_1_:hover #anquan_3_,
#anquan_1_:hover .move_anquan {
    animation-play-state: paused;
}
`;
    document.querySelector('head').appendChild(style);
}