export default function () {
    // 获取svg
    this.svg = this.ele.querySelector('embed').getSVGDocument().querySelector("svg");
    // 创建容器元素
    this.content = $('<div style="position:absolute;width: 100%;height: 100%;left: 0;top: 0;background-color: #cccccc" id="contentBox"></div>')[0];
    this.content.append(this.svg);
    document.querySelector('body').appendChild(this.content);
};