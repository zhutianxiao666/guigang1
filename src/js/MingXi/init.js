export default function () {
    const td = $('div[widgetname="REPORT0"] td[id^="A1-0-"]');
    const content = td.find('#content');
    content.css({
        width:td.width(),
        height:td.height()
    });
};
