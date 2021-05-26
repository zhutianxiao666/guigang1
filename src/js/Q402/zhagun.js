import {getTd} from "../common/common";
import {$svg} from "../common/init";
export default  function () {
    // 一中间
    (function () {
        const X_MAX = getTd('report1','B31').text();
        const X_AVG = getTd('report1','B32').text();
        const X_MAX_PRE = getTd('report1','B33').text();
        const X_AVG_PRE = getTd('report1','B34').text();
        const X_MAX_H = getTd('report1','B35').text();
        const X_AVG_H = getTd('report1','B36').text();
        const X_NOW = getTd('report1','B37').text();
        $svg.find('#X_MAX').text(Number(X_MAX));
        $svg.find('#X_AVG').text(Number(X_AVG));
        $svg.find('#X_MAX_PRE').text(Number(X_MAX_PRE));
        $svg.find('#X_AVG_PRE').text(Number(X_AVG_PRE));
        $svg.find('#X_MAX_H').text(Number(X_MAX_H));
        $svg.find('#X_AVG_H').text(Number(X_AVG_H));
        $svg.find('#X_NOW').text(Number(X_NOW));
    })();
    // 二中间
    (function () {
        const Y_MAX = getTd('report1','C31').text();
        const Y_AVG = getTd('report1','C32').text();
        const Y_MAX_PRE = getTd('report1','C33').text();
        const Y_AVG_PRE = getTd('report1','C34').text();
        const Y_MAX_H = getTd('report1','C35').text();
        const Y_AVG_H = getTd('report1','C36').text();
        const Y_NOW = getTd('report1','C37').text();
        $svg.find('#Y_MAX').text(Number(Y_MAX));
        $svg.find('#Y_AVG').text(Number(Y_AVG));
        $svg.find('#Y_MAX_PRE').text(Number(Y_MAX_PRE));
        $svg.find('#Y_AVG_PRE').text(Number(Y_AVG_PRE));
        $svg.find('#Y_MAX_H').text(Number(Y_MAX_H));
        $svg.find('#Y_AVG_H').text(Number(Y_AVG_H));
        $svg.find('#Y_NOW').text(Number(Y_NOW));
    })();
    // 支撑辊
    (function () {
        const Z_MAX = getTd('report1','D31').text();
        const Z_AVG = getTd('report1','D32').text();
        const Z_MAX_PRE = getTd('report1','D33').text();
        const Z_AVG_PRE = getTd('report1','D34').text();
        const Z_MAX_H = getTd('report1','D35').text();
        const Z_AVG_H = getTd('report1','D36').text();
        const Z_NOW = getTd('report1','D37').text();
        $svg.find('#Z_MAX').text(Number(Z_MAX));
        $svg.find('#Z_AVG').text(Number(Z_AVG));
        $svg.find('#Z_MAX_PRE').text(Number(Z_MAX_PRE));
        $svg.find('#Z_AVG_PRE').text(Number(Z_AVG_PRE));
        $svg.find('#Z_MAX_H').text(Number(Z_MAX_H));
        $svg.find('#Z_AVG_H').text(Number(Z_AVG_H));
        $svg.find('#Z_NOW').text(Number(Z_NOW));
    })();
}
