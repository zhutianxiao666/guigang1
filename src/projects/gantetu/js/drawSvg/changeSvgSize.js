import {$svg,$content} from "@/projects/gantetu/js/init/getEle";

export default function () {
    $svg.attr({
        'width': $content.width(),
        'height': $content.height()
    });
}