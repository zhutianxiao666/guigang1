<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="10.0.0">
<TableDataMap>
<TableData name="库存" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[硅钢L3]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT e.*, 
nvl(f.过渡卷,0) 过渡卷,
e.机组1||'Q_Q'||e.Q018||'Q_Q'||nvl(f.过渡卷,0)||'-*-' as 库存
  FROM    (SELECT c.*, nvl(d.Q018,0) Q018
             FROM    (SELECT a.*, nvl(b.机组1,0) 机组1
                        FROM    (SELECT total_wt 总量, stock_no
                                   FROM tmmtarg
                                  WHERE stock_no IN ('Q60','Q51','Q52','Q07','Q52','Q80','Q81')) a
                             LEFT JOIN
                                (SELECT sum (mat_act_wt) / 1000 AS 机组1,
                                        stock_no
                                   FROM tmmcr01
                                  WHERE     DUMMY_COIL_FLAG = '0'     --${UNIT_CODE}
                                        AND next_unit_no = '${UNIT_CODE}'
                                        AND stock_no IN ('Q60','Q51','Q52','Q07','Q52','Q80','Q81')
                                 GROUP BY stock_no) b
                             ON a.stock_no = b.stock_no) c
                  LEFT JOIN
                     (SELECT sum (mat_act_wt) / 1000 AS Q018, stock_no
                        FROM tmmcr01
                       WHERE     DUMMY_COIL_FLAG = '0'                --Q018
                             AND next_unit_no = 'Q018'
                             AND stock_no IN ('Q60','Q51','Q52','Q07','Q52','Q80','Q81')
                      GROUP BY stock_no) d
                  ON c.stock_no = d.stock_no) e
       LEFT JOIN
          (SELECT sum (mat_act_wt) / 1000 AS 过渡卷, stock_no
             FROM tmmcr01
            WHERE     DUMMY_COIL_FLAG <> '0'                           --过渡卷
                  AND next_unit_no IN ('${UNIT_CODE}','Q518', 'Q018')
                  AND stock_no IN ('Q60','Q51','Q52','Q07','Q52','Q80','Q81')
           GROUP BY stock_no) f
       ON e.stock_no = f.stock_no]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="缺陷改判率" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit_code"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select item_ename,item_value from TIMSIJ4GS
where unit_code = '${unit_code}'
and item_ename in ('JUDGE_RATE_D_IH' , 'JUDGE_RATE_M_IH')
and date in (
  select max(date) from TIMSIJ4GS
  where unit_code = '${unit_code}'
  and item_ename in ('JUDGE_RATE_D_IH' , 'JUDGE_RATE_M_IH')
  group by item_ename
)]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="现货发生率" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit_code"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select item_ename,item_value from TIMSIJ4GS
where unit_code = '${unit_code}'
and item_ename in ('HAPPEN_RATE_D' , 'HAPPEN_RATE_M')
and date in (
  select max(date) from TIMSIJ4GS
  where unit_code = '${unit_code}'
  and item_ename in ('HAPPEN_RATE_D' , 'HAPPEN_RATE_M')
  group by item_ename
)]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="成材率" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select shift_no,shift_group,item_value,item_ename,date from TIMSIJ4GT
where item_ename in  ('OUTPUT_RATE_GROUP_M','OUTPUT_RATE_GROUP_D')
and DATE in
(
  select max(date) from TIMSIJ4GT
  where  unit_code = '${UNIT_CODE}'
  and item_ename in ('OUTPUT_RATE_GROUP_M','OUTPUT_RATE_GROUP_D')
  group by item_ename
)
and UNIT_CODE = '${UNIT_CODE}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="总产量" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select date,
  cast(item_value_n /1000 as decimal(15,2)) item_value_n ,
  item_ename
from TIMSIJ4GS
where UNIT_CODE = '${UNIT_CODE}'
and item_ename in ('PROD_M','PROD_D')
and date in (
  (
    select max(date) 
    from TIMSIJ4GS
    where unit_code = '${UNIT_CODE}'
    and item_ename in ('PROD_M','PROD_D')
    group by item_ename
  )
)
order by ITEM_ENAME]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="来料异常" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select plan_no||'Q_Q'||in_mat_no||'Q_Q'||out_mat_no||'Q_Q'||hold_code||'-*-' as 来料异常  from IMSIJ4.TIMSIJ4GC
where UNIT_CODE='${UNIT_CODE}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="特殊需求" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[硅钢L3]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT A.PLAN_NO||'Q_Q'||
       B.UNIT_SEQ_NO||'Q_Q'||
       A.IN_MAT_NO||'-*-' 特殊需求
  FROM TPSQ318 A,TPSM318 B
 WHERE     A.UNIT_NO = 'Q318'
       AND A.TRACK_STATUS >= '8'
       AND A.IN_MAT_NO = B.IN_MAT_NO
       AND (A.SPECIAL_INST_DESC <> ' ' OR A.TEST_ADD_DESC <> ' ' OR A.ORDER_SPECIAL <> ' ')
ORDER BY UNIT_SEQ_NO]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="cp符合率早晚班" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit_code"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select 
case A.SHIFT_GROUP when 'A' then '甲'
when 'B' then '乙'
when 'C' then '丙'
when 'D' then '丁'
end 班组,
A.SHIFT_NO,
A.ITEM_VALUE AS ITEM_VALUE_D,
B.ITEM_VALUE AS ITEM_VALUE_M
from TIMSIJ4GT A ,TIMSIJ4GT B

where A.ITEM_ENAME  = 'CP_FIX_RATE_GROUP_D'
and B.ITEM_ENAME = 'CP_FIX_RATE_GROUP_M'
and A.UNIT_CODE = B.UNIT_CODE 
and A.SHIFT_GROUP = B.SHIFT_GROUP
and A.date = (
  select max(date) from TIMSIJ4GT
  where ITEM_ENAME  = 'CP_FIX_RATE_GROUP_D'
  and unit_code = '${unit_code}'
)
and B.date = (
  select max(date) from TIMSIJ4GT
  where ITEM_ENAME  = 'CP_FIX_RATE_GROUP_M'
  and unit_code = '${unit_code}'
)
and A.UNIT_CODE = '${unit_code}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="产量早晚班" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q318]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select t1.SHIFT_NO,
t1.SHIFT_GROUP,
t1.ITEM_VALUE_N 日数据,
t2.ITEM_VALUE_N 月数据
from 
(select date,
shift_no,
shift_group,
cast(item_value_n /1000 as decimal(15,2)) item_value_n ,
item_ename
from TIMSIJ4GT
where unit_code = '${UNIT_CODE}'
and item_ename = 'PROD_GROUP_D'
and date = (
  select max(date) from TIMSIJ4GT
  where item_ename = 'PROD_GROUP_D'
  and unit_code = '${UNIT_CODE}'
)) t1,
(select date,
shift_no,
shift_group,
cast(item_value_n /1000 as decimal(15,2)) item_value_n ,
item_ename
from TIMSIJ4GT
where unit_code = '${UNIT_CODE}'
and item_ename = 'PROD_GROUP_M'
and date = (
  select max(date) from TIMSIJ4GT
  where item_ename = 'PROD_GROUP_M'
  and unit_code = '${UNIT_CODE}'
)) t2
where t1.SHIFT_GROUP = t2.SHIFT_GROUP
--and t1.SHIFT_NO = t2.SHIFT_NO
and t1.ITEM_VALUE_N > 0
order by shift_no]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="放行率放行量" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q318]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select date,item_ename,item_value from TIMSIJ4GS
where unit_code = '${UNIT_CODE}'
and item_ename in ('PASS_WT_M','PASS_WT_Y','PASS_RATE_M','PASS_RATE_Y')
and date in ((select max(date) from TIMSIJ4GS where item_ename = 'PASS_WT_M'),(select max(date) from TIMSIJ4GS where item_ename = 'PASS_WT_Y'))]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="停机" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit_code"/>
<O>
<![CDATA[Q318]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT COUNT(1) times,SUM(SUBTOTAL) total FROM ttmsij4ps 
WHERE SUBSTR(SD_DATE,1,6) = to_char(current date,'yyyymm')
AND UNIT_CODE = '${unit_code}'
AND SD_DESCRIPTION = '成品卷停机' ]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="成品计划量" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select date,item_ename,item_value/1000 item_value from IMSIJ4.TIMSIJ4GS
where ITEM_ENAME in ('FIN_PLAN_WT_M','FIN_PLAN_WT_Y')
and unit_code = '${UNIT_CODE}'
and date in ((select max(substr(date,1,4)) from IMSIJ4.TIMSIJ4GS),(select max(substr(date,1,6)) from IMSIJ4.TIMSIJ4GS))]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="月度产量完成率" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select a.item_value/10/b.item_value 比值 from
(select * from IMSIJ4.TIMSIJ4GS
where ITEM_ENAME in ('PROD_M')
and unit_code = '${UNIT_CODE}'
and DATE = (select max(date) from IMSIJ4.TIMSIJ4GS where item_ename = 'PROD_M')) a,
(select * from IMSIJ4.TIMSIJ4GS
where ITEM_ENAME in ('MONTH_PLAN_OUTPUT')
and unit_code = '${UNIT_CODE}'
and DATE = (select max(date) from IMSIJ4.TIMSIJ4GS where item_ename = 'MONTH_PLAN_OUTPUT')) b
]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="时间开动率" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select item_value from IMSIJ4.TIMSIJ4GS
where item_ename = 'OEE_M'
and unit_code = '${UNIT_CODE}'
order by date
fetch first 1 rows only]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="合同" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select item_value from IMSIJ4.TIMSIJ4GS
where item_ename = 'MONTH_ORDER_COMPLTE_RATE'
order by DATE
fetch first 1 rows only]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="返回卷" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[硅钢L3]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT cast(NVL (SUM(TO_NUMBER(PERSIST_PROD_TIME)), 0) as decimal(16,1)) item_value,'time' type
  FROM TMMQ518
 WHERE     PROD_END_TIME >= (SELECT to_char(LAST_DAY(current date - 1 months),'yyyymmdd') FROM SYSIBM.DUAL)||'200000'
       AND PROD_END_TIME <= (SELECT to_char(LAST_DAY(current date),'yyyymmdd') FROM SYSIBM.DUAL)||'200000'
       AND DUMMY_COIL_FLAG <> '0'
       
union

SELECT NVL (SUM (OUT_MAT_WT), 0)/1000 item_value,'total' type
  FROM TMMQ518
 WHERE     PROD_END_TIME >= (SELECT to_char(LAST_DAY(current date - 1 months),'yyyymmdd') FROM SYSIBM.DUAL)||'200000'
       AND PROD_END_TIME <= (SELECT to_char(LAST_DAY(current date),'yyyymmdd') FROM SYSIBM.DUAL)||'200000'
       AND DUMMY_COIL_FLAG <> '0']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="小时产量" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select sum(HOURS_PRODUCT)/2 as HOURS_PRODUCT   
FROM  BGRAGGDA.SISU_MMSI_HP 
WHERE  DATE_TIME =(select max(date_time) from BGRAGGDA.SISU_MMSI_HP where PRODUCT_UNIT_NO='${UNIT_CODE}') AND PRODUCT_UNIT_NO='${UNIT_CODE}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="速度符合率" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT (SUM(QUALIFIED_QTY)*100)/SUM(TOTAL_QTY) 速度符合率 FROM bgrasids.T_DWD_FACT_ZZSCSI_ZHPJ_CP WHERE ITEM_ID = 'CP_${UNIT_CODE}_129'
 AND PROD_MONTH = to_char(current date,'yyyymm')]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="产量日月" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q318]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT item_ename,
       CASE
          WHEN item_ename = 'MONTH_PLAN_OUTPUT' THEN item_value
          ELSE item_value / 1000
       END
          AS item_value
  FROM ( (SELECT item_ename, item_value
            FROM TIMSIJ4GS
           WHERE (item_ename = 'PROD_D' OR item_ename = 'PROD_M')
                 AND date IN
                        (SELECT max (date)
                           FROM TIMSIJ4GS
                          WHERE (item_ename = 'PROD_D'
                                 OR item_ename = 'PROD_M')
                                AND unit_code = '${UNIT_CODE}'
                         GROUP BY item_ename)
                 AND unit_code = '${UNIT_CODE}')
        UNION
        (SELECT item_ename, item_value
           FROM TIMSIJ4GS
          WHERE item_ename = 'MONTH_PLAN_OUTPUT'
                AND date IN
                       (SELECT max (date)
                          FROM TIMSIJ4GS
                         WHERE item_ename = 'PROD_M' AND unit_code = '${UNIT_CODE}')
                AND unit_code = '${UNIT_CODE}')
        UNION
        (SELECT item_ename, item_value
           FROM TIMSIJ4GT
          WHERE item_ename = 'PROD_GROUP_D2'
                AND date IN
                       (SELECT max (date)
                          FROM TIMSIJ4GT
                         WHERE item_ename = 'PROD_GROUP_D2'
                               AND unit_code = '${UNIT_CODE}')
                AND unit_code = '${UNIT_CODE}'))]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="故障停机" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit_code"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT NVL(COUNT(1),0) times,NVL(SUM(SUBTOTAL),0) total  FROM ttmsij4ps
WHERE SUBSTR(SD_DATE,1,6) = '202002' 
  AND UNIT_CODE = '${unit_code}' 
  AND SD_DESCRIPTION = '成品卷停机' 
  AND SD_TYPE IN (SELECT CODE FROM tep0002 WHERE CODE_CLASS = 'J4TM11' AND CODE_DESC_1_CONTENT = 'E')]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
</TableDataMap>
<FormMobileAttr>
<FormMobileAttr refresh="false" isUseHTML="false" isMobileOnly="false" isAdaptivePropertyAutoMatch="false" appearRefresh="false" promptWhenLeaveWithoutSubmit="false" allowDoubleClickOrZoom="true"/>
</FormMobileAttr>
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q518]]></O>
</Parameter>
<Parameter>
<Attributes name="tablea"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=if($unit_code = 'Q318','TPSQ318',
if($unit_code = 'Q518','TPSQ518','TPSQ318'))]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="tableb"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=if($unit_code = 'Q318','TPSM318',
if($unit_code = 'Q518','TPSM518','TPSM318'))]]></Attributes>
</O>
</Parameter>
</Parameters>
<Layout class="com.fr.form.ui.container.WBorderLayout">
<WidgetName name="form"/>
<WidgetAttr description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Center class="com.fr.form.ui.container.WFitLayout">
<Listener event="afterinit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="code"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$UNIT_CODE]]></Attributes>
</O>
</Parameter>
</Parameters>
<Content>
<![CDATA[window.parentSize=function(reportName,TdId){
let str='div[widgetname="'+reportName.toUpperCase()+'"]A td[id^="'+TdId+'"]A';
$(str).find('svg').attr({width: $(str).width(),height: $(str).height()}); 
}
window.svgName=function(reportName,tdId){
 return $('div[widgetname="'+reportName.toUpperCase()+'"]A td[id^="'+tdId+'" ]A svg');
}
window.tdTextNum=function(reportName,tdId){
 return Number($('div[widgetname="'+reportName.toUpperCase()+'"]A td[id^="'+tdId+'" ]A').text());
}
window.tdText=function(reportName,tdId){
 return $('div[widgetname="'+reportName.toUpperCase()+'"]A td[id^="'+tdId+'" ]A').text();
}

window.tdSize=function (reportName,tdId) {
    const node=$('div[widgetname="'+reportName.toUpperCase()+'"]A td[id*="'+tdId.toUpperCase()+'"]A');
    console.log(node.width(),node.height());
    return {
        height:node.height(),
        width:node.width()
    }
}

window.getTd=function (reportName,tdId) {
    return $('div[widgetname="'+reportName.toUpperCase()+'"]A td[id^="'+tdId.toUpperCase()+'"]A');
}
    
document.title=code+'退火图层机组可视化画面';]]></Content>
</JavaScript>
</Listener>
<WidgetName name="body"/>
<WidgetAttr description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WAbsoluteBodyLayout">
<Listener event="afterinit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="code"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$UNIT_CODE]]></Attributes>
</O>
</Parameter>
</Parameters>
<Content>
<![CDATA[document.title = '518退火图层机组可视化画面']]></Content>
</JavaScript>
</Listener>
<WidgetName name="body"/>
<WidgetAttr description="">
<MobileBookMark useBookMark="true" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report1"/>
<WidgetAttr invisible="true" description="">
<MobileBookMark useBookMark="true" bookMarkName="report1" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report1"/>
<WidgetAttr invisible="true" description="">
<MobileBookMark useBookMark="true" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[3352800,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[产量]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="0">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="1">
<O>
<![CDATA[早晚班]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="1">
<O>
<![CDATA[班组]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="1">
<O>
<![CDATA[日数据]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="1">
<O>
<![CDATA[月数据]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="1">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="1">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="1">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="1">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="1">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="产量早晚班" columnName="SHIFT_NO"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="产量早晚班" columnName="SHIFT_GROUP"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="产量早晚班" columnName="日数据"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="2" s="1">
<O t="DSColumn">
<Attributes dsName="产量早晚班" columnName="月数据"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="2">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="2">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="2">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="2">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="2">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="3">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="4">
<O>
<![CDATA[昨日总量]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="4">
<O>
<![CDATA[当月总量]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="4">
<O>
<![CDATA[当月完成率]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="4">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="4">
<O>
<![CDATA[今日晚班]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="4">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="4">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="4">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="4">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="5">
<O t="DSColumn">
<Attributes dsName="产量日月" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[PROD_D]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="5">
<O t="DSColumn">
<Attributes dsName="产量日月" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[PROD_M]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="5">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=B6/D6]]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="5">
<O t="DSColumn">
<Attributes dsName="产量日月" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[MONTH_PLAN_OUTPUT]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="5" s="2">
<O t="DSColumn">
<Attributes dsName="产量日月" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="10">
<O>
<![CDATA[PROD_GROUP_D]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="5">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="6">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="7">
<O>
<![CDATA[小时产量]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="7">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="8">
<O t="DSColumn">
<Attributes dsName="小时产量" columnName="HOURS_PRODUCT"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="8">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="9">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="10">
<O>
<![CDATA[速度符合率]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="10">
<O>
<![CDATA[时间开动率]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="10">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="10">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="10">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="10">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="10">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="10">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="10">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="11">
<O t="DSColumn">
<Attributes dsName="速度符合率" columnName="速度符合率"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="11">
<O t="DSColumn">
<Attributes dsName="时间开动率" columnName="ITEM_VALUE"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="11">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="11">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="11">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="11">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="11">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="11">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="11">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="12">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="12">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="12">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="12">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="12">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="12">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="12">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="12">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="12">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="13">
<O>
<![CDATA[返回卷时间]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="13">
<O>
<![CDATA[返回卷量]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="13">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="13">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="13">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="13">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="13">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="13">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="13">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="14">
<O t="DSColumn">
<Attributes dsName="返回卷" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[TYPE]]></CNAME>
<Compare op="10">
<O>
<![CDATA[time]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="14">
<O t="DSColumn">
<Attributes dsName="返回卷" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[TYPE]]></CNAME>
<Compare op="10">
<O>
<![CDATA[total]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="14">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="15">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="16">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="17">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="18">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="19" s="0">
<O>
<![CDATA[成材率]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="19">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="20">
<O>
<![CDATA[早班班组]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="20">
<O>
<![CDATA[日数据]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="20">
<O>
<![CDATA[月数据]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="20">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="21">
<O t="DSColumn">
<Attributes dsName="成材率" columnName="SHIFT_GROUP"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_NO]]></CNAME>
<Compare op="0">
<O>
<![CDATA[1]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="21">
<O t="DSColumn">
<Attributes dsName="成材率" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_NO]]></CNAME>
<Compare op="0">
<O>
<![CDATA[1]]></O>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_GROUP]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="21"/>
</Compare>
</Condition>
</JoinCondition>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="21">
<O t="DSColumn">
<Attributes dsName="成材率" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_GROUP]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="21"/>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[OUTPUT_RATE_GROUP_M]]></O>
</Compare>
</Condition>
</JoinCondition>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="21">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="22">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="23">
<O>
<![CDATA[晚班班组]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="23">
<O>
<![CDATA[日数据]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="23">
<O>
<![CDATA[月数据]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="23">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="24">
<O t="DSColumn">
<Attributes dsName="成材率" columnName="SHIFT_GROUP"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_NO]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="24">
<O t="DSColumn">
<Attributes dsName="成材率" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_NO]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_GROUP]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="24"/>
</Compare>
</Condition>
</JoinCondition>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="24">
<O t="DSColumn">
<Attributes dsName="成材率" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_GROUP]]></CNAME>
<Compare op="0">
<ColumnRow column="0" row="24"/>
</Compare>
</Condition>
</JoinCondition>
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[OUTPUT_RATE_GROUP_M]]></O>
</Compare>
</Condition>
</JoinCondition>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="24">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="25">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="26" s="0">
<O>
<![CDATA[质量]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="26">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="27">
<O>
<![CDATA[异常提醒]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="27">
<O>
<![CDATA[特殊要求]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="27">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="27">
<O>
<![CDATA[月放行率]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="27">
<O>
<![CDATA[月放行量]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="27">
<O>
<![CDATA[年放行率]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="27">
<O>
<![CDATA[年放行量]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="27">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="27">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="28">
<O t="DSColumn">
<Attributes dsName="来料异常" columnName="来料异常"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="28">
<O t="DSColumn">
<Attributes dsName="特殊需求" columnName="特殊需求"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="28">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="28">
<O t="DSColumn">
<Attributes dsName="放行率放行量" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[PASS_RATE_M]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="28">
<O t="DSColumn">
<Attributes dsName="放行率放行量" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[PASS_WT_M]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="28">
<O t="DSColumn">
<Attributes dsName="放行率放行量" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[PASS_RATE_Y]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="28">
<O t="DSColumn">
<Attributes dsName="放行率放行量" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[PASS_WT_Y]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="28">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="28">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="29">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="30">
<O>
<![CDATA[缺陷改判率日]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="30">
<O>
<![CDATA[缺陷改判率月]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="30">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="30">
<O>
<![CDATA[cp符合率早]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="30">
<O>
<![CDATA[日]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="30">
<O>
<![CDATA[月]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="30">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="30">
<O>
<![CDATA[日]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="30">
<O>
<![CDATA[月]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="31">
<O t="DSColumn">
<Attributes dsName="缺陷改判率" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[JUDGE_RATE_D_IH]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="31">
<O t="DSColumn">
<Attributes dsName="缺陷改判率" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[JUDGE_RATE_M_IH]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="31">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="31">
<O t="DSColumn">
<Attributes dsName="cp符合率早晚班" columnName="班组"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_NO]]></CNAME>
<Compare op="0">
<O>
<![CDATA[1]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="31">
<O t="DSColumn">
<Attributes dsName="cp符合率早晚班" columnName="ITEM_VALUE_D"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_NO]]></CNAME>
<Compare op="0">
<O>
<![CDATA[1]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="31">
<O t="DSColumn">
<Attributes dsName="cp符合率早晚班" columnName="ITEM_VALUE_M"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_NO]]></CNAME>
<Compare op="0">
<O>
<![CDATA[1]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="31">
<O t="DSColumn">
<Attributes dsName="cp符合率早晚班" columnName="班组"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_NO]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="31">
<O t="DSColumn">
<Attributes dsName="cp符合率早晚班" columnName="ITEM_VALUE_D"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_NO]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="31">
<O t="DSColumn">
<Attributes dsName="cp符合率早晚班" columnName="ITEM_VALUE_M"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[SHIFT_NO]]></CNAME>
<Compare op="0">
<O>
<![CDATA[2]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="32">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="32">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="32">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="32">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="32">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="32">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="32">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="32">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="32">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="33">
<O>
<![CDATA[现货发生率日]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="33">
<O>
<![CDATA[现货发生率月]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="33">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="33">
<O>
<![CDATA[成品计划量月]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="33">
<O>
<![CDATA[成品计划量年]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="33">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="33">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="33">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="33">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="34">
<O t="DSColumn">
<Attributes dsName="现货发生率" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[HAPPEN_RATE_D]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="34">
<O t="DSColumn">
<Attributes dsName="现货发生率" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[HAPPEN_RATE_M]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="34">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="34">
<O t="DSColumn">
<Attributes dsName="成品计划量" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[FIN_PLAN_WT_M]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="34">
<O t="DSColumn">
<Attributes dsName="成品计划量" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[FIN_PLAN_WT_Y]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="34">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="34">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="34">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="34">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="35">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="35">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="35">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="35">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="35">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="35">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="35">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="35">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="35">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="36" s="0">
<O>
<![CDATA[库存]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="36">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="36">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="36">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="36">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="36">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="36">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="36">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="36">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="37">
<O>
<![CDATA[库区号]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="37">
<O>
<![CDATA[库区数据]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="37">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="37">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="37">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="37">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="37">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="37">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="37">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="38" s="0">
<O t="DSColumn">
<Attributes dsName="库存" columnName="STOCK_NO"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="38" s="0">
<O t="DSColumn">
<Attributes dsName="库存" columnName="库存"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="38">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="3" r="38">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="4" r="38">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="5" r="38">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="6" r="38">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="7" r="38">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="8" r="38">
<PrivilegeControl/>
<CellGUIAttr adjustmode="1"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="40" s="3">
<O>
<![CDATA[设备停机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="41">
<O>
<![CDATA[停机次数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="41">
<O>
<![CDATA[停机时间]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="42">
<O t="DSColumn">
<Attributes dsName="停机" columnName="TIMES"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="42">
<O t="DSColumn">
<Attributes dsName="停机" columnName="TOTAL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="44">
<O>
<![CDATA[故障停机次数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="44">
<O>
<![CDATA[时间]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="45">
<O t="DSColumn">
<Attributes dsName="故障停机" columnName="TIMES"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="45">
<O t="DSColumn">
<Attributes dsName="故障停机" columnName="TOTAL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72" foreground="-65536"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-65536"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="1" size="72" foreground="-65536"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m9=j<P@q>EWA?DT/7WKn.uP"egQ?'SXb]A:fWAZ^b0\'4?Yd=S@aq@G$ZVAJ"dLd.sS]A!$NAr
9,ZQ3)dXQ:+/9.+MR*P-RP"(de^_KHt*C+5/f#KK">EST3dUD>B);n+WDp^A"/h425jnjHJI
i@2:GBAYGT_gS,]A#gNL0=4bmutRs0@u0;)+(c[79dEsmi[Yq>n0gbYCME5Drap.+RN@QK2rV
hUbN78A,5?5ReOdoR_/TC.%Xg64G-J/UW@`TJ`d\**5TNW.7J:?6"<G2(EP^?o[`R]AE"G)L8
<+Quc0n9_Ej_^YEOe3&eLsHHb1M8S3X;VjjNMp;i)PZWb>l$L+#sZp00'/F'Ve4nGNuL0BX0
efU)410GptP$lIqe;1.)(McD_bUc(@-Bf>Np7,6,<(5u[l%<D(+e+-1aZ4+.SL""ch\BJLP[
A7F(d^tMk)<F>$,'AjB:H2.&b-W+(G[>$/8e/'UbhENdg;Hg==q4sa8I4-3Cn`cd9N_3nQ=a
Y1?6*O?Q%gf@_S$$&r4A6XRiPbM@VsoH5)_!MKEd"95`Y#^Ao^8A8XR_.8HB3H6VElgKejm$
&0Yi,u,=Be.f3P<R_h>>,Z5_@aJuIhhO8SY7a(kfng#`QXiR)9pAA%gT]AC%Sk)U9=:]Ag\-b9
&G+Rr1M,_)5:ifdgEHke0_N4nif[_P[YS$pj?Ff]ApER@uUQNK[Q.S*+ou)6o=:Dn8/?d/)$*
kS;f9dTVL2s0)D&b%a@?W0c3NN$-5jYi7kDUN:8k.<o\+kE=gh8gZ!\CGeXiV"u[eJ!PeG"j
&It^jlQ"50KbB3NWg(N2@BKl\Fa]ADB+k9Or:H5VF"%lbZTtE&G*nukPPq)H?rc=enTBUX2i2
;W=`G@Ec8SeKbeMUp[4\goHU/^3j&uRH1rrE-j[[`n[!SE<6s=AhU.--a<ea$Sp.i2'C4kj?
@>P)'(=%[l)`\gR?@)"pUbKWQA>!R(/;u^=3pG1St8Dj*H*"K=q<':*X/sm'<+HaEpP(^hlQ
VnY!8X\jF4r73$;gBIX34!r^<jP/n#(^]A@Nq[#j*"ndmOSX[4J:rrN0!Hjj\oRK5JZYQ0E,U
Au$5u&M:""l't^IB0MJ8dPpddhlT:AeC&ig`;e.Nhl[)h'>ZV\$N>K9Zna<Wo#Lr!nAYH]A&p
9aQ2l??pXLEFML_<^PgoG@h`s&U'H,-[olD3PKrKF6=dkU&NMWSgQ'Iuqhp*JNNGchpSRsrH
a-D@hiJ@.@Y[0TN@#+.DGc18o4CPV)E6'(EQP^<39m$+t4i2(.QLN:L@Se+A/KHXJe6f7cP+
I)A]A59\X:POSmT?SY/k78T^4/<"O\_.0Aq,;.%7j$LT52ETlNc$!R(S;KFHar[qnB_;Olg8$
"rZ*A8V@**[Y`KWO@b\H&!"3Yb%V5`NXD>ie@SO_:GF6itb\:c0-hZ_jt"t([4XBs&bZ!4(]A
.g*"b6[D57^fVP']ARLS\f>0;V(cf:0n$P/V#OOr-5`ef.qJn>XCsZkkROV6Crn^S&adI5*97
ZR2?bn\J]A8kN_]A\')n<\]AW@^\s^i0PJMp3?F6@6^J!/GGdica27Z`FX8%F\tY.>BT]Ackb[)S
/gDfj=`0VN4Y,>r>^Js(A9fSphrZ*?>+5o<%/]A>dpU.0d?f:!J9Q?o'99[i2IIR=XG$_*V%k
"es^MZ)e(UQprV8_q=%eTcLt0*55?4KPFT,Kf.dO<hOljG'O/"u1:!]A/;06PH'a0J)L1OT$k
/(SHImkN+EED<shtT-i)hN"Fb/ObcLC/pKrni+!\%J\E,0.NOV:;=n!RO'@B_p^GiNQ:s9]A7
WgNS4Dn^q'p.\<b.o1e!qg!XJ9ET3C[<sZX@#T9tQDm=;n@[+7d@-Pi[%Q/bV^E[lm%5$kBm
\6Ogu1,2_:PZfU+5opW]AtsbTc'oKab&m5]A-P%ZHZSB[-Rs>p&cp3U3"'?0r=o&j=1C]At:%Wo
#?hBY'!p'jbq)_^Q^GquBB^a?GIEn#hH\\SuQ]AAg%2VVE!h`23.NfD@hfplp21V$Fr\N9>c1
1R;6=,k,^)YTmX_W5geXXDRG3Y9.,H.%8U\S\>`XSYcdTKr"n%kD7WXUVR_P"_^(TFgnDj+$
\oG0Z*@Ym2K;cP?8[fY%[5^1bJ@l2@D)b9BG2.9[dC3TcC$++DYV[Ho(p5A+<ZE@&;JoCfFT
B)UpU^#?N\:U&i!N&`-D_k#G3c<A69=UCQBgain]A6/2jOS%<q!j'ttDXB2kgVafMdgoaX7Ab
CF<0_]A2<]A0U)(?d]AhANq#Hs[D<1GW0VeH'<0]A_beEXRKoSF"\11o<'kXo2S-:Hp[)r]Au[>2H
678iU)2.:A/q+XCiLP@6(=f!<+eX<%3OlYUc/$Q;md:7<6Fb1*9XQ!>TR?VcFSYj5/6W0^<N
0e_gjR+u*&V^o#=.T3X(X*jVL$/D0aA10j<&7j=gN$0S&NRP%s0^N`@aS--hn)2d/NQ7+Vm!
Dqr>E\3ZA!^OFn/Ir*M.kY^%?30!*+o`pJkmt-ApY&Rp.W\!YB:kGk(SrhO%X1*mGQJ4dUA=
Ec,n[CnOQogAC`-i<6%U.f7JiDTDD!e<!h2)]ABA"OmO>ac9MR%i:Z$%db-$k!#C1_ZC,I`:_
SbqSTh`3K7#lqL]A5FE*An!Dj@_#Y,oS%dd_$BUUkOP;/fuMFSDJ-3r_c4]ABS%!pR$)Z5HsV"
l\_.X-p.88"1n-Dj&6fHhm`t`s*(h`H`[PQOB@Fk1$`YXla$O!#T8Yq+[8Ktnm*3Y\8QBE$P
#Lb<^>/PDL>e:_P$-JS-c'9$r,tP,Zb22CZr]Aem,sJ"Za-=gsF2-oqYI&;0h_5_iC=T'p%c/
[Del-8aq-SgsX?W%T".*)7V<"9!$HKPJk2Fh&3kAr0TJ.tXH(89/19t_X#-,XS*n+hiG%kXh
#ZMqgTiLY3%V2S2.94BHF"sSnQPM.^5d29a6Lsc"-+.e?HE`;cs'/ii61;.PVlE7XAF#'IUT
Z0>#NC/FZ(%Ia!GbS-'hD7t2n[F\VW<`^.dUPsd^^20onM!Jd$i'&?uV7mTp4E9]ApBnT+N21
A;l\EoA+"B6Fd6i-P?p8bZ1JDC)X.,9)9<Rd-;P."N(hbJ3`jBQ!9,7+2%0R;qJDH/5GlDnO
j<2A8g]AZUeue[PaeAO6L>K@\O#[.t0nY`WZYP8G:$F_;OpSd^@3Ps$=?\8!9/riJ/HsBt+UA
c[<?UanoBH6FkD2mf/pE3gU6L"ZH7^K`E6Qr6gtgpW8KH+#7)t(K`Np_BNS9p2Gp"hMFA0fB
Zl%^QlujZ-@N0TRlY);phM*-5"?X%7fK:%PB^Z#u5$/?be]A+j+n_'--q.-_'VSsS"GS$r#\J
\RH#?T^qf\O925Y<uFT$0=hlTPbfLtMarX/BA)c\]AStc-1Hc7)#;1%cGa>n`W5A0j-Z^.PdR
ihEp8LJ_41]A]A%Y@GW;m;JEOB@;7lm_a/XZ$/"S1aeQN4Pb*mlJ<MCc<Qp:NLPTthIQ"X*=@o
Apegd>mF)N`nG#Wod;hmOZ-HR-l=*N^Pu[s2D=%3`Vg2nVndZZp]Aa+[nS;.;<5V]Ao555L\D+
a>8NLg>j3V%em(#eSj$Q<t9nq#I&?X`VX+!g+^Qg!gDN\esB.`"VOir^^3LAH&mGiSL377u%
Dbiu,jf8:)3M;A#D)(0L6S6VG,a[bR82]A)D3AS+iFCLQP3UpdKGGT-*!-+L>g?bu<p?0Y)[9
ArtC1K\6<10*0;R<D,_!MhT6L6%t`E2>O+n75@#ic5\.2%Vd6r(>g*lZ-r1:RXde`T%1@E!9
:>^.hRo8t%0or]AKP<A?I6;1PlT:9^bKC-`Z<Q.;5HY6e*H-*URaD/aCIat!!@q'0iU-N8Gs7
):r_Nk5Hb'fVRNddjQh-r(j:]AjIsC>DFsaj[$40-VTN=5XglO;$=k3V:6*NnS7(mM`LjC.!m
[\Gsa$5gMeA?Y+(&8:e2r<XiedcP[h\\cH@(WnNJr_$Wg4jqB,+<8#FIj[_[)WOCJJ(ba/S#
PN)_6Z5U?$mhVmj9a5TALQGTK0O#_nBXG7UN"XNN(kt'+X!n=*M`qWY3iUZ*[c1'b0X(cH3!
j:-C[&QtoH(&(Ln@BjW2n5JOtQR$A,NVf?C6/D*9i^UqD(@OP,;R>_^^!@-f;ZP7)#<:Qne_
6:FI)m7QF2[gKP"@JcSaG/RI"tNp,RRG7r@GUZU=/3b^L9',a7n;@bdV$8Z]ABX(6n:NH$'<F
.NM@2[ElmCd1?RK%E<]A\p)X!G&+F\djLUEcub_Hf'Ine"PF)*7DoF[aX[4\dd1OUr1n"gr1_
+7'hZSd?_gL9Y[["5/Kjq-n=<=*desttY(*;7l1!XSD2*D'&Z'do#8rkAr'ee'B\fq)3XXfr
R@2:j<$(,N]ADr(8\A"irfj'9(.PYr)?O7g-l]AfWW$?u3HO!,]AZS'W5_kFbF?]AtZ[=X.rJC\Y
,Z%[IC.Y\IN-<W]AFXHL&:c_;nk\4%-,klKpls$F94uPq:GWMfbe<[S=6l-\_ej9GlH[E&dI/
M/c^1)M-UgG5p[($93KTM)+mSu$lXgT^`JcH$7QNgn7]AXY(Hp-m&Lj6C?I4uV-*l`A*16Z;=
k\XB#Q1ZQ;n>T:eD%hfbWMZLJgXDIs0W#N#V@(8;QnIG^$Jfo@^4mJJqGnpi3QUA+-^>ueCV
omV1DS1,K#o2%8oA"/(RMR!M&Z'5QHQSi<#]A(n81!m;u4\f18O!FI%%t+A66KGL:?Pk=:IIN
?QOoi6lQ5U#`2mQ`>E\dHk-1M<#(iOX:dRsi+Vf#.>STWhaP0;rY^]A3l]AVWDEnHIR4UR?l48
Ne;\"GKaV$X\5i?p`2cQBr#l\3=n:2@QqnSP*`ke);^/4-2@L_f!f(0%[PNeQd[n.0b`6DK(
\0H)+cNe9['B/Jhb3dkrG-OFrmo*1JLAlrO5PKs#JiNa(0^+9PST6WQ6)pJIt[Rf@<@rrs_d
Mh\>n`A\;R#u^FO`O",<8')'3/]ApKhN#0\''ao.Q9-HI;)PfLeYBIi:W#-8qqshB;7bGTIO8
">MG=nUa,,7Th?O0KVfi@smf!%c=:]A(s\L.A,8n'u#_5DgHhA.eMQQ1WiX8l(`@?4"N[4C%>
[+ML),.F07SGNSV+bof\=Rg\;6-Hle.4HB'q\!"LO6oC`"sVq),)+aal!I%>+(#;-m%=<F&f
'sFI@o'^)JndLj,'d,*#*e6GKI&>Ld4>pm>m"U-P-4C]A&J'pD-Ji%p\lKmobB_Po?UNt@o>8
%lgTF4imZp5UH3PTHXLWFVFsLcBZA5'Z3rC>dNsQ5:_7uinfkmors@`IB/SuL8$+A2Tts[pI
I,TcYk*&0$6Dn`G(NZ:KiieKS4@"u?ZQ%EYqBMJ8pDX]AF1?_aG7cYf25U5_I,)F1,S"Y>USc
$L=+k^i3rRO_m6<X%+307=R?j(rGb0"@]Aa^W%!O!HmEOR;[9b-oZ2bWi22>B>;*8uf`o)]AJt
568dRqF>6,6<IS2Gk%K-4L\mkp@'cg&8]AJWIhVCJ6KZq1R@Egk,/qi2ZgqtQ>TIV57?)NL5e
'Is9Ma\13l&"^L@eA:%Cjm&"6J=XTL7<\:4`+%\lW,I0\&V%o65;alSBqZ/&>eA;RGrG:MKZ
$8^i]AAWG?^<L]A*0N!%`,bE3n&uUm&8"bj9@t@/Tup6A!%Sr-'Vp6FAAQl7=nPJ&(g#?u)H:C
PGL<QY*)*Uo_)A7,0\>4tF\P'SCh:^p^S8<Lr?JN,S?>p#P:/ZWr__F*F`N6<"6=k_giP7BH
\mkT_hX;$H:k@8VPBEPr8[r%#O,&X=c;P4B?#(4Vg`pGXdt($`B?G!-6A3?':B\uMs^72*V;
/%,TWYE:s_OXc2'2%%@JcJ>WC(Eormfa=pXJbDDN[2E:`U`5ON6=p4MQ3K6Y\6r^b@n:kO(p
jlsN'?PiT1t&j;bs-&Qf4^-B3tJQA,"i;]A2ed15QYc(J)I(CpHgsr"cUHpa8+d(i&^!EAFum
h<-F@]AE%,5D6YTC0"65@n>#]AN32`=h@[`/Q2CS.c>d6U/d`Hr9V%B#DMr_(qf^]A+f,VOo&RZ
[Dr%-#+'#4bSCC<?#2m^*!Q=5n1fF5[4f:@+-Q926QoD+5deYl3.VcDC]Apd-)*3T"^PLO!'V
i,s%6ulWJh*V=f$Z)Qll<;m<_scQX!GL8=usP\l?K%R_@p>rd?ETbKVTsJq`XE(Dh(:Y)qXd
%3l#lZ4ET>>dMucIf^?g5K0q#P4n@.(AAh@CNc,Qi';o5SlA_MGBd&gV#.cY@bXun4/Gpl")
;pj(_j#!kp?[qkt8N7$5=Wu8M-:$VNh#>g$eF3g,pkF?#]A2co$LM-U_+eIWG5G7bVa`V7GZg
Icm=+_Is%tF84(I<>p)2D<rESIfNhUkRlrQH9Zi1;VO4Dh5VfN.M7kbrG<Jgs#VIMI]AacDhJ
eb4GX8RT:VmYku<?uk#aLJ.:7`A92r.FF#*Wcb3nd>),I$tWF5r?$01QALI;6:4FdF`'H,th
%4BfIqZ1$CB*9l7el71X'K$pL1aR0<LuI"s2+2jeR2AVN?JU"sYNY0@5VS#k&KROgD)0!G*7
Bgsa?Lt4J"VR8kKQ_qjVEgLI+.nG\A:f7n.JG/JpR(\(/["K,ukc?tci6m-mF8ojN3,?ZB!O
sV6>P,)!H\16$P"-,37It=5MrCpueLiCR$<gdCqT7Fj7q[<=paiCMj'k"V(;!`@'uZFGJ:nn
DOYkE%n#C;`(=geq?NX\\'9f$bT`t(hQL@*)L6hY`Ff0_22[Ak/2[@RZ`f)C6([pLMLKb72&
Tl:U-XusS8NhM/^0HH3B*>;te@6iGr2e/Tc[MJIiqhKtI+_A]A[g=q*g(!o5Yrui+2>[89r&4
~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report1"/>
<WidgetAttr description="">
<MobileBookMark useBookMark="true" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<O>
<![CDATA[早晚班]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0">
<O>
<![CDATA[班组]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0">
<O>
<![CDATA[日数据]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0">
<O>
<![CDATA[月数据]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="0">
<O t="DSColumn">
<Attributes dsName="产量" columnName="SHIFT_NO"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O t="DSColumn">
<Attributes dsName="产量" columnName="SHIFT_GROUP"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="1" s="0">
<O t="DSColumn">
<Attributes dsName="产量" columnName="日数据"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="1" s="0">
<O t="DSColumn">
<Attributes dsName="产量" columnName="月数据"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-16777216"/>
<Bottom style="1" color="-16777216"/>
<Left style="1" color="-16777216"/>
<Right style="1" color="-16777216"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m90ls;cgPBT%nFj7%r/>6=Qb+bS<Y`>7$I'N)]A)"6<edOjlHa`/IE>j!Kn!GWSg2NNane@-E
U7Hb+hK^":`Qh,sd2_7#3rl,Qo<P(a((I#ta7Zeq0K7=.*8uGE$1=(2L0rp>5i0qu6'a:QE.
*'"m/!f3`Q;E*0@7h4P8u*.EN[E;3H5J,CAc:FtsRRtJWD.iX,lI@/1+aB)8Ki]A(;X5J3?7n
bjMiQj2qj;Q\!KjK7<T7lpo]A/Tga5]AlYM*Eu=.lrn>(aCKb&M$F0O$IDgW'Hr1BPW$k)Y9tF
%dZo(7A/c]AYQ(Ah=jNZ\MEKIW3/02tj%gG1hJ3T6DS:bcg%]AB)X&.u\Qb'i\)EJ;,6R)$f[7
[n!(F4>O><$(a>c:Z&7G3(ORI?<Zq2M=W>f]A7-QR]AJWeL[GCJ<r3p?[[R[F#2@J/pNat@8C#
Ycnh&F8RO$o]AKiBM$t[F0=/CBo>bd1eKGZEtu./7YZQP3!TRBH$52c<)JM^HLAd#>(Rgi(QQ
M]A@?heUS1"E_%sU82;sEo!T#YA(3N./)X\t#N:!+GPKNZiH?)_:Si20VhJ_(4e$ZA\4)P1nR
_"::VYV>u,",A5^=ReWT[]AO>1NV%Dg\,661Y-k^fP]A/u)7rrMLmn.k%0gue,)+d@//FkTmm@
^5hAB\aM2$q5PAB?LjsYQKQpSJANYKp'je4H5;amBIb/)7Z`[2>J)e`_%/OUm:TTT%7;qHH)
JRRQOcXUX`\>rrk/[R7feMRNi$$r4l)eU<sq@L2bS)O]A;D7Ea)[3megAe(F!/Y+V^$rHES[%
QW.3#B^p]ASP0Z![n_s#24YT\r?Fs>_a[%Ir,omS14/SWklu!]A\%HbDlKTt51,t(oc_CRoVVS
AfEt,7$n&eg;r;ec:X@KHm_KO'VIWRo^E5oS]A$"f5,'qCXr[HU$k&.aR5P(q/:eu1G!Pg@W3
;CF__as]AD%e6b?g@cXVd_`@"c5sY'8'I!$/8`PcWo/\-_q(Nk'K(GRhB6&J&;*JkTrmb("@N
]AHSj?@/YlfaX\h\ZFCM+u%Ou8QW*2s<fN@um0b*:oKV@NBP.,^U7ph*eNU5Ut"4u(JL=>9A7
(8C#Ie0>LlU?L,.o1MT;`-L^FY1.>AXa;qffZLd,FV`SD1LJiTII;m8h.?[9N3rA8/K_0d\K
?IVmeZ]AGO&clWAUD?:R.E;I;M>+Am7\BGU_:m'J`nr')II@.8J2l\nX[AFoL3p+OF(bfD;*W
mkG3I4a/k2rm6TZ,oY;;3rR-=QQ5*LD:Dnp$cYXD5QNmnKDHm&-BpK$69:L^15]AJt+S'mB<H
@]AinY1*WefG5p+BA(WXB(;C=D7BEs>c6okGmnQ2JWVA<E@4%i$cZ8'LNDl`9chV#VV1QIM$t
bsg^HZu6G#K85`!G?)+A.%>(D)f8u&unGJf=G[!0]A_^,h/e$,j_s]A3=RAb$QH\ZYeC%r*M%"
*dc7_6GNRC2ehr?7f;bhS"pdqa/a#c=er\^.u&'"-4s^h[PgcQcJ3%mhA@L&NQ<T;^=UfOA8
:l[AEHD786Ui!?"e.<2g1M<T1o*+]A6HGU:tnPO8*@S9*6c&MfB6YO$S$K6%<QrEA\1[U]Aph3
';!\HAN/KGD`:5`h-7n<*c)G`#jUHYR'leQ(J>euLF/"cH75Ln18F0*3)qeN*pp^l&<>+=Y*
8Yh:A%1f5CX'\=e7O7qW@4?R4[q-;c]A6aJCDeTWBWu-%d-5Hpnti^eW/gX@mD/Z*GMBPt!eA
bqKKg,b\r04r,WiH_<\Y"8/O6;_chr;VM]ALhOTpodprr/T9NZIngW_H?1.DUY3e^tN<3qrSt
(Wt+%%iE?o4)Yk*).?<[Aj9rS92-jfh&Z%*rb`aaGjs#CF6l<Wn=<<aKR0asIrk[-^MV\aAe
l='Kiq(=<@ja1).`hgG/@RD,!?Vd\>AbkeSF!t@.YCoPb#8(oX`b^-3\O*hqtCp4p&7giZg&
,4\ZG4F)LBX$9pKLVqm2h-J;pQ'/E_]AJDt&0l>h=T+^&'<creG+FYkRk5>3TL>hM?!Z`R"'d
<UVsfV>\Deo]AM?[\CC$guc=5a5bV`N]AQG#`R'Z9eEfOZZaZ,2eB>!g-U%DrVt5t:kE)Nba2Q
'69t`NeeLIn0LR<8FB_BCOdrp%n:q'_BEY<%=l8k+dL/H?oTt!B!4M:hO@3RWd-f"5f5_-U@
_lXO*c1ULk8cq@+Sd;-n24.*koH\%[V5%#7TF+jJ;&[1VKL0hS`fH3pFJ`_I]ALRpdhiW;'["
#8e1@1PE[U!!194D]A(IDSfm#S9;EfH@,5;tT;kj7hp]AI;Dk6F,;"ZD7N=^J)XKQ)T%_bs%8S
!`jAU7k0W8c7jc]Af:IJtKX;WUu4S+^["*Zm?<u7^rj_L.'<Q3qU-55>FlgFcEfX0.H>GI<M?
d*)-7fO.V`ZoHMJZ.s%Hq$;0#h9g=Q.(6a[+2\SD@b[8)*C5t<7o3-dG7.@)!4QU0gAT<nlg
[jP[Q76YKbB1s$SA=O-cQLe+j)pi[7t2Z3#A%6\7PWq68C!aKY:k95"EA$S2mc4KCCa`DRTl
QRL2r0XW7?L$MrQ&4OVA"<eqhk.<U196L44UQ9+@E0?P0]AJq!opPNh`8%m_9_Q!nOhJ1a6fR
IB/JOFba;^2Z?gTO=nRI<T='enP53Rbrm9\I4-ZF&O#dW05SE+t;d03<6OXf2^$CbN?D[-Zh
H'gt.nOZ%*S)0,5E@,Fk*\PgJ(7>TGpJiWYC4&#L5#7AY(U93NuNC9W315!3qnqa[ZLpV5ld
4Y\O>;JNKLV(/E4%-/uG$VIuMf@ku]Apd29Lf,iR06?\A9UdXQalXbp3,De\/!1IIHjgQPHAI
e(7RCC=1QJSe-a0ma-dcE=3S1bB0_rr*"LU<m-J:Qi-D7:%cJ]AIl2o/\[NKMQCKSmaIbDdRC
G,?kI13%Dd=9+Rg]A3:SY9H0P$HaAgXe_2rR`RY:*#Fa-e:Ye=1b^(SqVRT7\jC#aAY@('?&I
LVKJ_`XZh'KiBedl&!&o^rK2-aZj#IJU"LcsXt&c'WpeM?W^@e3qj;uFc-pbZF'$,om:FSb;
J.X?'rI5LHXRoTA[l#ckEfpk>,;+P068[elY"_9'W3&(6@?/'3m=hnO>ZMuZ&9[\1!LRTe4E
`W<TH\naO*RHF6S)gZoa9eWV/7L_2K)K)CQ?Z)4T$&lO_.-1$\N4.kj*Eq`#%mN!(&t2b&5A
H?T9'ph3V+q^7&]AO`mCrDBF6W3lSjk?GBi9s`Q`p89!A]A>J&>]A2E4B-#+![dD@<iUY=mKj1U
Fm0""OE-&=IhQ:\e6Q[b>@.oh6N)9%S*t5Y)_hME44i_?Lm",'8CJm"*quarK!ms(i_8kQ1^
&.X9/uci,,i9#<E:.B[I_h=HoO"Rjhe`8kHQY<<9a0&_&()4=4]AT`O^t4CKj]A9I3_Q4&iX\:
$c`S`^%$1RR_8m?'cc0D?OT9_(oG[$&FnVE+."\-DS6(mQ%/E?b_.;*iA;Ptqlu;(8R$jtaq
cjmDDu=.($;l*FGG1YU?1c&(?,j$7KUAG,?U:"CPWp%ne3k*lX1'4A1@^^WEZia/1JjAr#&7
Z'p$:.;AtSC`gmJ`IYASYe7mYn&rmF0!j?FN7gA>Y3#7<ZN+FMOPn)_nn8X@%QqOjD(L*>RL
jQrrb4:spA?K3Y+9$Enp7Pi/5?I;/u"#t$r+N,^B@StQp"iR19l$dLsRWZ9Se+q=TgVN=.eL
?F/.#&%!@1s#Zeg1kX[:H96+/EJp8;><Y>\3Nq<;1ig_ro_*Qk@p@J'IG-!QPLNR]A)4c"UE#
j0Ie^,&+a&j!+\cnX&BJs0+&X82<*KtFT^,'P-<EE'cP]A;4^mq94;fp(]AihQ65$'3Q))E4J-
^00`c[bI`MndFk3XXRFOOWi:HU]AQ;GG#Pq<Ui6`Mh:%gR$n9^ZN+/.q4UCkL_I)t/ekW,(@=
t:%F-XR1T;c>B$X;dld0WbD>)s\S2F4gQ!ALOY&,_Ep5,+iS"*DY/-O86KEtu19?dAD?AgAZ
9A)Bfi[b;,oX/+Ift;"tha6JtK.TS]AorX)U\1i'=OdB!jIWo^#*u>h3ki^_I--Ip]ASAi(^Hu
&.:e&dNG<MtF.R<l/_GG1rMg*`o>#PL&Wl4%G]A9uP-;Kk+mQ`/1A'[:Klt'GmHo@2a?e!5GD
tK@\*Hl]A#m&9Nj:T#e7Kikm,,Q9A"'`>dm<6;heYh&pf9`m2>0eml^$kIMcd>,5fIVGC&")e
aO21E6JM*7qGI5'IudNcYn?-4?<K'69)2[S##?(eC5%D1;r^X[4a+WXq[%f`h;"'iKh5B,A;
#ajZTZ>?n,"ufNhNiS4n\?<kXR"1,^>(ocO>G"/&HkU5TiN"h!?B.;\LnF@)d.=t7BGERc;"
"uX3L6#%m&U%m'K$:nG=jYkV^,Ol?4-j]A"0[oP[oLt"<kF]Au42/S^jpho19@DN[382CZIdHL
)jZ@,*0o>3>/BRZN`2K:24GM'Kj]A)r;pQ%`&.[gpAM7c.WCWGuOH^W1&^>OF4iuDW*uNX_!-
!(a2Qs]AQf']A#a/+e__tb!L'AEN?->lg?:SM/<Fg$"VV^#ddR0O9Zu!J;X55Tp-c/4#:Sd%YA
B\HfH`F$e(,#_3TaJ_G;tNRg>+6>$VD<B<6_f[)=W(<@%5bLYYegbm(mA1F;Z&Y48T69S'_O
ACGIRLEJY0IW*_e,9JeU?gERDj\dCt17nadk@&=hOp8-"bf!qD4GR%4Vel$f$Rr%%@Bi.?`A
T+q_YP:rk;&N%*&Y!S>KmTKWb97rI.r@]A`3GO]A\,iqsX\pB:oMZ7fRliIfb+=Kj=/F<8HXK-
4\p^MYHJCHcgq/j1k[STD_:-%`;_#sN6sr;BH-oNgV=.HM!2cH_$ZaF&]A'V#[ki-Q9/uLDs!
DDGo88B(#g#T>&K41%f,5$&5WcbD2"XkCMo#3o/5hMZPhC\Ecg+d)<i4oaE?$L(Oa2*G^\T2
h:G=_8J=9gB^`0VkVD<[_iN><6c0Z\!q[]AqUl[fM%-"nGDma=(`=YgXZjlhb4iHon^'-+k$?
:ELpY,/OHL)%V:t.>Wr[D%PX&>b4l1^C@1+R49@_T@KB^W)_!]Ag`VX50[p%)!9&rR?f:qP]A/
+YTIXEs-;rT]AR&'_J^.';gTFKU)T4V&a_5=jG"X>LcuDr`.gY78&XBfkDaL!Sc?QTe`[T.Q\
b#_6\XTc*<54]AIDu)WB0.g)Hbk'.3_6lUHd"sOF%t=rUoR<kVE6iSoj'(uM9a"t&8>CK+*=6
6=Ee+>`f^$K^J(<9IWad1q>#al"Vmo5MQ57tYY,=WM*>hBH$'kOr@dK#MVpltUQ;_@[H$e6J
i1n`ZD0Y<d^h5bFnMU6pp9L]AOJ!67c;4HH~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="false"/>
</body>
</InnerWidget>
<BoundsAttr x="527" y="33" width="250" height="150"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<Listener event="afterinit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[window.f1 = function () {
    var demo = document.createElement('script');
    demo.src = 'http://10.70.16.168:37799/webroot/help/svg/js/Q518.js'
    document.querySelector('body').after(demo)
}]]></Content>
</JavaScript>
</Listener>
<WidgetName name="report0"/>
<WidgetAttr description="">
<MobileBookMark useBookMark="true" bookMarkName="report0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<MobileBookMark useBookMark="true" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[='<embed src="http://10.70.16.168:37799/webroot/help/svg/518.svg?id='+rand()+'" type="" id="Q518" onload="f1()"/>']]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsHTML="true"/>
<CellPageAttr/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1" paddingLeft="0" paddingRight="0">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m94p?PN<j_e%&5[,1s_(ASfX,g9JF(^h\=63L!s(S3/1H,Zf_/).5fL\?VT>"XUGl(!;=#7A
A:sYnJ<s$/7IhZk;P!dRD%c0H=G0Nc!!gT6G[Md.;A$.JY4]AnrI)Fq``?tH_1+YhnP5-p\qm
emX+uHqgEj>I+Q<?>4:Km0@@i'Su\6nTMJJ/hn8=9Zg>LcX&f3UVd+^_-1b\`Y,Lr:F[BBqp
;^=V,h=n`XFFOLpiGQ.o?h?^IIO]AtQ.pJ!%l=4L-_cNFd2Ms'6Q<+U9'9E(/^7Wa@Wi7903J
mJc-uYhPbg/kYEY3+AG;Q!4:d"n_f:Ej5)?.:B%n3@1A?;m2H]A0=9(a-Or!Io`Oknc,Iaqa`
.h@'0D*`ZG,HtDJK9]A$1eU=R9k,#FO@BB4$q:2tVCi)?sltB:"M]AB'fp5o#]AC\:qAS-&."7S
0Ki87sX;YZm\]AQc41BK^rs4<juA=N)lRbfo:(hOL3p>k_#>.p2\rF$WoLY`474r"8CIPCn-*
J\&"7DfnCUDbE]A8r,Skgc)kY/jVQddqU\AB.Bob@<TZ4&]Anb?&?-^c95PtD(t=\#c8EkUY]A/
SMAGOq@_0F4<!:0kiR,C->IB3'?aL7)\'NZSRZ1hV.<_:1GOikaJ-cO-%RrUTmhZ(<=mlF]A`
8+4j4GAbW<R+ED_Y^%$d.k[D(]A]Aa[.==J,$8$p8u@KIeBA\FF=Hi_lBaa.aa<c-Yai>8-&5D
3YGH(JbKH]A:S9f#5=s;SUJmAg8hQFiN[UCjIpF,fRBl(o]AV$LlA4hjUU]AQZY>?Fo#'(80X,Z
B:]ANu]A8Rd3U&uZba4#s"FZo<2k8+kAJVK$;%#eB//`3k^B=)?EdIU]Ak:i3-aBZ.'-4!l6c[6
fKQt6H+PBc2R6g(bSA+3UYrhk`Yt_,iVtW!RX!eA?4*H$CnI2Jnc@a1hM,X(mk,J73nFYT*i
d[pTN_bODWqTH&78G/nU@3F5j7Ch:?1)!_="$b21V\U=>nj?Y&5qbq4[0^WHb5r/,Z+0Ab5L
p`?K0urQML/u`.`<R%qIF)Bb$j2n#E,/>rq(rgh/%@p(VC+B11Ts+B0E8+4U,[TOQDHIRMT?
YEY)/$G)9oQ(M%6.[A-!J*E!HHjZG9DXS\p:[3'T>j82FH9[?+Ru'p,5@n^SFjY9/hi>(&NX
r@8!f;k@6fXnZ>pbn%PF$E`X=MW>pb&,rl7`m1"+s%CODOglShX+`9kk[j2M\dYFl$ejF_i,
r%?;$,j?"q/SR0q,efi#bMnj7;ju^i4"!V8X2AF+L&Z`?[;RK93]AfCr-ZFWCp<J`a86^?\IN
O&t;>9I`fBW!c"R9=Gh,D*JohUt,\&t7WjY8.Hi3`gcqJ!5:e]A&DfaX-4#!XJNeRf`,@#[Bo
d+`S</aqdErPQ5)dL7CA!7&p9mp^M_\_r.H&9U<TqJ9@>;?G2!N7ASt8hg(R^mO/4n$FOb.!
TN69H/P4KmSPHLWjDh4<4M*]A(R2>=6RLH*:eRIB2B+`VC9W',lhC#2/@Vk?4nGG"@QnYD=75
pj7,q8X=lpnYZ"7]AXQZOW2/K=sdWQ6#NQb0^0J<SFZJW=7gQ;g%nF?JlK:MWE3$o@mc)hXi5
?pWXus//j!E/rV9$G8OkF@8R@")aUr6^2fRsat&,f_VpiZ4S7cB_l&e$OXDNd.S`j,(88hXe
lkS1F4?qK>mu==qHjY6ErD-?%S!d%m2?l,?j+uj7bCsi[EOU;RS;ufDJ"-PbGfC>[S=m3EfW
l\l4,2a>\#<OC02>i?O#/9+-1Q'SmRRY>=M1Kp%D.q.F*]Aik!/4@!W>fEXZZY("*7T.J-YU4
?02I%nV\C5fcmhA%d;P76dJ9Rm\H,L&siL\EUnLHBB/gYlt&7/DKa-Yi/kNldR*!T<,B7i1F
HG;:j@/Ha541e.F3Xk&iRM@Q*F)'_#Fj.^]ALU8hJ_g=.f9g/?\?tNEt\pJjn9D8X64+'*YK7
7_G3:Y0j^8O*b_BfV4EGD=O64@-UNe,#b+Vip]AZl'0t'=,l2)Q>rT-p1o:MOp_@r&W;Z\`9q
)Hm5MMSjoe3&hoH/b#B:sW2kQNPQ^.IE8P@MX!IY,G.b0OOtu9]Ak-??IZ'*K,flC]A)_C_Q;P
#KcbT]AAk-r[/;.Qp4TZIM3L2St$aTHrB?#9RimJQ^X>Bf2dI\c#BAA-l)4pIVh9d"m8_kpq0
XqP$//oYY;?8Ym?`m'FtgD0F(Thp$qQ8`nsDc\b!49BX/@s6-;,-ht@Nhd[:$7C#U!Lr8VNh
$>/oUW]A`ZY\$5@76.lKi.6X&qP08bo^boJmUh+6YU6`J;@fK)Qb/bCBA1AX[TX3/eOcZZm-$
iRk/@>[8N\(+:N;*`@8Q%)Q+7M?;FIRMAWnS"_0#SAl4f%9<fWpC`ZGZT6HHi:bXmsS5@m/c
`2uo\B+O+4Z_TFf`@+Ed:"jAq6CJ9!63ZtOTFHj^(f1X!O=4:!#Q"4V,8>8p`'XV4RU57RA<
1gHOi'eoki4D?"7P?9Y&!K.@jTKnS:g&]AcJ'F!fM@s[,;/Y7!Y5sh1#rV)-@0\L.0]AG_?\=m
#[Ze?nCK`84@]Af*0l0(Z-mW.pMG48h#-W]AC%.lN'428T]Ab(Pj[MVBkF4=BnVGde!lg`1dMrU
ESn/pF>jjW7&>,_PZF,'Gp^R(bD,M-gT:3lTm\&QX;7EJS5s?WRVG4m%(>'o4It=#[2dbAc,
fJkNE)lNdA[g8l/DMPO+9fr%W(HX/U]A]Ac!Pr$F%;CEV#ZY,%3Oe,>MZ/Ne$`DijE'#@@FtsQ
,\4Xr'g?GiJ_CA06@=+0R'6,ZQW]Ag2LKXT#$WHlLCQ&IaG/;T/&nTJ+jQcaRq=EIDT<@>,Me
dK7Qj6Ma\u-B#2aiuA^W7d;t8Z$1Dj='7.RDgL=[U)QlLSPnu(*U7$_hC$RpLa42Qh.>J2:^
G8a!"Xdh-U`9$P3%[fnSe5ts.<2,+sXO<).P#4d(D3?<'=Y&]AnHIqi7lS>4rScT/0Kumu[Z/
(a8To%]A+ons+n<]ACj]AOJ7(@FgtX..Nhdg$2d.(4<QR$Z4Ce/q"fhZfl204!\M!aBJq[i4/-.
P^`mE:gc$T1T/EhrV'BV(FomSM$s@``e!:->@e?CC65O=PmJN2#Y_4t#nl?$nW\'9T*<]A,^r
M=^M[,7kOZh7E9)eNFo$`(B*\etuNk=0e]A12-hA)d:q!@Tg^bU:'LM1E)Dt&%\1L@(j?!Dqc
Y)!+_jdhE_;a"6gPnd^u2-7/QL[e\.ZfN?2&AAKt)-q#$=j$?j@2ldZleq]AUBuCWhRcBSZ+5
3!m$!o6,EkTI@j+72aV>al\^M`mtIsqbTWUOG9Lcklj)($8*b%4#S>tQ;"3anc*T"1=Y8`G$
M#.4//Rd']APgG@XEWXHLVBPm%^ZRY.9r1J]Asl/8CmEET%Z=kj1klU<Y%>kUGH5FC7`TAfZCk
/13rFi>>fR^K1D3kGfE^daK"ad%uPEgiDWuH\XV$3@;inAZ%t>-<bq9UlK'kF3oF*C8$j$q8
=ErFe-RPc"@_@aB/#LeBs(-dV@Ce@+/_Z%fK\PO.qZo6ma%fJ:h*[mh5ZAELjj@+k81QQ,3g
*Pm`h;P'_d=17NfbCF+<qMXdfNG,D&/a5^sh")+kFp=(Ai@g/Q'&BH4)&0%Xli>j]AIg2\TQt
od+.1@&Z/kai+Y<Prk"5)7d+VB3m=lG<2Z[T2XLCr@dLs/XY2PboAZ>86Q@Sqn(EP%\pO=P:
bT!<<VX"hgE7JP_,[0+#RFVT+c82N?nXtBQ6E#7h@/"IbNoP%N5M8+fZ>sXe*gT`#ms([#C6
LjuT-7(0;=q6*GNQ=(C>2"0)u)r&m3s1Bu[+eR4ffP#Ot5rdngLA-@W:.fB^;!<N)D8JuCG@
V_9e-/Xnhn1,efhV,+-G8eI\mgY;9%IIM5m9\VQ,._-b!nX3/D6Y"3[JH181eJ)$XgFFAQdA
2S!*1nhdjN_Z_B1lKLsn^@IL>rt0XRV0.'[M,)6fU-`[,n^3tkbtL*_?n]A-aAQ:b7f",\WK2
>.S-!NPcA=q^[ND4.F!L(4d$'g\'S;9>EktL).T4LBaLQ/6T4NJe`k#_QT_^V_sm#;0f<'Ya
"D_#^eMd?qYE[PtpW`]A`t<9i&ijO;F*m(nsMklX1f#,'%_T;/.HWZi@5R[cBQ!DI]ALFY)YQ-
5Y'.ikX>B[UX%-D^\Zd]Aho$YEFc*^?d$jcEK4Aj>i3!'J@4(oNc_?6GHM+"Wl_q.rrQJeeSZ
t?o<M,T(X3Zd'E`<gN,d/fWA$-UOM1`GeJc=:IKC%^^#Y"HTI#1pPOY8;lIpC1=BEMF/W<Sf
nT#HVAjC's[QSH8Juc96JQB!#uX$rM:,l>k,""IL<9$M2_s6;O6qgGtI4GW[<Bf"g[P=:dKI
C:e=dh:^\'<g1#3ARuh/9+5V_%+k:uo!:6>3)4p5HCDMC=[peVR(#U%eARH9H>")^\^*0\$b
>N6a.E#ks/fG;DH./5`OGgO~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<MobileBookMark useBookMark="true" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[='<embed src="http://10.70.16.168:37799/webroot/help/svg/518.svg?id='+rand()+'" type="" id="Q518" onload="f1()"/>']]></Attributes>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0" showAsHTML="true"/>
<CellPageAttr/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="NullBackground"/>
<Border>
<Top style="1" color="-16777216"/>
<Bottom style="1" color="-16777216"/>
<Left style="1" color="-16777216"/>
<Right style="1" color="-16777216"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m94p?PN<_'lKW2V$n#24i0s7.*D6otd=?'kPsm#]AoL1+4Es60qa)k5l2n&'(^r1)'73uiLO)
m:H8mm77I?^Bu\RZ="l,G&[F3)DA2IMJ\n'4#RZCpA@QX!hk8'#&tIGX.4mcXT*+2@]A%hVEZ
WVU)n.r4\8SOI8\dYC%cEjDI:TaGao%HdO4/jh!.!KLFuKXaKQ%*T__:c`o:-TDkabY!QkUH
suR<WbVfb^?mQU+25$@FSVX1-IKSVs238B`8,nM=aDK8cBu@3<PAFOVP@Qk7Hr$?ohm4p>s3
dQ"b('T-(/do^.cIYXQXJC>T_hFMkdZ:,O69SQj!M7J9Uf$6D?qqj)O/)[h]AG!7A#$XF2I.^
JZB[*\V-\s91@!Dh\5&,'Lr"H3]A_9o91^\SZ+Fmn@@%G`d2A&i^Wf!ag`XhlebH*934e7RV(
_BNEO\.!lP:I9oF@e2QpP.lC5r/-)Bj1R`K9f$Pk'2C\KPOfkUL5/o5\eKVm7a*S,*3"?TrG
Z`Bel]Aqe5jpB"%)P8qlK2XUiQ(I3[^'m)-"#f(inM(qH(p*-&En)VrMLXl+NU$R-[j[%f^sj
fAbP1K&#KpGL'LT(9D;>#KSpVcqZ=J0g%>M.XM9BWb;6bH%m(%TZVf["Dlga-ftH8rc#N]Ai^
`S*-p+]AZ)'j!Edbl"%E_6XK]AO_@q.\UPOhH^2M3K1I49JYjT2L]A@k+!Qe[lqLE.Pc(VhbKt/
4KUB404#C@itOVieh:gWa=D`lFSrkZ]A&Bd`IY[PWS]A<A37@ppN96nXAkIVe1#Y)<\jIf26L:
D\im0LBV'j^3;h3Dd+U:Ll\'6S:1/uH"RTWeB1<h^r+IRt35r?6_DUh8$_aF-?"9H:?gIr_r
UpdjIkle<g!H<a;@f@^N^Ln4lB:G7I>MViV!I5MIrH[;YA1=AVG0#jO#<tiWBN=A7K(OWI#)
ae$Tr2oqEqamZh00&TQ:Nso3UA;YcF6RLHdiV:7OfTD/TSO3WK@PnMSF\K<?F;uF/Je-H8_.
oWZQ*%N0GsR^4i4K.r`\9@pChuoS?SN]A26iP+N01RWQ_#BsYYC,\kB+0fCRG$MqUdQ,DJ[@b
c&;s0*O/J_o*u8]A0(fJi0q4Adr&u=P>2.%r(CW".nO3!B0GVU`0]A$ZR1D2Rs=T`CbZBMW<7p
3e)F?TE*lRPVhoZ+Lqg&q;S:.1)j8JlAp32$D'Xnis(^b'jKk=j,\ol,\._F`fn@Cb;(F!Fu
NfoT*tf>Hld0O>S/Kb2Lo=$VN[NZn`1Q?0*fo25=+DOdcT.e'/s"A%FcHk@me(r<6TS[J7..
;E;/;RJ0HVc*BkSF5-DnBD>/mo0%E[M[`=b5jZom3\9Y%,+SLq`DHTI8n*Q`92>;.76IID;Y
a9;6&1H2TNc+'j/DSDJ%f/Pa=ufYHAaLTF[M'8;[PVS]AE@-7#Y<#=N/9BO17lf=4VUsqp2Dq
p40kFU'&XQm)$$>fpFT;rJ6U)[I0B7'3N\!Km04nHt,76q?^WnWutZ7RDSNY_[e2qL*h]A-O#
X(mY\HD>ja5,Q^.pn!+RfoMW<9;_I%P2lg/K=M&2;gKG-&_kl"[M+.??jSXuAiDZk,p4lH5)
QI4bL\deBGnb7EO`F]AbN&CDq-ENL7,G5Y(Iu/NG0f!-C#M:NZ?E4=dZGA51-h3"rSLHS3,D6
8+h%?!>@os!CPZ.*gS(]Au7lgrOY&66&2``r@6\um-)gl<Re[D'jp]A/%-SI9k$9>117G=:2DP
$cM4%RmJ:+%F9un)9.8(qa-THTP3^&msCi$Z-'?A>L_>p[&pZ)QR*=g>q:Z%^^m/JFuW&grP
WJV>cgBk0[LJE>E\,##H%:juC#m4fE@"R<\1,Qp,c]A5K[0nX-eR[pmW]A1c,<Z$kN$!hFZj@F
'V^3>r;JRLfhH^n7joR(5TbA/Q<T3Cc9UUMXih%@OBsg""F(ZK<J9*V]AnRfZMbSFjAkI<ep(
%#KuBo9*rdL=seZVF68+ZM4l@BH<bt@*=F67'Ld*Ek[i9o]ABKfMrV8NOn1k(BYf5XTe(Em=.
HU;uF@SM$@n8%e/-=/E++MN(!6Vo5?mA9".)Fae[Yp.JF<V)m7^qiQB_MLk*P+3>TPZE$MKC
oqEMHP=0gpSOQUOW2_17RhX%UsljA=Trn8S%H7(;+I6Br-GV2HD&mJa4meeJU^,0K6RR#C,o
cf#Kj+T'!c5e./+.LWJFU]A.u_VaOMrZurLRVOg`h[Y6OF@C%iUGPfs%d'eC`X3T,'\R0n.&T
oTm,[PkJ.:bDR9u=t:B27*\n^M,$TjPSpfS?kD^ofScamqJ+A26U<U('Fq3^?\Ca8tWO$^i-
T"+\2%G2d\b[*(CCBP2AUBM9`6;&E6mGE='1M'Y/C_u_.hP_"Mt(ln_P14MJRI)"`R0T7^'=
lniS+Y<q3fAEdUC$1;\THf>fNgQ)pp4/N:VucK]AL^r*n:P/t6_/$1O$qtc02SO1s]A!PsuMP$
2pa4J42qt`H&p5Xf;/&@&O_U.S)k*E;HaGTY6/1KN:*WSMT$SBGHJdBJ_9iWma9Gq4[VF-;o
H?f&25R2Ip@q;lK_7(DSF`=F0j@Q6V3q*`%7?SXoVm`,$?*t.N!TRju]AC=#V-M(qj":V,9UM
6C<E9c_^T"5>AC]A\O95msD_6Qc5RGr!4rO&.!_BJk3e,J1.c$j,FOh5qK:Yd2`j_d!IC^"n?
F'n=>Gou)s0IE*#!g(SC()cH&h=;2KC\G'_JJb-.EIpT/r_R$\OUWfom\J1qnYAn3&Jq;f0A
[TO1jlO86EBB#t7da$#^AhG#+`<P>kWK7)[C<JueOL0m6S9.RTU,oB,dK7sIHKC/C/m0VfU>
I@$ui3tU)0/-'I;RV5lj^#%J*c&Yn38`f%4tWPWSk*lE>?O\o*NCb]A]A^Y)`D9)bmPVXf0ZuA
O\@a$+9RWLC-3Aj)?a<]AYQQu'?;Ro;JnT=V%<c5OHPK)05rUqeUmf8q%08p[MrlS$SLUb@Ya
2[s.`/n:Ks^ZKG/*+H2@Ih99,!%`V0E73J*c>4Z-.1^MONIo)]A7hpY)_^s`6)THUggg;(XU^
;G2SlregN5AL3.eIgT.mn#dnl^l:iqn#10Hon)LV^^k-H.i>J2r4a[:+^!j`'_Nj[,Y\lfpY
`6p/(*PX563(CP\so]Al,R"28m[+H[9?.>c1;O@`1&%hT?go_Qj%gPDlauSi$nesr]A1+lf*33
j`k3XuW%S)nge#Fu%<OJe[dTapi/AtOA"`YS=<c3VFDFejtU2.isMloX.IO".?m'L]ABF2<"*
I'FUC,<pNq+al9E!lM\?>(-LJZ:jZj4+;M&m8QIh88.pK_Oq-sR)NVS:Yr\Ref,i\PT:cTE$
k%C;fup13i8quQ:G"*@UjHW,Lql[Z/HtLSQKei_6$h,"\GuA..\1S&Q0Y._[0cnJ'uI77NoZ
!ej&hD15*X^XF??sR>18STSFIT&)N&oUgeHcfH8SnUP4YOAGGqq!pk4p2EsC&7&&KFTL.6ao
&XlLS>k[_N#WEo6L]AU'a^-`rNKO[F=6M@i9"00gXII=XdF^M)3_<sSS+Cf`)tMBGC0?0XZbt
O]A<GtpT=>8.(A2:K!?Rs>q(Cb6aTpRaMm7\\K8V/'YVmpLbG6TJ8@QpLk@qE[$'lHY#2itmi
RU*[%Sa4FjN^8l2!-%)Qe->.G2C'+"WhTHg:hfQNWFR#UI0gB8>ghm1NC!b6=5uN]AV',#a<4
361]A*[;aD33lnb&<=Xo,nH75:Df,$O\*u-5>D`T6DPp<"OS`0u(b6Sceh.!k"Mk/]A:=0?r7P
RM-[*7EJWjKP"-a<h2hl-Y'uhGL%I<VpGf=EHL(<N6-Ah51pHkpiN0U-L*L:34kfZ;@VB"E$
*g9eA!jUAp_5]A?OD*I^MkY`DH.q)PU4lC'GDj/-f?(9b.\G4G)_<A.$&i-S3W\IP6b:O_+7$
AJ%VmmC=DYP]A<gj3Z1aDdc[oU5hGP>q_63!*K-*KF'qo='`!r~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="864" height="486"/>
</Widget>
<Sorted sorted="true"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="report1"/>
</MobileWidgetList>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.DefaultMobileBookMarkStyle"/>
<ShowBookmarks showBookmarks="true"/>
<WidgetScalingAttr compState="0"/>
<DesignResolution absoluteResolutionScaleW="1366" absoluteResolutionScaleH="768"/>
<AppRelayout appRelayout="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="540"/>
</Widget>
<Sorted sorted="true"/>
<MobileWidgetList/>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.DefaultMobileBookMarkStyle"/>
<ShowBookmarks showBookmarks="true"/>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="960" height="540"/>
<ResolutionScalingAttr percent="0.9"/>
<BodyLayoutType type="1"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="KAA"/>
<PreviewType PreviewType="0"/>
<WatermarkAttr class="com.fr.base.iofile.attr.WatermarkAttr">
<WatermarkAttr fontSize="20" color="-6710887" horizontalGap="200" verticalGap="100" valid="false">
<Text>
<![CDATA[]]></Text>
</WatermarkAttr>
</WatermarkAttr>
<TemplateIdAttMark class="com.fr.base.iofile.attr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="a7877531-3fda-487d-ae61-61e3354d2c71"/>
</TemplateIdAttMark>
</Form>
