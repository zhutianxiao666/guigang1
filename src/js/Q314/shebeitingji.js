import {changeText} from "../common/myechars";
import {$svg} from "../common/init";
import mingxi from "@/js/common/mingxi";



export default function () {
    // 停机次数
    changeText({$ele:'#tingjicishu_1_ .text',reportName:'report1',tdId:'A57',length:0,type:'number'});
    // 停机时间
    changeText({$ele:'#tingjishijian_1_',reportName:'report1',tdId:'B57',length:0,type:'number'});
    // 故障停机次数
    changeText({$ele:'#guzhangshijian_1_ .top',reportName:'report1',tdId:'A60',length:0,type:'number'});
    // 故障停机时间
    changeText({$ele:'#guzhangshijian_1_ .bottom',reportName:'report1',tdId:'B60',length:0,type:'number'});

    $svg.find('#tingji .mingxi').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`
SELECT
unit_code||'Q_Q'||
sd_start||'Q_Q'||
sd_end||'Q_Q'||
subtotal||'Q_Q'||
sd_description||'Q_Q'||
rs_description||'Q_Q'||
sd_type||'Q_Q'||
sd_time||'Q_Q'||
attribute||'Q_Q'||
id||'Q_Q'||
spare_time_1||'-*-' as 明细
FROM ttmsij4ps
WHERE SUBSTR(SD_DATE,1,6) = to_char(current date,'yyyymm')
AND UNIT_CODE = 'Q314'
AND SD_DESCRIPTION IN ('成品卷停机', '过渡卷停机')`,
            order:[1,1,1,1,1,1,1,1,1,1,1],
            title:['机组代码','停机开始','停机结束','小计','简述','原因简述','停机类型','停机时间','专业属性','序号','备用时间'],
            width:150
        });
    });
    $svg.find('#guzhangshijian_1_').click(function () {
        mingxi({
            system:'DBPRODE7',
            sqlStr:`
SELECT
unit_code||'Q_Q'||
sd_start||'Q_Q'||
sd_end||'Q_Q'||
subtotal||'Q_Q'||
sd_description||'Q_Q'||
rs_description||'Q_Q'||
sd_type||'Q_Q'||
sd_time||'Q_Q'||
attribute||'Q_Q'||
id||'Q_Q'||
spare_time_1||'-*-' as 明细
FROM ttmsij4pe
WHERE UNIT_CODE = 'Q314'
AND SD_TYPE IN ('3','4')
AND SUBSTR (SD_DATE, 1, 6) = to_char(current date,'yyyymm')
AND SD_DESCRIPTION != '断带'`,
            order:[1,1,1,1,1,1,1,1,1,1,1],
            title:['机组代码','停机开始','停机结束','小计','简述','原因简述','停机类型','停机时间','专业属性','序号','备用时间'],
            width:150
        });
    })
};