import {changeText} from "../common/myechars";
import {$svg} from "../common/init";
import mingxi from "../common/mingxi";
import {getUnitCode} from "../common/common";
import jiangsu from "@/js/Q518/shebei/jiangsu";

export default function () {
    const unit_code= getUnitCode('Q518');
    // 停机次数
    changeText({$ele:'#zhengtitingjicishu',reportName:'report1',tdId:'A43',length:0,type:'number'});
    // 停机时间
    changeText({$ele:'#zhengtitingjishijian',reportName:'report1',tdId:'B43',length:0,type:'number'});
    // 故障停机次数
    changeText({$ele:'#guzhangtingjicishu',reportName:'report1',tdId:'A46',length:0,type:'number'});
    // 故障停机时间
    changeText({$ele:'#guzhangtingjishijian',reportName:'report1',tdId:'B46',length:0,type:'number'});
    // 停机
    $svg.find('#tingjicishu_1_').click(function () {
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
AND UNIT_CODE = '${unit_code}'
AND SD_DESCRIPTION = '成品卷停机'`,
            order:[1,1,1,1,1,1,1,1,1,1,1],
            title:['机组代码','停机开始','停机结束','小计','简述','原因简述','停机类型','停机时间','专业属性','序号','备用时间'],
            width:150
        });
    });
    // 明细按钮
    $svg.find('#tingji .mingxi').click(function () {
        mingxi({
            system:'DBPRODE7',
            // AND A.LEVEL = '5'
            sqlStr:`
select item from 
(select 
A.MAT_NO ||'Q_Q'|| 
B.PROD_END_TIME ||'Q_Q'|| 
B.SG_SIGN ||'Q_Q'|| 
DECODE(B.SHIFT_GROUP,'A','甲','B','乙','C','丙','D','丁') ||'Q_Q'||
DECODE(B.SHIFT_NO,'2','白班','1','夜班','')||'Q_Q'||
A.JUDGE_RULE_VALUE||'Q_Q'||
(CASE WHEN A.JUDGE_RULE_VALUE = '0.0' THEN '停机'
      WHEN A.JUDGE_RULE_VALUE > '0.0' THEN '降速'
      ELSE '无实绩值' END) ||'-*-' item ,
      (CASE WHEN A.JUDGE_RULE_VALUE = '0.0' THEN '停机'
      WHEN A.JUDGE_RULE_VALUE > '0.0' THEN '降速'
      ELSE '无实绩值' END) as 类型,
     B.PROD_END_TIME 
from IMSIJ4.TIMSIJ4LG A,MMSIJ4.TMMSIJ402 B 
where (A.JUDGE_RULE_CODE = 'Q518001_G1-1' or  A.JUDGE_RULE_CODE = 'Q518001_A0')
AND A.RESULT_CODE='0' 
AND A.LEVEL = '5'
AND A.UNIT_CODE = '${unit_code}' 
AND A.MAT_NO = B.OUT_MAT_NO 
AND A.UNIT_CODE = B.UNIT_CODE 
AND B.PROD_END_TIME > to_char(last_day(sysdate - 1 month),'yyyymmdd' )||'220000')
order by 类型,PROD_END_TIME`,

            order:[1,1,1,1,1,1,1],
            title:['材料号','时间','牌号','班组','班次','实际值','类型'],
            width:100
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
WHERE UNIT_CODE = '${unit_code}'
AND SD_TYPE IN ('3','4')
   AND SUBSTR (SD_DATE, 1, 6) = to_char(current date,'yyyymm')`,
            order:[1,1,1,1,1,1,1,1,1,1,1],
            title:['机组代码','停机开始','停机结束','小计','简述','原因简述','停机类型','停机时间','专业属性','序号','备用时间'],
            width:150
        });
    })
    // 降速
    jiangsu();

};