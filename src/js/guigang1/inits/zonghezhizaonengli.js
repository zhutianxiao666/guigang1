import {getData, textAlign} from "@/js/common/common";

export default function () {
    const circles = this.svg.querySelectorAll('#zonghezhizao .in,#zonghezhizao .out');
    const list = this.svg.querySelector('[class^="ability_"]');
    const text = this.svg.querySelector('#ability_Q300');
    text.innerHTML = getData('report1','A42') || '0%';
    textAlign($(text));
    let _index = 0;

    const style = document.createElement('style');
    const styleArr = [];
    for (let i = 0 ;i < 6;i++) {
        circles[i].classList.add('move_'+i);
        styleArr.push(`
@keyframes ${'move_'+i} {
    from{
        transform: rotate(0);
        transform-origin: 3503px 410px;
    }
    to{
        transform: rotate(360deg);
        transform-origin: 3503px 410px;
    }
}
${'.move_'+i} {
    animation: ${'move_'+i} ${5 + i * 0.3}s infinite linear;
}
`);
    };
    style.innerHTML = styleArr.join('');
    document.querySelector('head').appendChild(style);

    // this.animations.push(function () {
    //     _index++;
    //     [...circles].forEach((circle,index) => {
    //         circle.setAttribute('transform','rotate('+(_index * (1 + index * 0.1))+' 3503.13,410.45)');
    //     })
    // });
}