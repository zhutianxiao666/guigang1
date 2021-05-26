import {getTd, getUnitCode, textCenter} from "../common/common";
import {$svg} from "../common/init";
import mingxi from "../common/mingxi";

export default function () {
    // 整体
    const zhengtitimes = getTd('report1','B37').text();
    const zhengtitotal = getTd('report1','C37').text();
    $svg.find('#zhengtitingji_times').text(Number(zhengtitimes));
    $svg.find('#zhengtitingji_total').text(Number(zhengtitotal));
    // 故障
    const guzhangtimes = getTd('report1','B37').text();
    const guzhangtotal = getTd('report1','C37').text();
    $svg.find('#guzhangtingji_times').text(Number(guzhangtimes));
    $svg.find('#guzhangtingji_total').text(Number(guzhangtotal));
    // 停机明细
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
AND UNIT_CODE = '${getUnitCode('Q403')}'
AND SD_DESCRIPTION = '成品卷停机'`,
            order:[1,1,1,1,1,1,1,1,1,1,1],
            title:['机组代码','停机开始','停机结束','小计','简述','原因简述','停机类型','停机时间','专业属性','序号','备用时间'],
            width:150
        });
    });
};