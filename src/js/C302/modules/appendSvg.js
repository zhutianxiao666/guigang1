

export default function () {
    console.log('ok')
    const svg = this.svg;
    const content = $('<div style="position:absolute;width: 100%;height: 100%;left: 0;top: 0;background-color: #dddddd" id="contentBox"></div>')[0];
    content.append(svg);
    document.querySelector('body').appendChild(content);
}