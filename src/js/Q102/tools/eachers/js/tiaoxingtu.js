
// 机组画面所使用的条形图。
/*
* 数据结构为
* [
*   data1,data2
* ]
* */
export const tiaoXinTu_2 = function ({x,ele,data,width,shift_group,length}) {
    const $ele = ele instanceof jQuery ? ele : $(ele);
    // 获取元素
    data = data.map(function (value) {
        value *= 1;
        if (value < 0 ) {
            return 0
        }else {
            return value
        }
    });
    // 求最大值
    const max = Math.max(...data) == 0 ? 100 : Math.max(...data);
    // 循环数组渲染数据
    data.forEach((value,index) => {
        value = (value && value * 1) ? value * 1 : 0;
        // 控制柱子宽度
        $ele.find(`.rect[data-index="${index}"]`).attr('width',max == 0 ? 0 : value / max * width);
        // 控制数字
        $ele.find(`.num[data-index="${index}"]`).text(Number(value).toFixed(length || 2)).attr('x', max == 0 ? x * 1 + 20 : x * 1 + value / max * width + 20);

    });
    // 修改班组
    let str = '';
    if (!shift_group) return;
    switch (shift_group.toUpperCase()) {
        case "A":
            str = '甲';
            break;
        case 'B':
            str = '乙';
            break;
        case 'C':
            str = '丙';
            break;
        case 'D':
            str = '丁';
            break;
    }
    $ele.find('.shift_group').text(str);
};

