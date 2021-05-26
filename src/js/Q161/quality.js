import {doubleArc, table} from "../common/myechars";
import {getArr, getTd, getUnitCode, Q_QArr} from "../common/common";
import {$svg} from "../common/init";

export default function () {
    // 归户改判率
    doubleArc({
        rIn:130.634,
        rOut:160.009,
        numIn:Number(getTd('report1','A29').text()),
        numOut:Number(getTd('report1','B29').text()),
        xIn:139.924,
        yIn:1182.63,
        xOut:110.548,
        yOut:1184.03,
        $ele:'#guihugaipanlv_1_',
        length:2
    });
    // CP改判率
    doubleArc({
        rIn:130.634,
        rOut:160.009,
        numIn:Number(getTd('report1','A31').text()),
        numOut:Number(getTd('report1','B31').text()),
        //M549.769,1182.633
        xIn:549.769,
        yIn:1182.633,
        //M520.393,1184.029
        xOut:520.393,
        yOut:1184.029,
        $ele:'#cpgaipanlv_1_',
        length:2
    });

    //小尾卷发生率
    // 早班
    doubleArc({
        rIn:107.588,
        rOut:131.78,
        numIn:Number(getTd('report1','B33').text()),
        numOut:Number(getTd('report1','C33').text()),
        // M1019.333,1172.037
        xIn:1019.333,
        yIn:1172.037,
        //M995.142,1173.188
        xOut:995.142,
        yOut:1173.188,
        length:2,
        $ele:'#xiaoweijuanfashenglv_2_',
        shift_group:getTd('report1','A33').text()
    });

    // 晚班
    doubleArc({
        rIn:109.368,
        rOut:131.78,
        numIn:Number(getTd('report1','B34').text()),
        numOut:Number(getTd('report1','C34').text()),
        //1381.158,1171.231
        xIn:1381.158,
        yIn:1171.231,
        //1356.565,1172.399c0-73.982,
        xOut:1356.565,
        yOut:1172.399,
        length:2,
        $ele:'#xiaoweijuanfashenglv_3_',
        shift_group:getTd('report1','A34').text()
    });

     // 来料异常
    const list1 = Q_QArr(getTd('report1','B35').text());
    table({
        width: 828,
         data: list1,
         titles: ['作业计划号','出口材料号','封锁代码'],
         order: [1,2,1],
         $ele: $svg.find('#lailiaoyichang')
     });
    //  用户特殊要求
      const list2 = Q_QArr(getTd('report1','B36').text());
      table({
          width: 828,
          data: list2,
          titles: ['作业计划号','生产命令顺序号','入口材料号'],
          order: [1,1,1],
          $ele: $svg.find('#yonghuteshuyaoqiu')
      });
    // 技术通知单
      const list3 = Q_QArr(getTd('report1','B37').text());
      table({
          width: 828,
          data: list3,
          titles: ['作业计划号','计划通知单号'],
          order: [1,1],
          $ele: $svg.find('#jishutongzhidan')
      });
      // 质量异议
      const list4 = Q_QArr(getTd('report1','B38').text());
      table({
          width: 828,
          data: list4,
          titles: ['用户描述','用户异议抱怨'],
          order: [1,1],
          $ele: $svg.find('#zhiliangyichang')
      });


//     console.log(getUnitCode() || 'Q161');
//     let ta = '';
//     switch (getUnitCode()) {
//         case 'Q161':
//             ta = 'TPSQ161';
//             break;
//         case 'Q162':
//             ta = 'TPSQ161';
//             break;
//         case 'Q163':
//             ta = 'TPSQ163';
//             break;
//         case 'Q165':
//             ta = 'TPSQ165';
//             break;
//         default:
//             console.log(type,'无该机组');
//             return;
//
//     }
//     const str = `
//     SELECT A.PLAN_NO||'Q_Q'||
//        B.UNIT_SEQ_NO||'Q_Q'||
//        A.IN_MAT_NO||'Q_Q'||
//        A.SPECIAL_INST_DESC||'Q_Q'||
//        A.TEST_ADD_DESC||'Q_Q'||
//        A.ORDER_SPECIAL||'-*-' 特殊需求
//   FROM ${ta} A,${tableb} B
//  WHERE     A.UNIT_NO = '${unit_code}'
//        AND A.TRACK_STATUS >= '8'
//        AND A.IN_MAT_NO = B.IN_MAT_NO
//        AND (A.SPECIAL_INST_DESC <> ' ' OR A.TEST_ADD_DESC <> ' ' OR A.ORDER_SPECIAL <> ' ')
// ORDER BY UNIT_SEQ_NO
//     `

}