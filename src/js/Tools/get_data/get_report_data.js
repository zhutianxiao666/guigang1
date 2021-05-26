const reportObj = {
    REPORT1: document.querySelector(`div[widgetname="REPORT1"]`)
};
function get_report(reportName) {
    reportName = reportName.toUpperCase();
    let box = reportObj[reportName];
    if (!box) {
        box = document.querySelector(`div[widgetname="${reportName}"]`);
        reportObj[reportName] = box;
    };
    return box;

}
function get_td(tdId,selector = 'REPORT1') {
    const type = typeof selector;
    switch (type) {
        case "string":
            selector = get_report(selector);
            break;
        case "object":
            selector = selector;
            break;
    };
    return selector.querySelector(`td[id^=${tdId.toUpperCase()}-0-]`)
};
function get_data(tdId,selector = 'REPORT1') {
    return get_td(tdId,selector).innerText;
};
function get_arr(tdId,selector = 'REPORT1') {
    return get_data(tdId,selector).split(',');
};
function Q_QArr(tdId,selector) {

    let data;
    if (!!selector) {
        data = get_data(tdId,selector);
    }else {
        data = tdId;
    };

    data = data.split('-*-,');
    const len = data.length - 1;
    data[len] = data[len].replace('-*-','');
    return data.reduce((arr,value) => {
        if (value.trim().length == 0) {
            return arr
        }
        arr.push(value.split('Q_Q'));
        return arr
    },[]);
}
const getData = {
    get_td,
    get_data,
    get_arr,
    Q_QArr
};

export default getData