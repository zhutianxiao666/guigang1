import chanliang from "../runs/shengchan/chanliang";
import chixunyunxing from "../runs/shengchan/chixunyunxing";

export default function () {
    const box = this.svg.querySelector('#shengchan')
    chanliang(box);
    chixunyunxing(box);
}