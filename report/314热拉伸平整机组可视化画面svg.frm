<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="10.0.0">
<TableDataMap>
<TableData name="产量早班" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT A.SHIFT_NO,
A.SHIFT_GROUP,
(A.item_value/1000)||','||
(B.ITEM_VALUE/1000) data
FROM TIMSIJ4GT A,TIMSIJ4GT B
WHERE A.ITEM_ENAME = 'PROD_GROUP_D'
  AND B.ITEM_ENAME = 'PROD_GROUP_M'
  AND A.date = (SELECT MAX(date) from IMSIJ4.TIMSIJ4GT WHERE ITEM_ENAME = 'PROD_GROUP_D' and UNIT_CODE = '${UNIT_CODE}')
  AND B.date = (SELECT MAX(date) from IMSIJ4.TIMSIJ4GT WHERE ITEM_ENAME = 'PROD_GROUP_M' and UNIT_CODE = '${UNIT_CODE}')
  AND A.UNIT_CODE = '${UNIT_CODE}'
  AND A.UNIT_CODE = B.UNIT_CODE
  AND A.SHIFT_GROUP = B.SHIFT_GROUP
  and A.shift_no = '2']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="产量晚班" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT A.SHIFT_NO,A.SHIFT_GROUP,(A.item_value/1000)||','||(B.ITEM_VALUE/1000) data
FROM TIMSIJ4GT A,TIMSIJ4GT B
WHERE A.ITEM_ENAME = 'PROD_GROUP_D'
  AND B.ITEM_ENAME = 'PROD_GROUP_M'
  AND A.date = (SELECT MAX(date) from IMSIJ4.TIMSIJ4GT WHERE ITEM_ENAME = 'PROD_GROUP_D' and UNIT_CODE = '${UNIT_CODE}')
  AND B.date = (SELECT MAX(date) from IMSIJ4.TIMSIJ4GT WHERE ITEM_ENAME = 'PROD_GROUP_M' and UNIT_CODE = '${UNIT_CODE}')
  AND A.UNIT_CODE = '${UNIT_CODE}'
  AND A.UNIT_CODE = B.UNIT_CODE
  AND A.SHIFT_GROUP = B.SHIFT_GROUP
  and A.shift_no = '1']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="总产量当日" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT ITEM_VALUE_N/1000 item_value_n,DATE FROM IMSIJ4.TIMSIJ4GS
WHERE ITEM_ENAME='PROD_D'
AND UNIT_CODE='${UNIT_CODE}'
ORDER BY DATE DESC
FETCH FIRST 1 ROWS ONLY
]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="总产量本月" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT ITEM_VALUE_N/1000 item_value_n,DATE FROM IMSIJ4.TIMSIJ4GS
WHERE ITEM_ENAME='PROD_M'
AND UNIT_CODE='${UNIT_CODE}'
ORDER BY DATE DESC
FETCH FIRST 1 ROWS ONLY
]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="库存" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[
SELECT 
item_value_content||'Q_Q'||
case item_ename when 'STOCK_WGT_D' then '实际库存' 
when 'OVER_STOCK_WGT_W' then '超7天' 
when 'OVER_STOCK_WGT_M' then '超30天' end||'Q_Q'||
item_value||'-*-' AS 库存
FROM TIMSIJ4GS 
WHERE ITEM_ENAME in ('STOCK_WGT_D','OVER_STOCK_WGT_M','OVER_STOCK_WGT_W') 
and item_value_content in ('Q18', 'Q15') 
and date = (select max(date) 
from TIMSIJ4GS where item_value_content in ('Q18', 'Q15'))]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="生产异常提醒" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select 
plan_no||'Q_Q'||
in_mat_no||'Q_Q'||
hold_code||'-*-' as 生产质量  
from IMSIJ4.TIMSIJ4GC
where PRE_UNIT_CODE='${UNIT_CODE}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="来料异常提醒" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select 
plan_no||'Q_Q'||
out_mat_no||'Q_Q'||
hold_code||'-*-' as 来料异常  
from IMSIJ4.TIMSIJ4GC
where UNIT_CODE='${UNIT_CODE}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="缺陷改判率不分组" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select item_ename,item_value from TIMSIJ4GS
where item_ename in ('JUDGE_RATE_D_IH','JUDGE_RATE_M_IH')
and date in (
	select max(date) from TIMSIJ4GS
	where item_ename in ('JUDGE_RATE_D_IH','JUDGE_RATE_M_IH')
	group by item_ename
)
and UNIT_CODE='${UNIT_CODE}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="成材率" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT A.SHIFT_NO,A.SHIFT_GROUP,A.item_value item_day,B.ITEM_VALUE item_month
FROM TIMSIJ4GT A,TIMSIJ4GT B
WHERE A.ITEM_ENAME = 'OUTPUT_RATE_GROUP_D'
  AND B.ITEM_ENAME = 'OUTPUT_RATE_GROUP_M'
  AND A.date = (SELECT MAX(date) from IMSIJ4.TIMSIJ4GT WHERE ITEM_ENAME = 'OUTPUT_RATE_GROUP_D' and UNIT_CODE = '${UNIT_CODE}')
  AND B.date = (SELECT MAX(date) from IMSIJ4.TIMSIJ4GT WHERE ITEM_ENAME = 'OUTPUT_RATE_GROUP_M' and UNIT_CODE = '${UNIT_CODE}')
  AND A.UNIT_CODE = '${UNIT_CODE}'
  AND A.UNIT_CODE = B.UNIT_CODE
  AND A.SHIFT_GROUP = B.SHIFT_GROUP]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="技术通知单" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[硅钢L3]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT  distinct A.PLAN_NO||'Q_Q'||A.tech_note_no||'-*-' 技术通知单,B.UNIT_SEQ_NO
FROM TPSQ114 A,TPSM314 B  
WHERE A.UNIT_NO= '${UNIT_CODE}' AND A.TRACK_STATUS >= '8' AND A.IN_MAT_NO = B.IN_MAT_NO ORDER BY B.UNIT_SEQ_NO desc
fetch first 10 rows only]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="超期异常提醒" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select 
case when item_ename='OVER_STOCK_WGT_3' then '超3天'
when item_ename='OVER_STOCK_WGT_W' then '超7天'
when item_ename='OVER_STOCK_WGT_M' then '超1月' end||'Q_Q'||
item_value||'Q_Q'||
item_value_content||'-*-'    超期异常提醒  
from TIMSIJ4GS
where 1=1
and item_ename in ('OVER_STOCK_WGT_3','OVER_STOCK_WGT_W','OVER_STOCK_WGT_M')
and ITEM_VALUE_CONTENT  in ('Q18','Q15')
and date in (to_char(current date ,'yyyymmdd'),to_char(current date,'yyyymm'))]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="检化验指标" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit_code"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
<Parameter>
<Attributes name="TableA"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[='TMM'+$unit_code]]></Attributes>
</O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[硅钢L3]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT  
C.MAT_NO||'Q_Q'||
C.C||'Q_Q'||
C.O||'Q_Q'||
C.N||'-*-'  检化验指标
FROM ${TableA} A,TCMRS11 C
WHERE     A.UNIT_NO = '${unit_code}'
AND A.OUT_MAT_NO = C.MAT_NO
ORDER BY A.PROD_END_TIME DESC  
FETCH FIRST 32 ROWS ONLY]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="检化验by机组号" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[硅钢L3]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select 
UNIT_NO||'Q_Q'||TEST_TIME||'Q_Q'||SHIFT_NO||'Q_Q'||LOT_NO||'-*-'  检化验指标
from BGSIM1.TCMRS34
where unit_no = '${UNIT_CODE}'
order by TEST_TIME desc]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="停机" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT COUNT(1) times,NVL(SUM(SUBTOTAL),0) total FROM TMSIJ4.TTMSIJ4PS WHERE UNIT_CODE = '${UNIT_CODE}' AND SD_DESCRIPTION = '成品卷停机' and substr(SD_DATE,1,6)=to_char(current date,'yyyyMM')]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="缺陷改判率分组" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select item_ename,item_value,shift_no,shift_group from TIMSIJ4GT
where item_ename in ('JUDGE_RATE_GROUP_D_IH','JUDGE_RATE_GROUP_M_IH')
and date in (
	select max(date) from TIMSIJ4GT
	where item_ename in ('JUDGE_RATE_GROUP_D_IH','JUDGE_RATE_GROUP_M_IH')
	group by item_ename
)
and UNIT_CODE='${UNIT_CODE}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="CP符合率分组" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT A.SHIFT_NO,A.SHIFT_GROUP,A.item_value item_value_d,B.ITEM_VALUE item_value_m
FROM TIMSIJ4GT A,TIMSIJ4GT B
WHERE A.ITEM_ENAME = 'CP_FIX_RATE_GROUP_D'
  AND B.ITEM_ENAME = 'CP_FIX_RATE_GROUP_M'
  AND A.date = (SELECT MAX(date) from IMSIJ4.TIMSIJ4GT WHERE ITEM_ENAME = 'CP_FIX_RATE_GROUP_D' and UNIT_CODE = '${UNIT_CODE}')
  AND B.date = (SELECT MAX(date) from IMSIJ4.TIMSIJ4GT WHERE ITEM_ENAME = 'CP_FIX_RATE_GROUP_M' and UNIT_CODE = '${UNIT_CODE}')
  AND A.UNIT_CODE = '${UNIT_CODE}'
  AND A.UNIT_CODE = B.UNIT_CODE
  AND A.SHIFT_GROUP = B.SHIFT_GROUP
  ]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="CP符合率不分组" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O>
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[DBPRODE7]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select item_ename,item_value from TIMSIJ4GS
where item_ename in ('CP_FIX_RATE_D','CP_FIX_RATE_M')
and date in (
	select max(date) from TIMSIJ4GS
	where item_ename in ('CP_FIX_RATE_D','CP_FIX_RATE_M')
	group by item_ename
)
and UNIT_CODE='${UNIT_CODE}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="检化验by材料号" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[硅钢L3]]></DatabaseName>
</Connection>
<Query>
<![CDATA[select 
MAT_NO||'Q_Q'||SMP_POS||'Q_Q'||TEST_TIMES||'Q_Q'||COAT_THICK_TD||'-*-'  检化验指标
from
((SELECT A.MAT_NO,A.SMP_POS,A.TEST_TIMES,A.COAT_THICK_TD,A.COAT_THICK_TC,A.COAT_THICK_TW,A.COAT_THICK_TA,A.COAT_THICK_BD,A.COAT_THICK_BC,A.COAT_THICK_BW,A.COAT_THICK_BA FROM TCMRS11 A,TMMQ314 B,TMMQ171 C 
    WHERE A.MAT_NO = C.OUT_MAT_NO
      AND C.MAT_TRACK_NO = B.MAT_TRACK_NO
      AND B.PROD_END_TIME >= '20201231200000'
      AND B.PROD_END_TIME <= '20210131200000')
   UNION 
   (SELECT A.MAT_NO,A.SMP_POS,A.TEST_TIMES,A.COAT_THICK_TD,A.COAT_THICK_TC,A.COAT_THICK_TW,A.COAT_THICK_TA,A.COAT_THICK_BD,A.COAT_THICK_BC,A.COAT_THICK_BW,A.COAT_THICK_BA FROM TCMRS11 A,TMMQ314 B,TMMQ172 C 
    WHERE A.MAT_NO = C.OUT_MAT_NO
      AND C.MAT_TRACK_NO = B.MAT_TRACK_NO
      AND B.PROD_END_TIME >= '20201231200000'
      AND B.PROD_END_TIME <= '20210131200000')
   UNION 
   (SELECT A.MAT_NO,A.SMP_POS,A.TEST_TIMES,A.COAT_THICK_TD,A.COAT_THICK_TC,A.COAT_THICK_TW,A.COAT_THICK_TA,A.COAT_THICK_BD,A.COAT_THICK_BC,A.COAT_THICK_BW,A.COAT_THICK_BA FROM TCMRS11 A,TMMQ314 B,TMMQ173 C 
    WHERE A.MAT_NO = C.OUT_MAT_NO
      AND C.MAT_TRACK_NO = B.MAT_TRACK_NO
      AND B.PROD_END_TIME >= '20201231200000'
      AND B.PROD_END_TIME <= '20210131200000')
   UNION 
   (SELECT A.MAT_NO,A.SMP_POS,A.TEST_TIMES,A.COAT_THICK_TD,A.COAT_THICK_TC,A.COAT_THICK_TW,A.COAT_THICK_TA,A.COAT_THICK_BD,A.COAT_THICK_BC,A.COAT_THICK_BW,A.COAT_THICK_BA FROM TCMRS11 A,TMMQ314 B,TMMQ174 C 
    WHERE A.MAT_NO = C.OUT_MAT_NO
      AND C.MAT_TRACK_NO = B.MAT_TRACK_NO
      AND B.PROD_END_TIME >= '20201231200000'
      AND B.PROD_END_TIME <= '20210131200000')
   UNION 
   (SELECT A.MAT_NO,A.SMP_POS,A.TEST_TIMES,A.COAT_THICK_TD,A.COAT_THICK_TC,A.COAT_THICK_TW,A.COAT_THICK_TA,A.COAT_THICK_BD,A.COAT_THICK_BC,A.COAT_THICK_BW,A.COAT_THICK_BA FROM TCMRS11 A,TMMQ314 B,TMMQ175 C 
    WHERE A.MAT_NO = C.OUT_MAT_NO
      AND C.MAT_TRACK_NO = B.MAT_TRACK_NO
      AND B.PROD_END_TIME >= '20201231200000'
      AND B.PROD_END_TIME <= '20210131200000'))]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="故障停机" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="unit_code"/>
<O>
<![CDATA[Q314]]></O>
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
<![CDATA[Q314]]></O>
</Parameter>
</Parameters>
<Layout class="com.fr.form.ui.container.WBorderLayout">
<WidgetName name="form"/>
<WidgetAttr description="">
<MobileBookMark useBookMark="true" bookMarkName="form" frozen="false"/>
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
<WidgetName name="body"/>
<WidgetAttr description="">
<MobileBookMark useBookMark="true" bookMarkName="body" frozen="false"/>
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
<WidgetName name="body"/>
<WidgetAttr description="">
<MobileBookMark useBookMark="true" bookMarkName="body" frozen="false"/>
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
<![CDATA[3352800,3352800,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" s="0">
<O>
<![CDATA[生产]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="0" r="1">
<O>
<![CDATA[昨日总产量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1">
<O>
<![CDATA[当月总产量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2">
<O t="DSColumn">
<Attributes dsName="总产量当日" columnName="ITEM_VALUE_N"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="2">
<O t="DSColumn">
<Attributes dsName="总产量本月" columnName="ITEM_VALUE_N"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="4">
<O>
<![CDATA[早班]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4">
<O>
<![CDATA[日]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="5">
<O t="DSColumn">
<Attributes dsName="产量早班" columnName="SHIFT_GROUP"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="5">
<O t="DSColumn">
<Attributes dsName="产量早班" columnName="DATA"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="7">
<O>
<![CDATA[晚班]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="7">
<O>
<![CDATA[数据]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="8">
<O t="DSColumn">
<Attributes dsName="产量晚班" columnName="SHIFT_GROUP"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="8">
<O t="DSColumn">
<Attributes dsName="产量晚班" columnName="DATA"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="10">
<O>
<![CDATA[功能精度]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="13" s="0">
<O>
<![CDATA[成材率]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="14">
<O>
<![CDATA[早班]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="15">
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
<Expand dir="0"/>
</C>
<C c="1" r="15">
<O t="DSColumn">
<Attributes dsName="成材率" columnName="ITEM_DAY"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="15">
<O t="DSColumn">
<Attributes dsName="成材率" columnName="ITEM_MONTH"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="17">
<O>
<![CDATA[晚班]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="18">
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
<Expand dir="0"/>
</C>
<C c="1" r="18">
<O t="DSColumn">
<Attributes dsName="成材率" columnName="ITEM_DAY"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="18">
<O t="DSColumn">
<Attributes dsName="成材率" columnName="ITEM_MONTH"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="20" s="0">
<O>
<![CDATA[质量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="21">
<O>
<![CDATA[缺陷日]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="21">
<O>
<![CDATA[缺陷月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="22">
<O t="DSColumn">
<Attributes dsName="缺陷改判率不分组" columnName="ITEM_VALUE"/>
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
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="22">
<O t="DSColumn">
<Attributes dsName="缺陷改判率不分组" columnName="ITEM_VALUE"/>
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
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="24">
<O>
<![CDATA[cp符合率日]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="24">
<O>
<![CDATA[cp符合率月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="25">
<O t="DSColumn">
<Attributes dsName="CP符合率不分组" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[CP_FIX_RATE_D]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="25">
<O t="DSColumn">
<Attributes dsName="CP符合率不分组" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[CP_FIX_RATE_M]]></O>
</Compare>
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="27">
<O>
<![CDATA[缺陷早]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="28">
<O t="DSColumn">
<Attributes dsName="缺陷改判率分组" columnName="SHIFT_GROUP"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[JUDGE_RATE_GROUP_D_IH]]></O>
</Compare>
</Condition>
</JoinCondition>
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
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="28">
<O t="DSColumn">
<Attributes dsName="缺陷改判率分组" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[JUDGE_RATE_GROUP_D_IH]]></O>
</Compare>
</Condition>
</JoinCondition>
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
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="28">
<O t="DSColumn">
<Attributes dsName="缺陷改判率分组" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[JUDGE_RATE_GROUP_M_IH]]></O>
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
<ColumnRow column="0" row="28"/>
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
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="29">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="29">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="29">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="30">
<O>
<![CDATA[缺陷晚]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="30">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="30">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="31">
<O t="DSColumn">
<Attributes dsName="缺陷改判率分组" columnName="SHIFT_GROUP"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[JUDGE_RATE_GROUP_D_IH]]></O>
</Compare>
</Condition>
</JoinCondition>
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
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="31">
<O t="DSColumn">
<Attributes dsName="缺陷改判率分组" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[JUDGE_RATE_GROUP_D_IH]]></O>
</Compare>
</Condition>
</JoinCondition>
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
</Condition>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="2" r="31">
<O t="DSColumn">
<Attributes dsName="缺陷改判率分组" columnName="ITEM_VALUE"/>
<Condition class="com.fr.data.condition.ListCondition">
<JoinCondition join="0">
<Condition class="com.fr.data.condition.CommonCondition">
<CNUMBER>
<![CDATA[0]]></CNUMBER>
<CNAME>
<![CDATA[ITEM_ENAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[JUDGE_RATE_GROUP_M_IH]]></O>
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
<ColumnRow column="0" row="31"/>
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
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="33">
<O>
<![CDATA[cp符合率早]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="34">
<O t="DSColumn">
<Attributes dsName="CP符合率分组" columnName="SHIFT_GROUP"/>
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
<Expand dir="0"/>
</C>
<C c="1" r="34">
<O t="DSColumn">
<Attributes dsName="CP符合率分组" columnName="ITEM_VALUE_D"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="34">
<O t="DSColumn">
<Attributes dsName="CP符合率分组" columnName="ITEM_VALUE_M"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="35">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="35">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="35">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="36">
<O>
<![CDATA[cp符合率晚]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="36">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="36">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="37">
<O t="DSColumn">
<Attributes dsName="CP符合率分组" columnName="SHIFT_GROUP"/>
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
<Expand dir="0"/>
</C>
<C c="1" r="37">
<O t="DSColumn">
<Attributes dsName="CP符合率分组" columnName="ITEM_VALUE_D"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="37">
<O t="DSColumn">
<Attributes dsName="CP符合率分组" columnName="ITEM_VALUE_M"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="39">
<O>
<![CDATA[产品检化验]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="39">
<O>
<![CDATA[检化验材料号]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="40">
<O t="DSColumn">
<Attributes dsName="检化验by机组号" columnName="检化验指标"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="40">
<O t="DSColumn">
<Attributes dsName="检化验by材料号" columnName="检化验指标"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<CellPageAttr/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="42">
<O>
<![CDATA[生产异常提醒]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="42" s="1">
<O>
<![CDATA[来料异常提醒]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="43">
<O t="DSColumn">
<Attributes dsName="生产异常提醒" columnName="生产质量"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="43" s="1">
<O t="DSColumn">
<Attributes dsName="来料异常提醒" columnName="来料异常"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="45">
<O>
<![CDATA[技术通知单]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="46">
<O t="DSColumn">
<Attributes dsName="技术通知单" columnName="技术通知单"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="48" s="0">
<O>
<![CDATA[库存]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="49">
<O>
<![CDATA[柱状图]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="50">
<O t="DSColumn">
<Attributes dsName="库存" columnName="库存"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="51">
<O>
<![CDATA[表格]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="52">
<O t="DSColumn">
<Attributes dsName="超期异常提醒" columnName="超期异常提醒"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="54" s="0">
<O>
<![CDATA[设备停机]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="55">
<O>
<![CDATA[停机次数]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="55">
<O>
<![CDATA[停机时间]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="56">
<O t="DSColumn">
<Attributes dsName="停机" columnName="TIMES"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="56">
<O t="DSColumn">
<Attributes dsName="停机" columnName="TOTAL"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="58">
<O>
<![CDATA[故障时间日]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="58">
<O>
<![CDATA[故障时间月]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="59">
<O t="DSColumn">
<Attributes dsName="故障停机" columnName="TIMES"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="59">
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
<FRFont name="SimSun" style="1" size="72" foreground="-65536"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style imageLayout="1">
<FRFont name="SimSun" style="0" size="72"/>
<Background name="ColorBackground" color="-26368"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[ja.A7;qKU'Q6'^8L"N:OOD(W$%fmbOKE*GkPdX\u[FPRjN/39%:^BGj8S[K5>*VX\`)dR'`R
H@_nqqrCg8JDS7#4)pJ7nsNbYFlDG"?e"E^NY"T9AQ$dGFosgje,F*Y-4EHgN]AB>'&!XRu_]A
"9gYBEhrjocg9bSNn%T\9n[*"+6.;]A*J,"u#o7-E(@`kTCHa!GIfU,J.T%<X+jTN;)^4QDbY
b&N"pBpKs?Z++P)o$U=OS5;^Z7fM`BPGJ3o8]Ah<;/*K]A^Ms)7k75bPdJBJ*j0!']ANWm2U./<
[(7A^qunNua)PZ<)lX:qKGGLmeu0LS\c/siQ>@u4nBiRd7GolN&siNR8A@CsAm*l^#nT_IKd
7P.2Rqt]A!o^HN%W@Mj'(#_U9MX17f2C/M`0dX/)!a*fC&9q^f/g`HR=YKrC%4UTt4Ne4?/>:
mK6d%Xkg_.ou7L_BN9!MGPJ#H(,==#aB'p*U=,W9NCH#:UkGmRo".Wq-"c[jf&qT7l5-qEXT
akJ**Jh0gmhgr?.ApY)?cTr;,0dd5h-M2/ooXdVZ>SAY?a!fsL%k1OiF04f%#O"D/dV!9%(Y
ggo%D*\hRQF)c-glD3^e%giI?hc%IQ5@4ud'(5d[V^MtI.#/YP<0HY[c0W,Zl(3[b/5AQmlq
,K^N5@65[/f>>:i^L`mJd4<anZ:GYbYeS:DPp[qD;s*S[l;cK*UbM2:[I'("p'm$/WnFJMRG
M=i+Z5sjO$XmgHhGZXL3jHE*l^#A@8e7sJP^&N:ajG%//YBE<a1QN(=TK2!u>(U2X7ONcAR!
T'?]A8R_Dh&N+Q.m(bkjo$AXqIXU-]ACi<$cOS2j8jZhXJHiZ_P&R!,]A7/YuPkTnlPN&`G!U%)
Aems\]AXcO>=<qn(e\D@.Z7i-r#TohUim8FS[/XhFs*,]A3$-'Mij$*&SuZ;6b.NN00JWT(H)U
@K4fCUn@>i0R*^CB\2(^@.EUb)Dc,k=K57nINO,KUQ?Ak(REi'qbpD!TuNKXM>j`[1BdsiLI
Lt3%sGsJLBG\kDj6^Ohq%<b3(n,DJRZ_AF33qi7?Y$9)c11%[=b?3j-B?P7Hb4-3plQ_nB:,
X,OJ$A*fk?]AFar6bJ3=Y]A-p\$;DS7MUcfV1d!(*C;UN6jrDenoN>o[j=P9L@!Ajthd+D35%a
:^e4/8`K8RG:uIl)#U/"&HP+#Ktu\tMl':f.:0)*Y;bR`.HoVE3=o_g[Bp+=bi?]AdZ/_K:4:
JQP)Ao^R0oQ1U-dC:%YIIerChm4gmr@n]A_U%PDl0.L&p=p':WW2'N8%/X!<EDe2l[l%^mkZ8
qTq<m#mAaWYQjp%Nj*T35_C1s0$(Q\`gB!TQUpF^'&=Xiu<G/OJ7!G'V-MepSR8>R]A\?9!(W
s$hF/"-8aobX"<ci[,RUa>/]A7F'=W3i6`mSNS4<,<$Mf(%R&#lof`EPpSqt5jqO%&`i>m'CI
;l*_,s/j$Tj1/5WD`Q':?t#@]A8;AeD1i'6YC`f"cq3"6g99*@!%sonT'@8(bm3.*U2(O7(%f
=;W=iKU(kO=1(27KJFB[^-k8oTaR3+iD?)Ra:.,G["$kVc9UZsg*6T_edq9!5$TTU%2O/*c"
-XnFrBa:_Ol^Q+RjUM:'qBd@$oe_V17V!^tK#L,3)*%?(OpPEe?!djkZ`sco<4qo"@08BpMh
P&rs*tt3/O#26*5m-gs;.!MTibK1"VRX>DgbVM6[NSAMs5)f)Rmc@4E$b1SLj<0/[lVG`lJJ
U*WU.bH!lsM,b1;6@P5#(%d-V)0/$J'u#e<XNa@FhLG*NZI[U?*:f,c3q@/sM,4YcWjHm#V7
od)jap&!]AIMcIM;-RH1bB7k3X:%^IRMtj=$mZp5:C%u%`l/Ycl?=mT\*:ap"Q<gfT_JJdgk`
X>j2cL^Ee#0o<c`-]A>i)OMlMs6P#;H;O>/s7qu5K(KUU!4]ABZ/Gemg"gVW`u&cVe=t4A!EhU
d2B"aBeqn&8Ae.o!(?Hr7?hT"GIM\Yh>NU9]A$rnh0YB<!93c8h\4)m07QR/q^A,90uk$XSh1
J0DebNEZ:0,F3n7o3KLCrc*l`9-JC866@*"m?*Kq<iEN7-kJQhEaFj.2nf-@L,ZIb;@uhku?
QXkbdNUc\V$MKt[9K3V(D3*.4cthR^%8lK6udd'eYUBaV-&Er)@U@uk0n!+stnH`$G`5_nW/
kfo?RS:qXt2*jg:&tM^eZ?(jIa5KLr%@$58.2fB*aNmnLgTEb^o^&:uYI19ub@;88-*%&_"9
5'QI0G.ir!?EB+jHt9W`qT%7TD*eWB@qWG_(P480Q3&2pc'd:sDL<&6C*lEEnGBIlB0r>\of
s;DT,Z:!m-3$G$n6*YlrQcAJP]A7TC`GO1@?8#H8h8XV<_AM/B95"ls!g\TKcU)hDYi+GA=aV
dL%[O'#>ooMD_fe+B*@YM62;<]A?';UD7`Q]A"M3O-HF>:W"l!FMkl!YC$M%ehmZ>1MnJ7LF:j
;&(EI3#kl#2?_Dq2]ARd9g8N1\sWWpd)t3E6M@@KG7qO".f*I*pca2UW?$\LCl1H#7G2$.Z*J
L&u(VEgqZ@j\R;\[8Oj^b8c85g]ANA)OL+`Ii4tq.cM\P)D5(+^f(',sfKbS$N[_5?;uTWb/!
ei.KD`&/OK><M#+UH&cDfcNT4&X69C,@YJt]AiNqA:Rk8%QkuWLO&>:'?&u0Wp>l./U\tj0M:
1mC<QdPM01R;EMi^/h":_P1ZNA`8%KQ#o+_>g'_=V0]A2'lESOk1?r"=04@so"F,oif*FZ'M5
`]A;;`4Yi[e1KK-]A20f#9n"qf3S/EPm.''JQp+>aZ+4db!\;@H=AKbVi.G9GHIM\I7l2/J)pB
p@k&%'89RBm4A0#&VK5S28+a4q/2IhAiT+Y]A?!F&e11#0$D8^p5g('IX)NuBQ_QJWsDLXuY_
W'Rmt5P7Qt$bNJ%G#Nc%ogdXZ)02YDHb9VImWoL.lZ5c@P!TKnba?QV7Tg$&:Rc!8UXWg[F8
b+Y`DHI@8A;9=pp^d]AXVU(MHJWVu'jM(Z?&P<W#.?^Sb6J+eO,FoW'Hetop-%R8FhM?K!dC=
0kjQjO`IJm4a)R5SY&7+gX>L@[E=1;"HR*Q$fs<f5FQ7<%+iq#@!mp?1_tn[_<!;C1DQI07n
r'XSpK38XCfjDU:aK@UoR]A[-b#cW?CCo!@j1/;joG!(j"AkG4X2FIeV+\]Aml`Uj5FBBYD=:L
NbGI7>oHa35]AW#abJ@WH+HBlDKTIVT<-oDmb6>F".'-t-V^["5Q/`Z!#9^:'\gHP`13gJYqe
CA6NOVo>^O=rgK^29!u*.E)'94$Qq2-g(TRlAS.:I,a7iGB;]A)25ZN+"&qFl.HHe/X&@qDRi
2+XZlQ+gZ'd&-n*E%8(]AVa\VDE;K-SpRHX!L;*:KfJepi9FjD\2,8=*a@%M&g%Yo82r"^Y>e
R-K=lM]A49+%j9=*DR"4r'7!0B4\>3[<./5AQlQU<>hl)WaS?_smMQ[h\B*n1_,6bVO?,o(`9
bA5lT;@UI++)O\g]AGo@48^]A@DG!jS`U[5S4-pApP1OF84'C`FdOFgKZX4S"=O^;kLK(WWIP;
6(>DrO<l$O;pEC7S\:h]AFUR@u5"I0i!Bb<@V8[EuATj;[gB!O"9+X*tgdZ]A/u3+LjI1RdZ7:
0]AVqt.:be@=o[lkqb,Q^jf1peeN6O9jglsmP:lG/3ops(9`KEOqljef3S&o`"Dnf$,0DT;]Al
RitmK_-a/,TfTj*HU7#kXugV-T*MJE+`m`Er)eM/0:InNBonZrc.I\b0/[nu>#Gh(qk\R=tU
_oh]Aa!hf\+!YQdRHHT,C1[e*B'6oq"kW+WS`a';.oJ$%oHc&Xe`\LIV=Nrbm*pHJ2sUfEr;]A
Wb6&>:[#fN*#?%R+-RD*Dk"2Hr_=W*d137a?TXunNQ>bNa6RUl*rFGFPRq@U:$ns4fNjt,MM
g<25XfQ:th4Z=SiJbk;7ABFT=]A!rGOaj58A&sh)eV_<V>HfK0UE9!31A[>ee<_&d-EI#^:c+
4BW.2O1N4M0*4[4p$>PSB-FA<:Ec2%9Hhhne<D[5>bul#r>4i71;"j'U#Ec4"F_^NH6fb28L
NbDs!bu^`^\20"71QAZAF;d!sAk2T50c/(JD@RR!nAd8$oaoreA5;8B3)&&W_,l'k6Xgd*!u
o[,]AD66VBrcfj(<Z^-E.!I39Rq%X/-39ip'&EW%iF0d]A(.JEJBNejUQ%2U`bL=98($n=-p<c
RmMWik"'-H0Mi/[KIHk4BE/\+sZ#1E^MdS01p^?0&NCCEkJ!)>sG!iriP(7_]A!k]A9JP%2%5?
QN$5E=ld0*O5HBPSW'8us"TfRgmhd!$GV]AZ='^7tTGm&6>k'+S@82tU7_+!SEg<H,44*>4FJ
cN*90D8b!qoQ+Yb8@s%"!c[46XpOQ'9]A>)Cj`5k?A[h7o-P<'P\2J#s4kZnlh&Q6oEBm9aps
X\g"#d3tClJsHCF6IA9JsMCA.!$':1*^\`1Hd2PC:ZDYWR-K=t+Wn:37soBU!UJ?u.)9^*W7
S<>1OuDNu5YF7lD9q&nRi1NUH/Mr8&W>#JgckBB@H*n-C:\,'/8/Zom,D5kgqBb[N$'kq2RS
B>+:[HHf",AZIYs.K.8dY<t5-0;]At`]A%o87"D6(TYBk%1m<;D2E#!,I&X'B3M/4=".4ecNuZ
?S5i+dX3$"&P!Y=>XDn+iO^Zh`O=LVq\Q\L[k/A;GYS%GtNdniG&X**LZSTq(I836&$p)cj!
QMZ7ON$T&DO*T#cJpVp%g3dAU!D]A$X1-2'Tb:.,&^:S\C2WRj@+O1t[&(o,,&BC_b1Lt?l\S
:AaP66'XGMb_3Bkdh%<"gHuh9h!o\3,M;Ptj8Wja9e>.0FF;*Y;0I61aiEJhD/81jF+qE)-T
@.*2dugI(Od3b!%?J:,bu-:?\[X3E#0bk/nU":=*k8OVJ4Cn1CB'MLLVhT7tY@s]A.j&)9#'e
>qG"@3tDH"8^UiN\n['K_ES+Jian-a_hCqoDO=Cj.^u"N9'3!)e(r\3d6)/*7a]A?+k-D`*QB
>-&=bgsLj,U^CfFK":H\S:j/(U:LO_amZFRf^=FPm-)6mZki4K'_$F_#e^#OjP"p&W+,44A]A
VsQs!\hRU.nQ4-cXiG:i;Zud-%-1j?SE`rI,!($IbN<t&>O4%Y[]A;'0+JG2MXM"d8j[40\lO
G-PB/Z7ESbe\+Bto9urZFFPp>2T#GlZKLi%faYFsj58,CoX/,#7;>UHffPn6;J.,bTIF&.*2
>=AJ^b^p#2m8;QS'b!mVl,H<8'q1"S&+<@5ArE"^H8pE,DrWfVjfhj*8bP5*+U`fklPL55RU
=2GNL7^14&R3c[kT!UUo]AT/oeWYgYl==NkUUb+d)UsuO,PRt-6C*!2(GaW<6R.,iEi[&j?a2
6@W_%FShL4"eU0(mVCiqslY2?!j2*W(:/+$sN(M,&YlEKP.kU@U0HdHo?GHd1^K@V8d:dgHE
-''l6iR,mi^)DdiE9X:f,T8d"f.[/$2U@?=3Z'XCLuUN[`CW72r$rj^Z7I%2-Zd5)$!\us`&
f/OX5rPV^>;Nt+)emm=]AGDQ5.oFuQRD\<M8hC"@t`P"%baqQcft;7B'jGYGKj4km_-53H0U-
l8DpVHl0bpA62mhi:%NI^Fu8++^+J07O'-(q!@f>uq>f5.`1Rd6Mb*u:UJHYB?'GC/B"oR2R
A3d?0UW,>RTnSXpi3V4A3u!-6J>(-GN@>d%f87ZIml/]AV>!]ASbgP6,&MjX-,qt6mr#tg1^M(
hT2r."&VRI]A[27W1Sd<MX)>Q<lhgXtj#G00`^4Wl*`Rq`t*;4Ke3HUkDZ;LK#$A?jP<#2HFt
>m[Sn&dkOt9[CI/Qs`T\$H?13it&NRrBUSO)iN_3K=5+grgf;"Q5[q#<26R:J[%><H+:gkaQ
TS@AbJ*GXe1<c("<`*:l9JXKRI:8IFi*i.rePCe,A!glQ\/N<;5D,-Gu1@gA9An6]A7I*^8fI
Ao)%+UN]A5,,Bt?p%%[HWa"VL%`A\-htRsj-?1A;4<<9.gWD2E[8J7NH8jY(6dYET\Hkl+AmG
"13V[r^*s&SQlGSfOV=?4K7eI+FZi5$VWI^6,T:PF_Y)HJqJ:*mm@/QhCG)Wc#f]A\JeVdWop
.k#lN)\`i_!S]A&4!q,,51HGHCQpa/gN01nnaY/BGr%38d.S>OhD^+\'#GZk*0?<U\Oa#9)>"
\YV^>q`r#DB1TbB*/WKP+J8B[q3`=r3BD(EKIPJNg7-[\[n<h2/6&6`irFGT`QK=G#r>^I4a
:RiLq`c=fud,qf;I?d:#tfZieMsYT^WP)O/Pt.6'\]A4!cd:>jZ^e:8$og9kP!<)'@2p^>HrC
Q1LSd-+ton1*b^QXT,93V#\m/G.=*0I#=;t9<?R%FEmk__93@(Oi/2^uRF`X#^,6T\i'"9,Y
75?K)YpZLV8%N/1E&DHisb-%g_ZMIdsW(\Z5dgG;&C@^8`kJ3mMajWd#^E?Sf7`rV]A#ET&G$
)5qNh"%h??TjU#8'jdPIdZ2l(j;)!I45ILC^5"FulR#<dl?Nm&sbGrWN(r+XjF:KnE\b*UKK
go%WOVOsTd5C2G3%sti'_9Bk]Ajpo&sE;3-^cZPXHl/A3>/2ZPP?P;,m%_aM"nER-:)a;W%"5
-THM:_TV]AODgrY2gf@P@lU/F8[-`2HtPOh'I8BS8;+#+MtcXb]ApE$_5#-<CQ2)(6?)sB_8IN
S"3s<m$7G'm4`$LC0H$j$r:QBO4QHjgs5U']A!s=j)?]A(d#[`35$R3U^0+lS=MX;MAq>O:RPm
-=_apgM%ohC:=>fse%T4%s2Q6,Z7LE^8bM;'l_Z#Lo^Ggg[@/GHOGe'^i2mI/Q@d/;,"kD=@
#k)#AqcOGJU3H,iPJXnu"=0oi`)_WXc4e;-oKmgsFu!,ZDsaYq$,%a;;N%/AgEUpiob+O1X$
&ffq#"\mi4A0KV6=sEKG\gS3S=:T+`egE2qJ:$PaA&&UCL?C:[msaok]A"6FKh*Gr#pJE<[$-
0<'ESG=]Al'Qb-6Z^o]AlaT&>h03c?5&67WT9[St]AH7d%Gu:R%El,mLAVcSq*&7SA4'@c\Ejq<
lNuRjJh,)^XeZI+,b^"i_GVYM@OKSqmXekc!a/Qa"-G'T*Y@F8B<6^%u>:YZia`D1EOKn*HL
a`SLfhEVF,OSiA_(Ig5i6Z4C[BcQ-NcI_FV@lOkqPgZH!`(_(aFIj(XrN!uoQcbr0o(\0\PJ
%JJ=:G):r6U&.<=I6^fCWp@L8(Uh0OT/U2m[qBF2ArN'+HiB-U@>89UcE2["N^s4%a9(:O>k
(^qNc6<#t22QrkFk`T#_qJ=i(P1@7[OI>NmR+qY?guDkkjd02_de$LK'(-F-TcmaeC*up0N]A
G0pkmKZdh#XL-l*.OEk3,o9N`r"A0Kj]AD7)Wp*W_rT:hG,5te=([g2rsbbo;R;1XPL%$#Nb!
qOjugrhSg$Hdc#fl26,6p/]Aeti/llV0ObB(+(/0DTho0u8\m_<,qQf@n,YFr.6M4na2F+#[6
/F9f$_>5=)n)/*iG*,/6"dIa^@=?9^*BJhpZ`C^M,"+%W491[P0<VK(A2'b%A+OtIb670o9^
*26pY@ENf[ub9_#e+(%:ELE8$BH9eh+\m[(W`\GS.6k#p!NIoY'erCXQ_25I%h1OEts35'o?
q>fatD8>=mIb<4p^aH/K>##!QE@1mAD$.Z,?,rK]AK3DQiA8a/o01M!;3UXYi,!KMr6<,D@cB
,BTo1l&1.HbS#T,QTc!HG>!!ki!aq="!ANUM>;@uB_Nd&qWW:Nk3Z]Ap.FOPm3SMc=Lk:nuXk
EV#c&)dh;QA'J48.ZMa"M$6d#]A[@9#+KQ(Z`HDl>Ua$3N$0<<jc]A09B0mLPoF;i4[tioU\H`
gEn(lSI6i@B8r?+6Zo^)a)M!0#Ph8J>DbUlrZ2@*BUm4LZ$go:E2D0e[2^J\tron/rHr^HKc
U1<I/>0HO=C1=[Cri^l*\1o&;\EjC:9-psWb>_fcU=pT(s#)uCW83VH-nb(la1Kk8VHHA+;@
eT#\JfL'!NkC7A0j5@>[VOVXXVFOCLN4%D3D.J@3*+:*i@:$m'"n%OCR\":-q8kmtk(o>nm6
fQ&0=fL)q>Yr$&s<=:::T@rJTE;JDX$Vdp2_t<j<,W6a(0=Wh86I\f/4:7a!t+6FR5:.]A"=Z
?]A`HrmABrgC<4l4HRU;45kLHCb+K!D8Z&mQPm]A)F)?ZGOQ>T3\6<ks.XeOomfn?.`173mSSW
hrn0NC)NZ5`$Lu\!97L!?ZIq7Fd":IQ("5lXH1)3%r>I^5?,99E$F$RB!4RNsq+902'6k*MZ
oS&FfL+;Jk`a6ZY;6@1;P75i&e6[H)KoYYD9Lm9TjkZ,1u:(+Q\OiGph[+)FAZiH#3oQ.,!,
f^SJ_r:M_bfO8<5-0DTGYc;s.lbYR^?@TMYL^75E2,Vp6>/o)b4*qoXnHcsRDL"CT(olRAb+
=OgbkVH>pb&s`Q,CI[(`qCD2`e=6/,<]APh'^OAKlQ7A^lOE2SoM2FT!>cIqob"e#1BIr"(6L
#_tTJeUiCKB"]A#'%qbA`I4kCt:8#Q!R9;kS,gD6:b?J8lS;nioKh-;nE(eV):!mQS'"$WA,/
=("*g>(GT\srbJLHmddPYM2#+O"3l,Gt[!pd4kFn8s8+&ek@#e(g=.@nL[C+]AC=<=V*3+FlL
5$qg0=d\i!8F>%TT<*jf,Q5hpsjG4V[hg^CV^nJOIIhtqeGkV`c:Wb6d44d7!SV_p3`dK29V
Z^TLVlek3//O']At%KV>Z9lL#Qdn(!SNLZ%QhX746CThNXPP+tHTj>&4NcChhj\Tt.[_k$1Fn
J/u6]A4"L`ON)IYA12]AAilqa>nYm`l@!@\R]AQ>E6AnW!;%0A:TA^_X_)JcDA9Sd0#i]A5nJ;rt
0W53@`#YQD,7aiC8hs!f1W&#m&F#\&,7@Z*3E(7ORg^89[i$MM*EY:Gr`F8'Q:(hV&mpRnX]A
NI,#+Xr]AX=,\5]Amaf7G"]A>8lcE5,1'Yo'dCWiZ#P*7l,Fa@MnOm%?sdo;5`(#$f6_fHNP>uV
lYZr+JULF)3;V`mqKCJhl]A]A%P&pkj(3E\6Q?8eK,cY^nS\&fAc`Aigd:94jbQU0_Z_6;WieX
eH@Teh4aT5/&BPga;?pnlG8a-r6fR)6:V]A'9p'\W4dLiW""gZk!!!lu3[``lQhae(N0fL#A_
K<-2W^gt5Ymh1G8'D62!ZGpXRmD4"3*%6)V&+$72-WY%cIfWC9cUODisR8`O&;B577<Z@fH]A
P:s7eHZOb]A%Bct+Y-NTh#:>d,!j7o/PIK4[#H(`J]Ap7R:b.MjTC&Jn<t+*)'\X>nYeqrr/qE
<?ec%\'V.0m9BJ'oZd+R!^dYlL2'eZC.,C0MO('Y&c7riDSY95huD%$rWK=DPp"19i.jZAgJ
1"Rt`3U@pMjT)!^<;l\MMr.7Tt3Jm&3!g$GC[SS=S70G38Oe%<\R"_,$/=$rmr9S,>R)6qg`
F%7FR$A*[:3$oTWX^cD=1NJm"9^*G@([18iJjE9$,D/\8qE]AeB5JZ/n_&21$@HIthcAuTmMs
0e-\ot$+V6Q,s3q$q,Q0aX113_"J[3DiEPpIa'nSTPm;-bQST=hF>Xt58hC!ZFu!o`[h*P;9
m`d6$h)i#2K!l:n8F-FW"KlF&tf-R0^#E'eKWB-O=PRF"!nYmA4f\GHT\AZ,:S=,fCd)G/9P
Uc3uMX^a3CFi[`gE>rXS]AA*#[8S/EYH%"lpV$H[;KT#7d<\l*caAdnX3u`kDNYKJ9L@RnjrN
d4JrQd[j`)s7Z0gS!LZhfXnak(ff%\Gnh"(OW"IR"[k5XBS`hYJmT?=FURD4q)q?:Gi!cc!t
Ah^h3@dh^eI05YG%EN[p\l4sr;ZPI-a9HW5<Q-/=I4mo*r#p>>A+o@"r.5u"[SO]A0V.,;;qE
Hr"e<cu.T2%!kQQb^,3.M1<Dn4,\4*f*4.lSrT&K'>me<aUZ7,D,%2:(3tQIVBDqJstD.4\%
bg,u`eAQK0h<)q8C,G!0sS/(GbX5n%d.odbZ=TtjS+K<.N0,TsXZ`n3o&EilQ-]AdP'OkBrX>
fk$T-A]A1^Z2>EqfrEut]A96N'5FlDO[0c?InDjb0ek9m;S7-9I7NW7NPj_]A>cf&o/NGN[#&J,
"FjO6$5q(X<;f@Rop=4Bna=.nL;X`4boA4s\^CZf8tW@%8l*nngoF>3:Eq)C-#oN:JY;\_H<
9lmTKoi.@SS_XWHX(u9!]A@b^//fpI*-58022!)"QE^">HX[Af*qB8CU#L:$7:<T#OmVLO=28
U6u6$0k!c*Y]A:YpkeDp(1J]A&2@dQeZ1M2Ztk9RHS3*X@SC+)h=>f&W\mSM5LS4[b7lkt*@^Y
9f(VtY-%n[OC4"rk&M2;/E:(Lh"m,R&(g^uimgUfhY%Y76@A18W>lQDD!*sA-RjGGQFj`.h]A
sF,smcN6AAlC!&p/ToHjZnXObo0@PR%kr#MA:giW:#6_dKpC1p]AK=#Z*`unT1K3C/&qJ72L1
='!\EH80/SPJ;:E^-cM7]ANd^tOc%A`l+cE`s^S;iZ)<+]AG0M)s6J?"?hE2<MTL7@]AJsMW<Z`
iL3AP+ZssG9:!;J!=ug'g)sAHS<d>`fF_PtL8J>gJ0Sm?o;\f;?Cf8_Op,?MoD]A`5OD_(EB\
#4IZ*)@WWkq*5XGX>@/K8T?f$FEi0*Q<i*`r6=*J'Aemr8HFFLas5]An@^[b[mVr_'AfA[#*h
jU6.`(0jU;n5BA_bBRf-fn.P>M_G&ed)qMWWC2"KXfD:%IbTO(`p)c&uJ).W9-E^tZ>(<T^4
*egD!NTXeQ`W1@O+-7+$48Q.^.8]AC[pe7!Z\53";FDeO'H@kNjQAVpQOe<6O=ZrKH*_3/.oP
OCYT+tIQE6L.fmUVMEFCr<&::<,oBUtP7hZ@Z0A(PUOQ]AOq<4,\@l;VV]Ac>h?,QNPH22cAIt
OHUOdQV#s)=,[=Ii\V,!o5Wr^!=JHajRc+u_O`&5+r8b%7aD8hMY"hAh`\2e83;lKL13?Q/'
!\AS.Q^tqg.ITU&Aqh4sp^39WYr).Y7"PeK7NJNUD;<g$AqZHM'3h=!h6E3B-BF/9`QK/kuq
]A4L`V0"FB-#n+VeKVq:6\o"fPU.@hO<eqdo2dH%S_F^=]ArF0-L'3c/Ho@^p,7s1OA5EJ(8Ui
k7=+\Mq\IaCCoJ9tL/r:68#;Wohn=Nb,\j^8Oub+k[eTq:Ug1rFR_$oT'rV8m[BTRp\2.j#,
uB(pK`L;oqh+m<_QM")M^jAI(Em"j?O=!e'*.R9j@<:e^NFprBLe/>YZ,^MeUcc*S^m1+`%t
[p%LW0?G/9I)l,(Aa<s0\@$qY,W8%#Km<j,K)3s(?Mh*T6k/k!e[V57_1r,J2%krZ]A+t7.OI
T$k8=ST1,,PPnDU"GW:81GL#g9e#1:!pNW2+$0SAEfJjt-@s$(9R"i^p!=#U%(I<nlYrOT[<
caoM'5b9I"\_7@E\Hhit!j(+5E)TX[bUCB(4\(U31Fsc1s#hFk.^5M(,QDTVW;$tK#dH?l?e
d3?4d]AY.s4A2#Kqq1fV4T.sk>4n.a-\a3s_(a']A.7(UX5VkGMRXX6,_;6Gp:L4ZnGKFsqT"J
,qa3l!n+$?ipMr:nj#?o^(5]AQL-&')]A\]A9.V2UWp&"jhpbP91&eSTCB\C<Gt\9/@E[WQA!c!
Q[cQ3s2oi^]A#h;8:ld=$MM'@<%gio;Qd5InnpR6DI9;"Qr=aTNfu6eh2[>I$AU>+7qM0o678
,"*ZHUMV<.^ZWXT;i:.E9JJ@M!dS;npIJ<T`=t`BW+GWkW6Ar^9[sTCOZ#!on`3noGO!':c4
#aeH#I"h>H?:K9+kPc6S?"0(<lo#U"U)sS@'4oSiP(n^C@^YcQcG<0rYIZKFs^:,[.@-+FFF
rLL#'8>Bs`m2E,Xi\iCk7L4D3LSQk&8ruh-!!3/EFH@+fB`b>mHYO+oF:YfAn=1l;Z[1uAm,
O]A@98,hPigFsW'K<J=,q4-<+4`6`fo0)GAkaE1a^E<19.UM[Maqqk=V[B!@GHm]A>7HATGs1C
j_G7)#6g,Wf+6&A=clAXkjd.\)L8uU4Cb*mI4`0YTGMTr'=14J:O?ZPP1OX>Q>GHC%jpgR<-
I4.abW[+J9=:D-)'=%9Bc@7:Zqs;L^S8en,1-i:T9#FCZ)/32Y_o7Y"G*G:7tgfNOb4"j6lo
:b9-!g^@=_gbVH$#-g*^=75oIA;G69Y4FCgC6Qh_j)YHNX#(VqW8&!e3?APs)rY.dZ9Y30c-
""ll'[W:D'9Cl1pE7,Y.g"oPn=kQaaZ^7$<Mp4%p;YZ"W@5>lZH3NYaf$Yc7l`-l:$IJI:m4
T58:js&miZS?d$mHOeL-OiZjM-;?#/)6@S4gXY(<[p#Kr,?*5`Q?ZgH?886'K(%%c$jJcec`
U4/l+IAp=>c%+lW"T*G+kXs6CLZO6=j(je24'"mcR<OWfLXO"e#pg7%_e@6kr]AOA>V<`kIX\
6aW:.N?%\6l;\4H<PQ`;+@J?sD%ngu^]A[.9;JsM\>e!GD/E038h`O7"c]A8ljQY??tPn8a'hL
[*I6efH-rF:8A7^b7,@OuS8^@.S1VG\mCCFT]AdR*?j;KA5"$-E]A)ac"4CIlTgeP=<[IFV*Kj
r4bdZl$,*p/3!`$l@ElnE#H8GQW`M[06=Xq2X8ShER92'7JgC=]AXT_)]AQdRR53eu:c&:uR?O
jVa\NM/gGl;m!$UnXg?/[I>OC7hf_H[RS=HE0"B6cE#g`6pHLETipH"J'm2CD]ABiF8G[g965
_%]AJqS_>ZQEs*C7WCM@a9SsBmoW(M]A+r3]ApH[XWJPAN<T[C;HO,r]AF/$1oJGUj+0#"[(4XdM
]A8qnL#sbAfd?k?e)Xok@CY==X#DmW^0ClTPrE@OHV<<[t5r,J`e1o"cUG#s4+bc"nW(F_qDQ
6h9)W-@:t>s8&\I!eETiMS:K958-GR*!bt.'f0u?&glm$<;^A`,kEjkF+*l**%'cK0()Z4'U
40$/8*t$TFMd4ml'EZB5JXu+g-?HpD>=B%gi*U5/q/#Gh>TaIomdj+!GShoa7QDWQ*Xe9oM2
%@r:Bp1K\5R>D#+!Y!<~
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
<C c="0" r="0" s="0">
<O>
<![CDATA[生产]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1">
<O>
<![CDATA[昨日总产量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1">
<O>
<![CDATA[当月总产量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="2">
<O t="DSColumn">
<Attributes dsName="总产量当日" columnName="ITEM_VALUE_N"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="1" r="2">
<O t="DSColumn">
<Attributes dsName="总产量本月" columnName="ITEM_VALUE_N"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0" leftParentDefault="false" upParentDefault="false"/>
</C>
<C c="0" r="4">
<O>
<![CDATA[早班]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4">
<O>
<![CDATA[日]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="4">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="5">
<O t="DSColumn">
<Attributes dsName="产量早班" columnName="SHIFT_GROUP"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="1" r="5">
<O t="DSColumn">
<Attributes dsName="产量早班" columnName="DATA"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
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
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m9+d8P?535hKE`%;JK;YXTQt$&apE#Xia;"F>?Ub.g!*h$PK.+Yj*>R"@Poh<mq)g-K458;g
DnC[&LME),PlP6>?Z;W[:0!n-DEQ9$/(caGW1Cj3_0Pc?GVXWNKC!q(poPcIlk1pAXI:hV[j
IU*GsV=h2Jqc#)_"O^$[bF8IVtS(j\:(OlVeP?drUS"&/eKX\GgmeoML,Mfl:P^T'_[`L0nm
quTPm)0MPhk;_#)u0P=dRiGJ(VOL$QeTW+?^KU2OTqs`a?..SVYO?F1`\H'?#c']AlKKJM,uh
njcag7M<f9`?ZocUH7[\(\12#"OnD69>N0LM[N>`?#Er%gS"GaS^1JB$6(W+VYnj4'9Q?Wu(
1!5=@CRl=;l!a'=.J.f(eCH[A[,\Krc9LZEIMJgnPH<Qd)dS6pBqLfK*]A/@'LV6X&f\FYqfL
'b/8A.US[+>XZ)TfJ0bRcF&^,qTRA7?5H9URM)0j<,a^l`DZ"@5rG&"!3An_GTsoRp$eCb@q
de7s*:_phDO`tZDQYOZ98=*k^Hne5tATgtUE[B="s.`:77e/upop/1P(@/38DAUjP\e-V%\>
59I/W@Y"9T"4os'o3aF(N<t>_s5!3>N=&gReY8+SuiGZMg7l(]A<Jo;*'M`OC[X8tlnakdnZ5
Ptjpo$g>021Q7OlRQlf]AI-9nZQKGCN@5p?j:j\=?1gmHlC.frOGgbmQLh='%sd!j0:(hi4RD
fGYT;X'r6mHJ*jkkNdDmmWb]Aq\kG8T6`\EKTG<8M7]Au"TP+S@Ilc4F7WXl3<Xq7(>k$iMn`'
CD!o&"G1HS!Pd/_CH5$\.[OA$UR4N/(#$*Sg"'W6ua"m0&,6s5"QoKA=@Q96u]AMr;84-pF3S
3*FZt;qOJ7X[-WY&:(t1*l&Q=5I8eF&MuA(&Ys^S[q0*)"=MsXnl=sTF4bJYZMQ_lpiEdP8]A
dFi+oe,McB[b@D5<d@J4@+a?0,SEkDb&49q.U0/%3,0L@]A<ouIl+PQVa?c`*f(m&GfS1>b=U
3'b:#''+EsP^0:+t4kNma>2gfkP$;oRQIrX_t90::J6G.X.o)jFkj9%Km6jUFN!3H`RR\b\$
lYjG!FE2fE.?nF:Y@]A(u;/./2a</=MTD;m=s-OAJ+[6A0q.u/crG;:7.^TAR=nP(8AVnjj'G
%dVVU9NFh;9nio>fM!3+<!@K8!SSC%lnJ[pVF7_+pa3`9=IK((Ehn@AWZ&Fu!)u#;!)=/n^0
pPJ"&Gh`'sD*#E\IRVarnAj`lhC)0t%*Vb\FCc/!"OKS?9nTGO\YfM&LVIL^pi'"PRWuU0V+
asf(<c\5'KL3V#)a2Z#a+rCR@p)p+^egj+V-r4%NR!SLjfhrS5_->N%3m[LhX9PcBfm'dA4?
SQ1_i=SP7*1&[O*0W]AQc'uVB&\/Nn?4Dc+:d*o+Ajc=Hf96@d$K2ES*u<B$T$B93h#V8*Mb^
nYK_KA<'K4X?0+_5\ZSM9LN6'e3^1s?0/?qmQM1==PPE9h'Z\Oh#F;YPaJV5<Ob!YlsY9e^9
$+!4%5X'\p-u;Jd>'Z8&]A=rP1Mrq+22[*FfZqlF]AqM-N`R`YeRQ-p\u[Zj@1VrSgBkN8bVbt
[$l*>`nkaYY.Qac`0j<Q8D>M`gIM,DofP`u:Q':+9kHHJZZtPlr9/9`T;=:g]Ae&MhUm!-W0M
.oN92\=0L+3C.>]AlbW6Q$p=Rp8B!"eBU!C6iG;=-!B%a3#Q%#M)m('XL1VsG4a=T=6g?>$V!
&X\1S.nDf9nEq-Gd;K$0!ia9U7Z&u`JA3U_kQ(O*Wl@gqNEE\BpB*AOuUS1P*2[q!!23r5Y7
afpn5DP7\!8ek]AQg!opm%_hOj+7jTahNWJ#C<S\@b`5acmk*=eeI^?EU$0KBpTn@T-b`4n$+
@1ELfW6HpB&aMNZ$/J>C;-_8lfP&Vk]AcKS73-p5<jLg?g(VuTf&kLLIg+o`N"14f83>*aMk,
Th&4Z`*&1(2.PA>`f$T.u,BP(rn^8)-%]ARq"(FE]A"&NS_O\3qe-&CkL'alDa^*J-5GX+HLH1
LTUP?F@\fj/GD\>,?7gd,2!L(i,U!%lhEGlp4_>D=,Eg>K;I)+!ZHpJFXd`bofrkcUB+V)*:
c4lJH8lj.=OXQU6"\k=kcMli7?r)sp2Q)0NjlWPHL%_pc6_opQE1[UCI/=b(/4*Nc:I]Ap/Jg
Q"Hik<lkJ>T/.<q7Yr.&WI[Rga@)fS0K`&or<Yr?`V&XGUjd'@Nl+Z8e$\>'kC%!,.@l_@D7
e^iALNAP<o.crE@4=il'me1kbilB9MZXH?JJsUrV=h$^fpkEJ.nj)+/'i=oG5PCSP;L(Is5Z
&.-1NGjbCCL<SRK"3p"%b'-H4@lk*NP?U,s\"k5&[!PQ=Kf&M'[!Ii8KMs.BW>uWc<pP;)./
=Y\aXng07?7TXJXKb1RX"I(7TWcc:VN2f`hqOls,Zt*3r'3Dg*i!SGJ#dAFXg5$=D$3Bh:*<
_jccd4]AUt_dR@`CiHDZA'qUn6R<pqr)T<1_F3LL`Y*AJruSfUWKkpU\;?F='u0&KSn+b-CPP
dk[,\:f.C:5Xf)(FI2/^b*)>NGGk__3-0'Q$h$7N!D+mj7IE"?7\$DC+YqY#!6gOh^>7T+Gu
_2lDOGOS93"um_aWm->,X>2_8fVTq]AkP2*+s!%Crmdu[GMeG_'kD<Q1_8eYu?^q1,TH']AIf7
goQ="AB[8/%UFi8$&051&n=3O2F%YH5GmgEfa,Q)c9A(WW+t#uq5*e?p3L=1HW=G]A21?\5ps
(@3/Wel?%Q*)U1Mp"R(.ZtC\5Q]An!PbRIh=mpT^io`g:!b%*K$A)#dT%et?9mu4dW"O#!jg^
Lb.0*?o9W9_(%`K%oIKM:")p0[2fCOt&J5$Pc?Nco7T"ReXM\[!-PZl24Z2^hSo1'T[Zne.A
R'L;`XE:uBQe%8=FVOT\]AW3%Gp"j]A&YSL+2oC/5n4Va)`"+CAoUC0o#^B9384F9e4.+%Fo$b
Ei-@Y3c0Hs+2!3sqr5#GPe,`eEr_\\5rQTu._idskAtbnn2mT9XK>H#'&(j#RMo'n6ajiW4*
MC>X)\*'fUEp8i&FY%%5(Ge@8hn/"M22"<p@9+^cn$45M#OImf<K-Fs*J[LdG:+SUL`kc>p!
VZXc2m4@?q^*!oXChi"/)6hO/:^C7gqh&uY]A%GF)<'+9]ALm^5$tCrjEucO"R:,B2JV\aNP-K
?l)=q7"Z#cJkP81?spea"Ng0+Zc_!i@"F$NTL"q5a8FN;:+>RpI*n8%)4lF\Lr9#KF--P0R&
^"8Kq%]A1/A<.rKh`bSYR*Im:30&X#[GlP*a;$I>GU-$[GdqTH3YjZo?k&*TT:;FFXSG,i7fS
oj6"<Y5Ic!tc7(_a++EAN;O3(KmM:f^%JY+oAAJV"1#EmRQqG4UF^^cp/KaOo*B2`6^*/s(h
Xig7KmoG<ngJI@3Ok["u^!0qNSZjA"CH[LEs^sVf,&u2,N`);PZqOX6NbT!B;MV1c^OAocMZ
@\R^_LiU@Qqio'B!g&nhG:k#HPcU7-LrnAC`$tY%qf6+I&cH/SdRp5l.bNqW3j(k2(dA?aHs
B[j^M-[PP.Nc(8=l:H=m-F7[UL#;u'f'<n?:#l/;Dp_BWLCar*Ms+,YdrdT2M>pQDTb7T3G/
-`LM0`4N-]AW;['$b9;6:78i6ldG3&p^cP>>r+XQB,`^5tEB]AAbo32.Hr7?gcbf=i?N.11bAq
nqhCS`tb.:7XSdN$VXkA8/"`W0)RI*jK#!R,I:J`q.:e/<e!O/2C&"4>M#o0H6<,7\KNhfKl
R7ZK]AK7\8e.bc"\Ag?e58YZTI&PN+S3MW"?Oeqfa?N'Nmfg8rUTa]A'rXM1ceeIMR/Gm=/QMD
(la.RT>`"p-m,_!&)mCofc4_>a@R^MPgrDfJ:L`-UU,i76aY0&.0:]Ab6eN#1d%9LqGkPLk.3
'GV84iWk`(*+a;q^jMt&K`d-lmY,<AkUB8IAG(iU#N$S.;Cle*s^4ah`OnBB6E+3!:f?6)ak
d7<_d=8nj1g0G*<HfgbAA[i"46dVT+DtslP\G$PJ,dEs_`k`q@"*Od5-!fVf;Gg.sL`_]An=Q
6se4<E7UinkYX7;upl0cPl@R[<`5A$.&W!rrJLB/3F#3;/*+3Wg49q$Yo"0KD7Yo6(J.fd"*
>O225lSkeRqDeP`@DM8ahR727bpSt=WHIsJpFT!%:hq<dmJIEu'+:_R`MDL0_'^uB\aTV(+4
+4f=CaEbP9J(#Z"X<*^CuM9aHC:H^SA#8-B!\4C=,%u>9H=*dTM'ORC`$GA2g"ODq6-+$..`
1l?,$X%j$.a\)hX]AP#RY^#&ra!(#PBm$gUN(hi.QiSn<C3^7=PB:ZAM=L$h3;_;aJaHfA#&'
_`Z+p_W#/-\dMI_+PD_0R0/@qj(,r(='B6jYZc5ugU%Q_/KY0=2deI0;WWd7E9P&,P+?4l@"
u9RWCTQ9jaj(&Xf2a(%0t+RL;q=uQ.):37[X:f6HOitT9+nMkWZE###=d?'I)aP&d=;b#ZGU
ke!>&VYXGo?O2>[iSN6u)oS.^jJ7ND6D.*G2W(EAgbN]AINbp_FEg\/;n*a:g/de7L]A5M+6*I
:sQ7_MrmkfoVFZF;NN!"^H4um:M_Gj(OgPp<M@JJQUjoU45U$9$;cC^s48dAuik%n4/gqd%;
q%Vf:[Q2,1m`=NI5am4bm4VsQk:O*12irU2FTA8jt,_ae6Q40fe!n0<2aekY3W6jF'\e[GY+
1(.TK2,Z+SPIP0YE'2J<ck!%+mI]AGE_tn[(ALYsF_m@XuhE*nq((K"dY^1%u+&*T87nX^*8U
i!WPu@,u5H,TV>1:oc/")+PBt21*iXFg:qS%#]APiN&IhYon7Q:g.,8,ik~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="false"/>
</body>
</InnerWidget>
<BoundsAttr x="94" y="35" width="250" height="150"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<Listener event="afterinit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="UNIT_CODE"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$UNIT_CODE]]></Attributes>
</O>
</Parameter>
</Parameters>
<Content>
<![CDATA[window.f1= function() {
	document.title = UNIT_CODE +'热拉伸平整机组可视化画面';
	var demo = document.createElement('script');
	demo.src = 'http://10.70.16.168:37799/webroot/help/svg/js/Q314.js?id='+Math.random();
	document.querySelector('body').after(demo);
}]]></Content>
</JavaScript>
</Listener>
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
<C c="0" r="0">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[='<embed src="http://10.70.16.168:37799/webroot/help/svg/314.svg?id='+rand()+'" type="" id="Q314" onload="f1()"/>']]></Attributes>
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
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m94d3P@keHQPlZ17F^%k>\TNclGe_>JR$<C`a]A$Nh&'0H83lKEYU#)K3EGO)<Zn4sVCb@(+>
V6>@'FYg+`ruG&g^R^!sV:>`,LEp"S1Xufe;(H%.GqYj2`<8q1mpWq;10-4holqI,BW`OTbD
]AT!M[,>hlf,gUu:[`>.^uo"/P<\Y17TRX#_dQW5Zm2fI?<QEP.`85@NN9"nY<gtVML%_o$>i
G`sI:$.5JCUM!*Mg&HPrT<Y+LQY"+4"ju*[HDp[q]AE)BT,q\aIXAV>pqkc#`>Ynl[)RZY*Qm
$WC(G2Xe'J]AM)TJ,R#i>6QVW+2tjl'[7"*)[l(1Y;r6MK-sX>_Tn8#++nL),\3(/Wm14a+b!
Ro2``*]A(6ZED@(kpDu-a-12g'J2h2c=9L9'Q#G+m@p,37G)Io5=IunWcKdGc8_!"l3F/gC;@
,q85Je"qDM?+%r74%ap:2[E@Pifd;6Og_oVuH-`96a2&]AEW.@MVHMkr?Ub5j5(.h8J?A%KG6
QmW1aak;V2UoC_j-Z$:Kbp%]A+'hQ5@-Bu+EhW'\7mi8*`_K^N%K9l[Rn>a2R_Q\o[+<8Tmcd
Vg)Ph!mIg::l5o(9S,"_=P!mR/II#lD/3RYSnVNTI(1tr,7p`S4A>lU(qIbj9V>6k=Ja_hb]A
6Wi0#d&+o6QXjq?/P2$WV4s3P+sp$#k4&OLI)WbH+DHktrd7<j5@5H#[d>5E<3F>%.br/>;W
&#?Uq%PIKG7sYq@iI+^lHR_6j,OYs\YMBuAhLsU;NBE$Ikj[X$M^56VGbmCN,/l[&ao?MZF5
%9*NaC,uI=m1$/jg*(X+.PerH7c-B/kLb@bI0gBe!Fa3-C#Q&O),gW7DENBNS`8aeD,01t;A
MZo*MS_mAsf3KH#S897.GDTLss)UUdLrGK*;0_Or+rlR97&+k&TmIf`5;!!^X_pFB*^Tb,2.
)J"E*p4>8k?5G&0/P[`4)505VQuB/&hD^F+:k!Kf&Q-<q6\.L9n()R`BJZ'.K&r6(%pflbjL
akr9q5@<0@,+o+4,UF7Js;VB#;)i7g_U\QZ/aTd*nY:p9XY)=,!3!khVe=4VIRl56^=Q'V_r
",7M<V+TVWq16HARW89)ZTk/`ZB$N`'rncsV=t6!Xn9%b(lCA-bTD2.&j_rG;>sa)[(/89("
(=)$eC:q7TNj/6kO")e+n3g^&*OVgeWtf8."s%"T$%$nXJ8P,YD+fcgq<4-=b!8kdM"iQ-9j
##`kfY;Y4-TfjR-J2PZ.GWrL2:k2P2<=!4S_08UU$//;Lh6\WtYV-"@46cp?bHa+uQ+/Vh15
MhT`k\+SY6aKJ.db+e[_dk;=;(8Wur<J91HIYA%hJn-]A0d-Q35/.anT(uT*#b@AI,/Q.$4no
*U>,H3<hP5=na?a$hQ(-ft`lJeYN1_`OBD,6bLAhOVh4.:eQ3`g03R$O<#3FtgQ'+8m&@@^>
]A3$i8[==kpXgCBL=R-uA15XDY1TSXk5rMW"_Cd2tln[E6H5ZHnXJtZ>W"#rCV72UFga3nK5)
@a>c7N$42b4_]AY9oPPlCO#ueN#j4HH1"QMpjTp_qC9mGG#]A>OeNq*`+*'?\ni,OX`VV?/VVX
CcG3>>;B-iA:jFaSZ]Aq3++RRq8hL"b0q[/,%!DDNqG0gHGMOIK3?i.DHmd?#k[Fd9"PE%YJ%
@r!?;';NXZ'aQr=S=amS>77fY8DUueDcCj(WQ_(oM@hi:6L4^)Lap(161JU#c[+a=08Mpcm6
8H$Bd]Af41h*hlu_e]AG"/>SZ6)&0l`ckDE5$2U,H*a]AgM]AqP"F7dP##]AF5rX6LtZgeF%!=U+I
7K8b\5rnWqc2c(f"4j:o!m=Is:8)3\-n(dXkA&UPX_Em8:Y&cL5tVP;.t1#\<0Ulf_DZ/WYP
21Sb^Kqg*.0$6c/QeO!Ar@g+Z'0h.%%kkgZ(]A;Kfeu]AoEU[9?2\<^=+5Efr^'"[7IU]A/#/[-
Aed\M9>m%fC7B07m).^VO0]AU]A.5(2O'\#;tr^RMoeU4sL$oH"rkXWs6D5eg/,,qhgnN^jVk=
U-]A::=gW9Hp@T2gTL!OM4Hp'B5)_:l='$6[e<.15sl!F@]A.UtK!LqnGm@:iB.?_;H*)0DE8V
`B!oHpfS`*Zl@D&Gb\qae7+:;Q)Y^;m*"0;@I$qK]A\'=A`)*9A56<?p7u%c7Bk:`cmU3bhIf
)a\Mo2uR$aFHBdNdb:.2;c2AX1,,<B:V%GO33qN]AY*mD1AsSKKgNGiV))d_0Wa$Bk6Q8I"E4
$)W%h>MB;H<Tn*ghgnB-:TI))/$BfD#2W!lds=[Bp\XV4LeKh7PX0B[T\lf@>H3M:N%BVpAi
6ceCp5_olC8A7Jh5_96GG;t6U50Of<j2$KBuKJSI^do9K*]AZDr9V-Z7X$lC=FBH_#Q*<WVY?
V>DZ*8l3?/T-:HI$;=G0XEcKL'&:QK2i`ta'.uP<&r%2(b^kQ_eh/I4rDK4d/cWTpD&o@',6
<u-XB)lG1$1JAQOGpOM*@:VTpUR;XG2R(=R<&<6MsG_7Zi%g/,`Mq*@K$;nl>97d_dRKVu#t
\[3$&-hPaW+BO`D8[=d8qCrl)UQ@6J/]Ajl\m<VqS"j8$L^Bi$;#poD(E>A+sCe3"&deKqqHW
-VoVs4P&<e:Vjh%Ym'2'K0CX4_f&Dl6R]AXmqMAF_#Ap3IO<j+A1d'8l!_-i!#YH6=bCj4+p_
=eL8UCrRql<e5`VdFT;!3#e+>rWf8LWe3O]A3T!KKRAHM"b6F/'D+Uu"cAOSlN*bq`mFC1]A!2
L>Oa@:iMf5&Ik`#S.a-AZE.i/&-0bgC4IGe(9UYoo`M$V4o.RZ5"QMf@/mYmts$ik%-r3KnR
]AR89dKN#">YjLaD^jjCE<Cd5iI(&g6N;r;6Yi,GDJsP,8M]AHiIS+0eD%k*\a#&5@^RO$dAhY
j9$U>Z2$gV$pLX`0.WMU5>!rPs$1"/.ZGp3Eu@c5pq,90e;<HV[4eJ?pWuTR/$+gA+!Z/Z(<
F':_uNgTQbZW,.]AK6/@qs?IeC:Ip2DcRgp<[mti/EodemN(0HE@1p)H_m!#`D6/W>bL.4[\s
gZ["\%b!=d59X<Cr&7\gr?a)8&Y^jWG8l+c:"!2N;1GIEhD#pL+EFiV1+tTT&k2U#Uob<;(H
PH/7QZ'c$CCK0`p>Rg2aZ?18T_n"#jWh547WrnnfIcWWMlSa4[IRe2^i#&SAoXK^,AhEV$ss
Ul;#jYXJN"qubHL6e;NnjfP=[Srs15!_gLIte[o28J8e'5o;O+gA%[>jF]A'-.;1BP$j.-^le
7;+1^dHl<Xphch5i[6$*raR?9XlqUP5SO0iM5hXia<^]A!jU"QUPpi0*76'E5LdVnu>YiHeed
_,\6SpBt=r3UG@0:qcP+$=V:[?uMA>W$u`:a74]Ao*S0:#j(S<9oX8Ps'bO,Lr3`WYu`WDh1U
Ils0#>VdhHAeE2Bsqg)^/9Ep;qjcL6VAE=A?.s#kLhM9:>++p$PqC7lD%oHLTL1?m4jD^PSO
Xa18AlKZDC=l[rTeeD5"2)d7M=n_Z,`BS.7YG[NL;/;]A+I4]Ato>."A76T/$igue,+3:*-mJO
]A_]Aa<DX1!ZZkNX9Oc/H(OY8GH27q^lRR-R^jggnZ4mkh5j"-C!7kE\5Bq(D)I:#X?=,.F8=t
`m+P&c,Z8NYb5)H(\c,_7ZLBrWlZWWW7a=8_X3nBnu^jU"2OV*V8^\O_h;(j!R_6dkU[F!:=
hqGZ#j+LT0?nBpNU^cI(M:%.HZ=Z^eW3b^FlWn/oFcTq:)YAS$:bf34RlEYG8,<Dd;-Z5mQ#
UnC"0+h$F=_HX+pim9:bnQY_UBo,d~
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
<C c="0" r="0">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[='<embed src="http://10.70.16.168:37799/webroot/help/svg/314.svg?id='+rand()+'" type="" id="Q314" onload="f1()"/>']]></Attributes>
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
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m94:);caaS5!qCPLpT?uBo$W[YtB/C'Hp$ePt8#2p7^l0A6Q4k.\n=>?s_E]AJ-lTj>?Z_kl#
^I;$C+dK6HE-U6lCgqCW(lo6L^_35S>2m]AQsZ48+<$OZ=`SreR*Ri4g4hODsqW5PO3jVVa'j
mZmPnV!hP9RZKSE@J;4F3!>DVF*^cQqP^IX/+COV-EJn.Q-aTVLolX:jo'QFRRPK^Kqi+b1N
a1,`ZRjGqIeh9e61YWb1QMIP(LIq1,Aqun+T-cYX<B*qY&`-`%HSaQ3D#133f/NPU_ra("Wg
-&7m,o.%&kX@=k;GG]Af**W]A7A?+LpX57B+jtZ5&SPC6EEd7oJlKo=3hCN6(dSY2.64(Sh%q"
.>43';h[im[Y_72$?<Nc8)G9sUr;D)=e0asZ/("OC(9$KO2]ASg=<lUoX`@A+Z#nNaNip_2`.
='Th`"uSU/0FnF"-a,`obX?&Y.?J'+n6o<602DAbtNaU+>SkD(Y`UD=Rng7-Y``*a.qH459)
8\W46oA7A]A-:s)0JD1#Mji?"N?a#[bg[`Thsa2et5!Sj+:8ou?u;T<]A*_EqV*[%]A("A?58c1
Jk-IM]A-+oB?>b]A:!:(i2MG*J',W#*,+:Wgr[Bb]AIm/j^:g-^>;YT#FrrV6/O5iT'+VtJ!)ah
po(Rjn_7f-8GQ2Z2p"X.#h@TMLN8#1'ug[l8.d;aJmU4.@oHCD/AT?a`Q%O*[5YHNk\>Fj#:
Tf]AgqB=8+QI,?/K@Up4_D`YJnN-8SR]AuMT_Wc`JX[@q4oFG8NFcuYa2:]AuCjR^Z6G9_@%gNG
Ju;Obg0I1ET4Ve>Vd5j$]AI)RBn<DbL+XS)\oCtrLokbbPIC;&lMZl4E?c1#pYoji#c;U,u+n
4LTEjocscm]A^W)^F7WdXkjr5-E1V2ciqIu[*k.EucR%,GUF<UJ`^61ImD(HM2S[W,#FUWt$H
DgeiH_QHBqq1N^kOlJqU?VR]AGA1u%eh`YY=0QY^KVF.@T+MmZH.Kt(\J2VOLKNK;O$ZIkNA>
<-YKus$@ZY<orMe!Qm32D]A2ekBdF)3JD&L2'+L7]ATLnkF9.f&k=5WYg,Uil?>O[)f\HT-fNf
C>;u9f@AJS*UXVD,<h)Gn@OKEUftZ4n9PtBBVK3^80,]AiE[5MO'4OtnR(Wj;G74:(2s#>!Zh
*ESp?t&dP$b'tWqZ-:5"6H!P7[/@BnS8>e]AOq'![hV2f![@,`8ihuW0>:^_@j[KPEN(hY$#)
$@:o3Y,eVMX$6Yce/qXWm5U$J]A*G:`<`(0R*F^XT/7,UE3&9tg5B8Dp=lQBNmCTkbT:/J8mL
+D&#\TMr=P=b1:HM;O=gnHij<tdmsH9T+kmd3CU0nEA#rZ]Af[.AH)\GhjErK[Sb==8OUK]AlJ
hd+/Xhtr7XChU1d69q^?CE'th.p+A<S,.Zi]As-JH,K10fL,er,=n),>1V+CD-2U]A.ptEjni2
=.f_V&q#FF?"[RY\b*cD^'iUo0TEl4CoDL$1l7!Ro2`Rn9R.G-$R8)BEdV8XS>pM3\ia:L<?
G-'nT+EM@Y)/IK,4eUI2[gc^6\5rYBbVoGCe(QYXlA.SXp186O,r'&H[0i+k5:80JY./ed?P
6!9g0V'f;t%&!g3/a:NBN,<]A7fH2eiI)]Ad)IOcP9Moh3oKh@>RrJ6^3C'Pm>Yg+\6=!("(;5
oj:Ja?&P.p>olpI_Me^]AlAj"Sf0urYHugR)1(f'E`jb&03GN:4DO">Y40]Afge2*V4Js4(V,>
q+jp?!)5ZXk3F_"5b8mF5q<E1O!;Y^0rQL/lkKp45cO,B>[2(U"tV#C>JqFI)CQl1#Y3IU&j
qtYZ.)n2."hE&f0_gBMQJ)c6"A79[ieou\UULC]A)d6tZqfkVg<p?&@E.ujXjN@1U!Erd^jAK
6tCr<VI!S/SftE8o^,Ick$@L89DQ5'Ik%W!l9"D3FI-/N4I++@jKa(SkgA3[32rlI@tUXN[&
WMdTQq=3dR<_Elhmjq]A?9pja)*@l[0Brc$6)eX`a\&&=qCU#9p.0]Al)#:B8)!]Aq[Sq/r^Khp
Wa>a_`mQFE.kT1dOB%f#=<;HfSLM]AWkiMX[N5J&`4e0N5A-]AB$Xi=P&&&$HHgWlH<n_]A@g!M
aZ>M/2\&-W]AOcQ"<f!?Zlp_6d0aQ,*lbL+D[hn14!Up:\GejBirg8I"O>gDQ@D&9<s7a2;gE
r<`o8,]Ab.h'ki9a<6G8?n_\+$+&da<?H_$=cgmTc-7g".+ej%t"THa&)@P7R&[\Q;(LJ-_-6
c'_lLsp<!edHhLUYa/r7]AYUN"Wp`W9?nfof3&RlH$>9S9[950:_2ENoUqRG63T*$[dK]Aeg%R
JP8sXV[Jl$)pG/U[S*^[IQ28:niL#KZ,&sW0ktHm:>FDKkkTBpmSKgFYE9UoKRsLg.E!#>=0
T6R`3VpUOctCP;g%GAQbkmBU-m_\6VF-2"HUgGm<>GE`:esF/:D3Wu.T#'%3'R'DYg@7UGjk
';fhM_irr+17Qig:Sl^'!u;,#;:JJ/uIrN&\$b[AgAn;LKPA-*t51VjXVpNDJG^bTKN7@7K.
6%ehCLf<@s1M;*."&l"q$n9b,e;!</Q8OYul<WEQ*V]Ap*F"!\\hq-,q`f,OX#gPPBeXo(WB5
W7L(MtEaX9qoDNaFrfb;eS(c=&WAU-S5p#ogQj/A^@j:h2tg'u/P5Wgr7TKRii&qQstmq>'@
HJdP$XE3BFfL@R;6VkJ@!*\_THRHUh4>4"(',`9$==mCO9q;?XZk9geWFI'lhe3UI+A^Kuh1
InDZ\(XciOMKR!BNF-+'HT1pG,.RE\[*Pb8g<'>,'FJO7EbGN/eaRp6Suof=[r5DFL.h]A/o5
$6:9\q%HSALO+nbQ@/h!CW3&>gkj@+O?DII-h-E*"2Hl_@M7^/+id=Ki.Bud:MH0Z:GS`6T"
!OaMGBOV'Z6VNa&hj>0A\:WtFa=m%5)@,S]AM+J6sf0s%'6>3CH:H$4l]AR[KZ+&:TiPP4a^D1
c2,co)A$.^Nb^XLsnE6<TPf1qBJ4?4#b$_OOk$m-2D^kq19-N=%!n/SGEE`6-?S5c^]A2#HBp
sBJVbgn7&V^:L3T"H+7S-K<0BWV;;-P>/@P@6A+^fo9la+WtqQtg,o4h/9S;/)A\S%r\f'b.
!H0oKg>%:)uQY<Z'Bj:4?`cuQX3fo91fcree.K`*XmYMe)Mb4IO(*l[JZ'5i6l%I/R6DBWE\
j(dR48</n]A;5V8*%WLgGBa?*/F@epe%&Le%XR(DaTuG!H_BCb>"JCJ7qSMRmrR]A#bI8\8IQb
*qu[ZI'hid=PK!>T&_G=^K;)^#BJ';olp>2"85T^4<)ekW$d$anNddD.\k"F1X%_uo#R2%&h
oNmjC+Nb\R13(\S`--O-\riZ;2QS0Hd5!U'?5<`2'Gj-:r1a,S6;(KS_=j(3U3\1_m#(`giR
t>j[!?ORnk)!2SkuN4Z?4/.L^u5nDT.^C=,Mg8tk+[JrP"OD.pZ='Q_<J<cPE"D1Ceeg:L,F
`<$!fGn;EPjVtoWT]AgE9OWI?71,4BZ8*LMY=od9Xb-[*[q4_"CRj5T=XRoS!N1/5/.r5JXqr
+r9k=ZVWSc3?+=_W,Yh!5h&,WcOdM!'[lK3Un>\^p!l"(ce"@h%A6M-@aiQ&H"/VW6i*22#Y
8(&N6dJ\7e14Ia'A7l]A+GDQ>aF*5O"5JIsEEJS[uql)L;DJBS'/9AF82\au2d%0$3^JWWP9[
Qo"1Xo%7H>knppSV:Xci$p9*tZu3IBGRA(=hV9D#3`di!pEXn?Md$0nCp?_#PG0:JN(_J7>S
foc$Mln-7elS4$G$a;qQd%n,u*O]Ab$`^s^d'YW7c:jsXQ0p##^rSmO6IT,A%'rhPhBD@-2:G
QZ%Nl-0FaV2fc9T#>ekBTtdm7*<uFOKCZ%JTCR8]A2'^^s&)cJ?Hot#@0q/41#-;m@@.f;kmG
=W"ZgA&*+t#uJ_9>.M4?8#(UVZXH[(0'ma7k0&lSkYIrUD,(R<JK[d?!~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="false"/>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="864" height="486"/>
</Widget>
<Sorted sorted="false"/>
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
<Sorted sorted="false"/>
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
<TemplateIdAttMark TemplateId="db9c8af4-93e9-43fc-973c-fcf26f59c1e5"/>
</TemplateIdAttMark>
</Form>
