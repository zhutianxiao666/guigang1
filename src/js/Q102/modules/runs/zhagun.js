import {getData} from "@/js/common/common";

export default function () {
    const box = this.svg.querySelector('#zhagunzhouqiqushi');
    box.querySelector('.x_max').innerHTML =     isNaN(parseInt(getData('report1','B50'))) ? '0' : parseInt(getData('report1','B50'));
    box.querySelector('.x_avg').innerHTML =     isNaN(parseInt(getData('report1','B51'))) ? '0' : parseInt(getData('report1','B51'));
    box.querySelector('.x_max_pre').innerHTML = isNaN(parseInt(getData('report1','B52'))) ? '0' : parseInt(getData('report1','B52'));
    box.querySelector('.x_avg_pre').innerHTML = isNaN(parseInt(getData('report1','B53'))) ? '0' : parseInt(getData('report1','B53'));
    box.querySelector('.x_max_h').innerHTML =   isNaN(parseInt(getData('report1','B54'))) ? '0' : parseInt(getData('report1','B54'));
    box.querySelector('.x_avg_h').innerHTML =   isNaN(parseInt(getData('report1','B55'))) ? '0' : parseInt(getData('report1','B55'));
    box.querySelector('.x_now').innerHTML =     isNaN(parseInt(getData('report1','B56'))) ? '0' : parseInt(getData('report1','B56'));

    box.querySelector('.y_max').innerHTML =     isNaN(parseInt(getData('report1','C50'))) ? '0' : parseInt(getData('report1','C50'));
    box.querySelector('.y_avg').innerHTML =     isNaN(parseInt(getData('report1','C51'))) ? '0' : parseInt(getData('report1','C51'));
    box.querySelector('.y_max_pre').innerHTML = isNaN(parseInt(getData('report1','C52'))) ? '0' : parseInt(getData('report1','C52'));
    box.querySelector('.y_avg_pre').innerHTML = isNaN(parseInt(getData('report1','C53'))) ? '0' : parseInt(getData('report1','C53'));
    box.querySelector('.y_max_h').innerHTML =   isNaN(parseInt(getData('report1','C54'))) ? '0' : parseInt(getData('report1','C54'));
    box.querySelector('.y_avg_h').innerHTML =   isNaN(parseInt(getData('report1','C55'))) ? '0' : parseInt(getData('report1','C55'));
    box.querySelector('.y_now').innerHTML =     isNaN(parseInt(getData('report1','C56'))) ? '0' : parseInt(getData('report1','C56'));

    box.querySelector('.z_max').innerHTML =     isNaN(parseInt(getData('report1','D50'))) ? '0' : parseInt(getData('report1','D50'));
    box.querySelector('.z_avg').innerHTML =     isNaN(parseInt(getData('report1','D51'))) ? '0' : parseInt(getData('report1','D51'));
    box.querySelector('.z_max_pre').innerHTML = isNaN(parseInt(getData('report1','D52'))) ? '0' : parseInt(getData('report1','D52'));
    box.querySelector('.z_avg_pre').innerHTML = isNaN(parseInt(getData('report1','D53'))) ? '0' : parseInt(getData('report1','D53'));
    box.querySelector('.z_max_h').innerHTML =   isNaN(parseInt(getData('report1','D54'))) ? '0' : parseInt(getData('report1','D54'));
    box.querySelector('.z_avg_h').innerHTML =   isNaN(parseInt(getData('report1','D55'))) ? '0' : parseInt(getData('report1','D55'));
    box.querySelector('.z_now').innerHTML =     isNaN(parseInt(getData('report1','D56'))) ? '0' : parseInt(getData('report1','D56'));
}