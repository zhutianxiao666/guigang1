


function GetData() {
    this.list = [document.querySelector(`div[widgetname="REPORT1"]]`)];
};
// 检查有没有改元素
function getWidgetname(obj,selector) {
    let ele = obj.list.find(ele => {
        return ele.getAttribute('widgetname') == selector
    });
    if (!ele) {
        ele = document.querySelector(`div[widgetname="${selector}"]]`);
        obj.list.push(ele);
    };
    return ele;
};

GetData.prototype.get_data = function (tdId,selector = 0) {
    let box;
    if (typeof selector == "string") {
        box = getWidgetname(this,selector);
    }else if (typeof selector == "number") {
        box = this.list[selector];
    };
    return box.querySelector(`td[id^="${tdId.toUpperCase()}"]`).innerText
};
GetData.prototype.get_arr = function (tdId,selector = 0) {
    const data = this.get_data(tdId,selector);
    return data.split(',');
};
GetData.prototype.Q_Q_arr = function (...args) {
    const length = args.length;
    let data;
    if (length == 2) {
        data = this.get_data(...args).split('-*-,');
    }else if (length == 1) {
        data = args[0].split('-*-,');
    }else {
        console.log('Q_QArr传参有误');
        return;
    };
    const  len = data.length - 1;
    return data.reduce((arr,value,index) => {
        if (index == len) {
            value = value.replace('-*-','');
        };
        arr.push(value.split('Q_Q'));
        return arr;
    },[]);
}



