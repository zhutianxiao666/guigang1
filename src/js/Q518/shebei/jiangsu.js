
import {$svg} from "@/js/common/init";
import mingxi from "@/js/common/mingxi";
import {getData, getUnitCode} from "@/js/common/common";

export default function () {
    // 渲染数据
    $svg.find('#jiangsucishu').text(getData('report1','A54') || 0);
    $svg.find('#jiangsushijian').text(getData('report1','B54') || 0);
    // 点击弹出明细
    $svg.find('#tingjishijian_1_').click(function () {
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
AND UNIT_CODE = '${getUnitCode('Q518')}'
AND SD_DESCRIPTION = '成品卷降速'`,
        order:[1,1,1,1,1,1,1,1,1,1,1],
        title:['机组代码','停机开始','停机结束','小计','简述','原因简述','停机类型','停机时间','专业属性','序号','备用时间'],
        width:150
    });
    });

}