import {$svg} from "../common/init";
import {zhuZhuangTu} from "../common/myechars";
import {getArr, getTd, Q_QArr} from "../common/common";

export default function () {
    // 数据处理
    const data = (function () {  
        const list1 = getArr('report1','A45');
        const list2 = getArr('report1','B45');
        const list3 = getArr('report1','C45');
    
        function unique (arr) {
            return Array.from(new Set(arr))
          }
        const stock_list = unique(list1);
        let data  = new Array();
        // 初始化stock_list
        for(var i = 0; i < stock_list.length; i++){
            data[stock_list[i]] = [0,0,0];
        }
        // 赋值
        list2.forEach((value,index)=>{
            let unit;
            switch(list3[index]){
                case "无取向一轧程": unit = 0; data[list1[index]][unit] = value; break;
                case "无取向二轧程": unit = 1; data[list1[index]][unit] = value; break;
                case "取向": unit = 2; data[list1[index]][unit] = value; break;
            }
        })
        let data_copy = new Array();
        for(var i = 0; i < stock_list.length; i++){
            data_copy[i] = data[stock_list[i]];
        }
        return data_copy;
    })();
    // 库区列表
    const stock_list = (function () {  
        const list1 = getArr('report1','A45');
        const list2 = getArr('report1','B45');
        const list3 = getArr('report1','C45');
    
        function unique (arr) {
            return Array.from(new Set(arr))
          }
        return(unique(list1));
    })();

    zhuZhuangTu({
        width:763,
        height:459.29,
        color:['#036EB8','#2EA7E0','#9FA0A0'],
        x:2183.64,
        y:719.129,
        data:data,
        order1:stock_list,
        order2: ['无取向一轧程','无取向二轧程','取向'],
        $ele: $svg.find('#kuqu'),
        margin:0.3,
        textY:779.3438
    });

}