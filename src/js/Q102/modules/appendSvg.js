export default function () {
    // const me = this;
    const svg = this.svg;
    const content = $('<div style="position:absolute;width: 100%;height: 100%;left: 0;top: 0;background-color: #cccccc" id="contentBox"></div>')[0];
    content.append(svg);
    document.querySelector('body').appendChild(content);
}