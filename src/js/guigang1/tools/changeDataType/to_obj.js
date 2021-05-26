import {Q_QArr} from "@/js/common/common";
/*
* 传入数据为string
* 粗加工后的为数组
* 返回的数据结构为
* {
*   key0:value0,
*   key1:value1,
*   key2:value2
* }
* */
export function get_obj(data) {
    data = Q_QArr(data);
    const obj = {};
    data.forEach(value => {
        obj[value[0]] = value[1]
    });
    return obj
};

export function get_deepObj(arr) {
    arr = typeof arr == 'string' ? Q_QArr(arr) : arr;
    const obj = {}
    arr.forEach(list => {
        let littleObj = obj;
        const littleList = list.slice(0,list.length - 1);
        const length = littleList.length - 1
        littleList.forEach((item,index) => {
            if (index == length) {
                littleObj[list[index]] = list[index + 1]
            } else {
                if (!littleObj.hasOwnProperty(item)) {
                    littleObj[item] = {};
                };
                littleObj = littleObj[item];
            }
        });

    });
    return obj
}