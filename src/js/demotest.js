const demo = document.createElement('link');
demo.rel = 'stylesheet';
demo.href = 'http://10.70.16.168:37799/webroot/help/svg/css/Zong.css?id=' + Math.random();
document.querySelector('head').append(demo);
window.f1 = function() {
    const oldSvg = $(document.querySelector('embed#guigang').getSVGDocument()).find('svg')[0];
    const td = $('div[widgetname="REPORT0"] td[id^="A1-0"]');
    $('div[widgetname="REPORT0"] td[id^="A1-0"] div').html(oldSvg);
    const svg = $('div[widgetname="REPORT0"] td[id^="A1-0"]').find('svg');
    svg.attr({
        width:td.width(),
        height:td.height()
    });
    let times = 0;
    const init_width = $('#guzhangcishu')[0].getBBox().width;
    let timer = setInterval(function(){
        times++;
        if(init_width != $('#guzhangcishu')[0].getBBox().width|| times > 50){
            clearInterval(timer);

            $('body').append('<div id="TipsText" style="position: absolute;left: 0;top: 0;display: none;color: white;background-color: rgba(0,0,0,0.2)">分类名：机组号</div>')
            // 公共变量
            // 机组号元素
            const codeShowArr = svg.find('text[id^="unit_code"]');
            // 库区百分比元素
            const stockShowArr = svg.find('text[id^="stock_"]');
            // 个页面的url地址
            const urlArr = [
                {
                    unit_code: ['Q161','Q162','Q163','Q165'],
                    url:'http://10.70.16.168:37799/webroot/decision/view/form?viewlet=硅钢/161无取向精整机组可视化画面svg.frm&unit_code='
                },
                {
                    unit_code: ['Q173','Q174','Q175'],
                    url:'http://10.70.16.168:37799/webroot/decision/view/form?viewlet=硅钢/171取向精整机组可视化画面svg.frm&unit_code='
                },
                {
                    unit_code: ['Q314'],
                    url: 'http://10.70.16.168:37799/webroot/decision/view/form?viewlet=硅钢/314热拉伸平整机组可视化画面svg.frm&unit_code='
                },
                {
                    unit_code: ['Q402','Q502'],
                    url: 'http://10.70.16.168:37799/webroot/decision/view/form?viewlet=硅钢/402单机架轧机机组可视化画面svg.frm&unit_code='
                },
                {
                    unit_code: ['Q403'],
                    url: 'http://10.70.16.168:37799/webroot/decision/view/form?viewlet=硅钢/403高温环形退火炉机组画面svg.frm&unit_code='
                },
                {
                    unit_code: ['Q412'],
                    url: 'http://10.70.16.168:37799/webroot/decision/view/form?viewlet=硅钢/412脱碳退火机组可视化画面svg.frm&unit_code='
                },
                {
                    unit_code: ['Q318','Q518'],
                    url: 'http://10.70.16.168:37799/webroot/decision/view/form?viewlet=硅钢/518退火涂层机组可视化画面svg.frm&unit_code='
                }
            ];

            //  开始渲染数据
            // 渲染日期
            function showDate() {
                const data = svg.find('#date');
                const year = new Date().getFullYear();
                const month = new Date().getMonth() + 1;
                const day = new Date().getDate();
                data.text(year + '.' + (month < 10 ? '0' + month : month) + '.' + (day < 10 ? '0' + day : day));
            }
            showDate();

            //  start 生产信息
            function product(obj) {
                // 获取数据
                // 重量
                const numArr = getTdNum(obj.reportName,obj.numTd);
                // 机组号
                const codeArr = getTdNum(obj.reportName,obj.codeTd);
                // 显示机组号的元素
                const code = svg.find('.production');
                const outLine = svg.find('.productionOutLine');
                const num = svg.find('.productionnum');
                // 月机组数据
                const monthCodeArr = getTdNum(obj.reportName,obj.monthCodeTd);
                // 月数据
                const monthNumArr = getTdNum(obj.reportName , obj.monthNumTd);
                // 月日期
                const monthDateArr = getTdNum(obj.reportName , obj.monthDateTd);

                // 下标（分页时的下标）；
                let index = 0;
                // 初始化渲染
                function create() {
                    // 清除缓存内容
                    code.text('');
                    num.text('');
                    // 获取显示内容的列表
                    const list1 = numArr.slice(index,index+7);
                    const list2 = codeArr.slice(index,index+7);
                    // 重新渲染
                    code.each((index,value) => {
                        const id = $(value).attr('data-index');
                        $(value).text(list2[id] || '');
                        num.eq(index).text(parseInt(list1[id]) || '');
                    });
                    code.eq(0).click();
                };


                // 翻页
                $('#btn_right').css({'cursor':'pointer'}).on('click',function() {
                    if (index + 6 < numArr.length - 1 ) {
                        index += 6 ;
                        create();
                    };
                });
                $('#btn_left').css({'cursor':'pointer'}).on('click',function() {

                    if (index - 6 >= 0 ) {
                        index -= 6 ;
                        create();
                    }
                });
                document.querySelector('#production').onwheel = function (event) {
                    if (event.deltaY > 0 ) {
                        $('#btn_right').click();
                    } else if (event.deltaY < 0) {
                        $('#btn_left').click();
                    }
                }
                // 点击渲染折线图
                code.css({'cursor':'pointer'}).click(function(){
                    // 获取机组号

                    const dataIndex = $(this).attr('data-index');
                    outLine.each((index,value) => {
                        if (dataIndex == $(value).attr('data-index')) {
                            $(value).attr({'fill':'yellow','stroke':'yellow','opacity':'1'});
                        }else {
                            $(value).attr({'fill':'none','stroke':'#00FFFF','opacity':'0.5'})
                        };

                    });
                    num.attr({
                        'fill':'#03FFFF'
                    })
                    const unit_code = $(this).text();
                    // 获取x和y的列表
                    const listX = [];
                    const listY = [];

                    for (let i = 0 ;i < monthCodeArr.length; i++) {
                        if (monthCodeArr[i] == unit_code) {
                            listX.push(monthDateArr[i]*1);
                            listY.push(monthNumArr[i]*1);
                        }
                    };
                    // 查询数据
                    lineChart({
                        x:listX,
                        y:listY,
                        min:'',   // 输入min 表示以y最小值为标准，也可以输入具体数值 不输入则默认为0
                        max:''    // 输入max 表示已y最大值为标准，也可以输入具体数值 无max则默认为y最大值取整
                    });

                });
                // 折线图
                function lineChart(obj) {
                    const max = Math.ceil(Math.max.apply(null, obj.y) / 1000) * 1000 ;
                    const min =  Math.floor(Math.min.apply(null, obj.y) / 1000) * 1000 ;
                    const section = max - min ;
                    // x轴分组数量
                    const lengthX = obj.x.length - 1;
                    const circleArr = [];
                    let str = '';
                    for (let i = 0 ; i < obj.x.length ; i++ ) {
                        const x =  92.555 + 562.487 / lengthX * i ;
                        const y = 2048.324 - (obj.y[i] - min) / section * 203.836 ;
                        circleArr.push('<circle r="4" cx="'+ x +'" cy="'+ y +'"  stroke="rgba(0,0,0,0)" stroke-width="50" fill="#6DC7BE" data-index="'+i+'" ></circle>')
                        if (i == 0 ) {
                            str += 'M' + x + ',' + y;
                        }else {
                            str += ' L' + x + ',' + y;
                        };
                    };
                    str += ' l 10,0 0,500 -582.487 0 '
                    $('#LineChart').attr({'d':str,'stroke':'#76C48C','stroke-width':'3'});
                    $('#littleCircle').html(circleArr.join(''));
                    $('#littleCircle circle').mouseenter(function (e) {
                        const index = $(this).attr('data-index');
                        $(this).attr('r','8');
                        TipsText({
                            x:e.clientX,
                            y:e.clientY,
                            isEnter:true,
                            num:obj.y[index],
                            orderby:obj.x[index]
                        });
                    }).mouseleave(function () {
                        $(this).attr('r','4');
                        TipsText({
                            isEnter:false
                        });
                    })
                    // y轴数字
                    $('#LineY tspan').each((index , value) => {
                        $(value).text(max - index * section / 4)
                    });
                    const listX = [];
                    for (let i = 0 ; i < obj.x.length ; i++ ) {
                        listX.push('<tspan x="' + ((i / ( obj.x.length - 1)) * 562.487 + 82.555 ) + '">' + (obj.x[i].toString().substr(4)) + '</tspan>');
                    };
                    // x轴日期
                    $('#LineX').html(listX.join(''));
                };
                create();
            };
            // 调用函数
            product({
                reportName:'report1',
                numTd:'B1-0',
                codeTd:'A1-0',
                monthCodeTd:'D1-0',
                monthNumTd:'E1-0',
                monthDateTd:'F1-0'
            });
            // end 生产信息

            // start 质量信息开始
            function quality(obj) {
                // 第一行
                const num1 = getTdNum(obj.reportName,obj.num1);
                const num2 = getTdNum(obj.reportName,obj.num2);
                const num3 = getTdNum(obj.reportName,obj.num3);
                const num4 = getTdNum(obj.reportName,obj.num4);
                const num5 = getTdNum(obj.reportName,obj.num5);
                const Arr = [num1,num2,num3,num4,num5];
                // 获取展示数值的text元素
                const qualityArr = svg.find('.quality');
                // 清除缓存字符
                // qualityArr.text('');
                for (let i = 0 ; i < 5 ; i++) {
                    for (let j = 0 ; j < 3 ; j++) {
                        const index = i * 3 + j ; // 获取下标
                        // 重新赋值
                        qualityArr.eq(index).text((Arr[i][j] * 1).toFixed(2)  + '%');
                    };
                };
                function open(obj) {
                    FR.doHyperlink(event||window.event, [{"data":"var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({\"url\":\"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E8%25B4%25A8%25E9%2587%258F%25E8%25B6%258B%25E5%258A%25BF%25E5%259B%25BE.frm"+'&day=' +  obj.day +'&month=' +  obj.month + '&title=' + obj.title +"\",\"para\":{\"__pi__\":true},\"target\":\"_dialog\",\"feature\":{\"width\":2000,\"height\":1100,\"isCenter\":true,\"title\":\"\"},\"title\":\"网络报表1\"})}, this, as)","name":"网络报表1"}], true)
                };
                svg.find('text[id^="qualitytext"]').on('click',function () {
                    let obj= {}
                    switch ($(this).attr('id')) {
                        case 'qualitytext1':
                            obj = {day:'COMP_OUTPUT_RATE_D_NH',month:'COMP_OUTPUT_RATE_M_NH'};  //COMP_OUTPUT_RATE_D_NH
                            break;
                        case 'qualitytext2':
                            obj = {day:'GD_OUTPUT_RATE_D_NH',month:'GD_OUTPUT_RATE_M_NH'};
                            break;
                        case 'qualitytext3':
                            obj = {day:'HSG_OUTPUT_RATE_D_NH',month:'HSG_OUTPUT_RATE_M_NH'};
                            break;
                        case 'qualitytext4':
                            obj = {day:'COMP_OUTPUT_RATE_D_IH',month:'COMP_OUTPUT_RATE_M_IH'};
                            break;
                        case 'qualitytext5':
                            obj = {day:'GD_OUTPUT_RATE_D_IH',month:'GD_OUTPUT_RATE_M_IH'};
                            break;
                    }
                    obj.title = $(this).text();
                    open(obj)
                }).css('cursor','pointer');
            };
            quality({
                reportName: 'report1',
                num1:'A4-0',
                num2:'B4-0',
                num3:'C4-0',
                num4:'D4-0',
                num5:'E4-0'
            })

            // end 质量信息结束


            // 成本能源信息开始
            function cost(obj) {
                const costCodeShow = svg.find('text.costcode');
                const costNumShow = svg.find('g.costnum');
                const codeArr = getTdNum(obj.reportName, obj.code);
                const costPlanArr = getTdNum(obj.reportName , obj.costPlan);
                const costActArr = getTdNum(obj.reportName , obj.costAct);
                const colors = ['#9FD200','#2CA6E0','#F29600','#FF2A00'];
                const energyRectArr = svg.find('rect.energy');
                const energyTextArr = svg.find('text.energy');
                const energyBgRectArr = svg.find('rect.energy_bgc');
                const energyArr = getTd(obj.reportName, obj.energy).text().split('*_*,');
                energyArr[energyArr.length - 1] = energyArr[energyArr.length - 1].replace('*_*','');
                energyArr.map((value,index) => {
                    energyArr[index] = value.split('Q_Q');
                });
                // 下标
                let index = 0;
                function create() {
                    // 清除缓存
                    costCodeShow.text('');
                    costNumShow.find('tspan').text('');
                    costNumShow.next().find('text').text('');
                    energyRectArr.attr('width',0);
                    energyBgRectArr.attr('width',0);
                    energyTextArr.find('tspan').text('');
                    // 渲染数据
                    for (let i = 0 ; i <  5 ; i++) {


                        // 判断跳出
                        if (!codeArr[i + index]) {
                            break;
                        };
                        energyTextArr.filter('[data-index="'+i+'"]').find('tspan').eq(0).text('0');
                        energyTextArr.filter('[data-index="'+i+'"]').find('tspan').eq(2).text('/ 0');
                        // 渲染机组号
                        costCodeShow.eq(i).text(codeArr[i + index]);
                        const index1 = energyArr.findIndex(value => {
                            return codeArr[i + index] == value[0];
                        });

                        if (index1 != -1) {
                            let num = 1;
                            let colorIndex = 0;
                            if (energyArr[index1][2]*1) {
                                num = energyArr[index1][1]*1 > energyArr[index1][2]*1 ? 1 : energyArr[index1][1] / energyArr[index1][2];
                            };
                            switch (true) {
                                case num>=0.9:
                                    colorIndex = 3;
                                    break;
                                case num>=0.7:
                                    colorIndex = 2;
                                    break;
                                case num >= 0.5:
                                    colorIndex = 1;
                                    break;
                            }
                            const rect = energyRectArr.filter('[data-index="'+ i +'"]');
                            const text = energyTextArr.filter('[data-index="'+ i +'"]');
                            text.find('tspan').eq(2).text('/ '+ energyArr[index1][1]);
                            text.find('tspan').eq(0).text(energyArr[index1][2]);
                            rect.attr({
                                'width': (251.181 * num),
                                'fill': '#9FD200'//colors[colorIndex]
                            });
                            // 能源进度条背景rect  有值则显示
                            energyBgRectArr.filter('[data-index="'+ i +'"]').attr("width",251.181);
                        };
                        // 渲染数值 百分比
                        const index2 = costNumShow.eq(i).attr('data-index')*1;
                        // 获取g元素
                        const g = svg.find('g.costnum[data-index="'+i+'"]');
                        g.find('tspan:eq(0)').text(parseInt(costPlanArr[index + i]));
                        g.find('tspan:eq(1)').text( '/'+parseInt(costActArr[index + i]));
                        let num = 0
                        if (costPlanArr[index + i] == 0) {
                            num = 0;
                        }else {
                            num = parseInt((costActArr[index + i] - costPlanArr[index + i]) / costPlanArr[index + i] * 100);
                        };
                        if (num > 0) {
                            g.next().find('text').html( num + '%' + '<tspan x="100" fill="#00ffff" style="font-family: 微软雅黑;font-weight: 900" >↑</tspan>');
                        }else {
                            g.next().find('text').html( num + '%' + '<tspan x="100" fill="#8DC21F" style="font-family: 微软雅黑;font-weight: 900">↓</tspan>');
                        };
                    };
                    // 点击
                    function open ({type,code}) {
                        if (type === 'chengben') {
                            window.open('http://10.70.16.168:37799/webroot/decision/view/form?viewlet=%E7%A1%85%E9%92%A2/%E7%A1%85%E9%92%A2%E4%B8%89%E6%9C%9F%E6%88%90%E6%9C%AC%E7%94%BB%E9%9D%A2.frm&unit_no='+code);
                        }else if (type === 'nengyuan'){
                            switch (code.toUpperCase()) {
                                case 'Q314':
                                    window.open('http://10.70.16.168:37799/webroot/decision/view/form?viewlet=%25E8%2583%25BD%25E7%258E%25AF%25E5%258F%25AF%25E8%25A7%2586%25E7%259B%2591%25E6%258E%25A7%252F%25E7%25A1%2585%25E9%2592%25A2%25E4%25B8%2589%25E6%259C%259F%25E8%2583%25BD%25E6%25BA%2590%25E7%259B%2591%25E6%258E%25A7Q314.frm&ref_t=design&ref_c=76bcde68-b662-4682-bd3a-cd04bbb0e120');
                                    break;
                                case "Q402":
                                    window.open('http://10.70.16.168:37799/webroot/decision/view/form?viewlet=%25E8%2583%25BD%25E7%258E%25AF%25E5%258F%25AF%25E8%25A7%2586%25E7%259B%2591%25E6%258E%25A7%252F%25E7%25A1%2585%25E9%2592%25A2%25E4%25B8%2589%25E6%259C%259F%25E8%2583%25BD%25E6%25BA%2590%25E7%259B%2591%25E6%258E%25A7Q402.frm&ref_t=design&ref_c=76bcde68-b662-4682-bd3a-cd04bbb0e120');
                                    break;
                                case "Q403":
                                    window.open('http://10.70.16.168:37799/webroot/decision/view/form?viewlet=%25E8%2583%25BD%25E7%258E%25AF%25E5%258F%25AF%25E8%25A7%2586%25E7%259B%2591%25E6%258E%25A7%252F%25E7%25A1%2585%25E9%2592%25A2%25E4%25B8%2589%25E6%259C%259F%25E8%2583%25BD%25E6%25BA%2590%25E7%259B%2591%25E6%258E%25A7Q403.frm&ref_t=design&ref_c=76bcde68-b662-4682-bd3a-cd04bbb0e120');
                                    break;
                                case "Q412":
                                    window.open('http://10.70.16.168:37799/webroot/decision/view/form?viewlet=%25E8%2583%25BD%25E7%258E%25AF%25E5%258F%25AF%25E8%25A7%2586%25E7%259B%2591%25E6%258E%25A7%252F%25E7%25A1%2585%25E9%2592%25A2%25E4%25B8%2589%25E6%259C%259F%25E8%2583%25BD%25E6%25BA%2590%25E7%259B%2591%25E6%258E%25A7Q412.frm&ref_t=design&ref_c=76bcde68-b662-4682-bd3a-cd04bbb0e120');
                                    break;
                                case "Q502":
                                    window.open('http://10.70.16.168:37799/webroot/decision/view/form?viewlet=%25E8%2583%25BD%25E7%258E%25AF%25E5%258F%25AF%25E8%25A7%2586%25E7%259B%2591%25E6%258E%25A7%252F%25E7%25A1%2585%25E9%2592%25A2%25E4%25B8%2589%25E6%259C%259F%25E8%2583%25BD%25E6%25BA%2590%25E7%259B%2591%25E6%258E%25A7Q502.frm&ref_t=design&ref_c=76bcde68-b662-4682-bd3a-cd04bbb0e120');
                                    break;
                                case "Q518":
                                    window.open('http://10.70.16.168:37799/webroot/decision/view/form?viewlet=%25E8%2583%25BD%25E7%258E%25AF%25E5%258F%25AF%25E8%25A7%2586%25E7%259B%2591%25E6%258E%25A7%252F%25E7%25A1%2585%25E9%2592%25A2%25E4%25B8%2589%25E6%259C%259F%25E8%2583%25BD%25E6%25BA%2590%25E7%259B%2591%25E6%258E%25A7Q518.frm&ref_t=design&ref_c=76bcde68-b662-4682-bd3a-cd04bbb0e120');
                                    break;
                            }
                        }
                    };
                    document.querySelector('body').onclick = function(event) {
                        event = event || window.event;
                        const node = event.target;
                        const list =Array.prototype.slice.call(node.classList);
                        if (list.includes('chengben')) {
                            const index = node.getAttribute('data-index');
                            open({type:'chengben',code:$('.costcode').eq(index).text()});

                        }else if (list.includes('nengyuan')) {
                            const index = node.getAttribute('data-index');
                            open({type:'nengyuan',code:$('.costcode').eq(index).text()});
                        };
                    };
                }
                create();

                $('#btn_top').css({'cursor':'pointer'}).on('click',function() {
                    if (index - 5 >= 0 ) {
                        index -= 5 ;
                        create();
                    };
                });
                $('#btn_bottom').css({'cursor':'pointer'}).on('click',function() {
                    if (index + 5 < codeArr.length  ) {
                        index += 5 ;
                        create();
                    };
                });
                document.querySelector('#costBox').onwheel = function (e) {
                    if ( e.deltaY > 0 ) {
                        $('#btn_bottom').click();
                    } else if (e.deltaY < 0) {
                        $('#btn_top').click();
                    };
                };

            }

            cost({
                reportName: 'report1',
                code:'A7-0',
                costPlan: 'B7-0',
                costAct : 'C7-0',
                energy: 'D7-0'
            })
            // 成本能源信息结束

            // start 设备信息
            function equipment(obj) {
                const stopTime = getTd(obj.reportName,obj.stopTime).text();
                const stopTotal = parseInt(getTd(obj.reportName,obj.stopTotal).text());
                const guzhangcishu = parseInt(getTd(obj.reportName,obj.guzhangcishu).text());
                const guzhangshijian = parseInt(getTd(obj.reportName,obj.guzhangshijian).text());
                $('#stoptime').text(stopTime);
                $('#stoptotal').text(stopTotal);
                $('#guzhangcishu').text(guzhangcishu);
                $('#guzhangshijian').text(guzhangshijian);

                // 靠右对齐
                const textRight = function ($ele) {
                    let width = 0;
                    width = $ele[0].getBBox().width;
                    console.log(width);
                    $ele.attr('x',($ele.attr('x'))?($ele.attr('x') - width): - width)
                };
                textRight($('#stoptime'));
                textRight($('#stoptotal'));
                textRight($('#guzhangcishu'));
                textRight($('#guzhangshijian'));

            }

            equipment({
                reportName:'report1',
                stopTime:'A10-0',
                stopTotal:'B10-0',
                guzhangcishu:'C10-0',
                guzhangshijian:'D10-0'
            })
            // end 设备信息



            // start 库存信息
            function stock(obj) {
                // 显示内容的元素
                const totalShow = svg.find('#stockTotal');
                const avgShow = svg.find('#stockAvg');
                // 获取数据
                const total = parseInt(getTd(obj.reportName , obj.total).text());
                const avg = parseInt(getTd(obj.reportName , obj.avg).text());

                totalShow.text(total).css('cursor','pointer').click(function () {
                    histogram({
                        dataX:totalDateArr,
                        dataY:totalNumArr
                    })
                });
                avgShow.text(avg).css('cursor','pointer').click(function () {
                    histogram({
                        dataX:avgDateArr,
                        dataY:avgNumArr
                    })
                });

                // 扇形图
                const quxiang = getTd(obj.reportName , obj.quxiang).text() * 1;
                const wuquxiang = getTd(obj.reportName , obj.wuquxiang).text() * 1;
                const guodujuan = getTd(obj.reportName , obj.guodujuan).text() * 1;
                const sum = quxiang + wuquxiang + guodujuan;
                const list = [quxiang / sum  ,wuquxiang / sum, guodujuan / sum];
                const list2 = [quxiang,wuquxiang,guodujuan];
                const texts = $('#stockFanChart text');
                let num = 0 ;
                list.forEach((value, index) => {
                    let str = '';
                    let textX = '';
                    let textY = '';
                    num += value;
                    if (value > 0.5) {
                        str = 'M' + (Math.cos(Math.PI * ( num - value ) * 2) * 130 + 3394.654) + ',' + (Math.sin(Math.PI * ( num - value ) * 2) * 130 + 1670.82 ) + ' A 130,130 0 1,1 ' +
                            (Math.cos(Math.PI * num * 2) * 130 + 3394.654) + ',' + (Math.sin(Math.PI * num * 2) * 130 + 1670.82) + ' L3394.654,1670.82 Z  ';

                    }else {
                        str = 'M' + (Math.cos(Math.PI * ( num - value ) * 2) * 130 + 3394.654) + ',' + (Math.sin(Math.PI * ( num - value ) * 2) * 130 + 1670.82 ) + ' A 130,130 0 0,1 ' +
                            (Math.cos(Math.PI * num * 2) * 130 + 3394.654) + ',' + (Math.sin(Math.PI *  num * 2) * 130 + 1670.82) + ' L3394.654,1670.82 Z  ';
                    };
                    textX = Math.cos(Math.PI * 2 * (num - value / 2) ) * 65 + 3394.654;
                    textY = Math.sin(Math.PI * 2 * (num - value / 2) ) * 65 + 1670.82;
                    $('#stockFanChart path').eq(index).attr('d',str);
                    texts.eq(index).attr({'y':textY  + 13})
                        .text(parseInt(list2[index]))
                        .attr({'x':textX - texts.eq(index)[0].getBBox().width / 2});
                });

                // 柱状图
                const totalDateArr = getTdNum(obj.reportName,obj.totalDate);
                const totalNumArr = getTdNum(obj.reportName,obj.totalNum);
                const avgDateArr = getTdNum(obj.reportName,obj.avgDate);
                const avgNumArr = getTdNum(obj.reportName,obj.avgNum);

                // 柱状图函数
                function histogram(obj) {
                    const width = 512.067 / obj.dataX.length ;
                    const height = 237.624;
                    const width2 = width * 0.5;  // 柱子的宽度
                    const max = Math.max.apply(null , obj.dataY) ;

                    const line = parseInt(max).toString().length;
                    var num1 = 5;
                    for (let i = 0 ;i < line - 2 ; i++) {
                        num1 += '0';
                    };
                    const num = (Math.ceil(max / num1) * num1);

                    const list = [];
                    const listX = [];
                    obj.dataY.forEach((value , index ) => {
                        const d = 'M'+(3254.027 + width*0.25 + width * index)+',2075.115 v-'+ (value / num * height) +' h'+width2+' v '+(value / num * height)+' z';
                        const str = '<path d= "'+ d + '" fill="url(#histogram)"></path>';
                        const strx = '<tspan x="'+ (width * 0.4 + width * index ) +'">' + obj.dataX[index].substr(6) + '</tspan>'
                        list.push(str);
                        listX.push(strx);
                    });
                    svg.find('#stockHistogram').html(list.join(''));
                    svg.find('#stockHistogram path').each((index , value) => {
                        $(value).hover(function (e) {
                            TipsText({
                                x:e.clientX,
                                y:e.clientY,
                                isEnter:true,
                                num:obj.dataY[index],
                                orderby: obj.dataX[index]
                            })
                        },function () {
                            TipsText({

                                isEnter:false

                            })
                        })
                    })
                    svg.find('#histogramY text').each((index , value) => {
                        $(value).text(num / 4 * index / 1000 + 'k');
                    });
                    svg.find('#histogramX').html(listX.join(''));
                }
                totalShow.click();

            };
            stock({
                reportName:'report1',
                total:'A13-',
                avg:'B13-',
                totalDate:'C13-',
                totalNum:'D13-',
                avgDate:'E13-',
                avgNum:'F13-',
                quxiang: 'A17' ,
                wuquxiang:'B17',
                guodujuan:'C17'
            });
            // end 库存信息

            // start 累计产量
            function addProduct(obj) {
                // 重量
                const product_show = svg.find('#quxiangnum');
                const product_no_show = svg.find('#wuquxiangnum');
                // 指针
                const pointer_show = svg.find('#quxiang');
                const pointer_no_show = svg.find('#wuquxiang');
                // 百分比
                const percentage_num_show = svg.find('#quxiangpercentage');
                const percentage_no_num_show = svg.find('#wuquxiangpercentage');
                // 百分比数据
                const num = getTd(obj.reportName,obj.percentage).text();
                const num_no = getTd(obj.reportName,obj.percentage_no).text();

                // 绑定数据
                product_show.text(parseInt(getTd(obj.reportName,obj.product).text()));
                product_no_show.text(parseInt(getTd(obj.reportName,obj.product_no).text()));
                percentage_num_show.text((num * 100).toFixed(2) + '%');
                percentage_no_num_show.text((num_no * 100 ).toFixed(2) + '%');
                // 绑定指针
                pointer_show.attr('transform','rotate( ' + (num * 180 > 180 ? 180 : num * 180 ) + ' 3390,1020.284)');
                pointer_no_show.attr('transform','rotate( ' + (num_no * 180 > 180 ? 180 : num_no * 180 ) + ' 3390,1200.349)');
            }
            addProduct({
                reportName:'report1',
                product:'A20-',
                product_no:'D20-',
                percentage:'C20-',
                percentage_no:'F20-'
            });
            // end 累计产量


            // start 跳转页面
            function openWindow() {
                const stateShowArr = svg.find('[class^="state_"]');
                const matShowArr = svg.find('text[id^="mat_Q"]');
                stateShowArr.click(function () {
                    const code = $(this).attr('class').substr(6);
                    const index = urlArr.findIndex((value, index) => {
                        return value.unit_code.includes(code);
                    });
                    if (index != -1 ){
                        window.open(urlArr[index].url + code)
                    };
                });
                stockShowArr.css('cursor','pointer').click(function () {
                    const code = $(this).attr('id').substr(6);
                    window.open('http://10.70.16.168:37799/webroot/decision/' +
                        'view/form?viewlet=%E7%A1%85%E9%92%A2/%E5%BA%93%E5%8C%BA.frm&STOCK_NO='+code)
                });
                codeShowArr.css('cursor','pointer').click(function () {
                    const code = this.getAttribute('id').substr(11);
                    if (code == '518' || code == '318') {
                        IPlatInterop.Call4CForm('QMCPJ401B1' + code);
                    }else {
                        IPlatInterop.Call4CForm('QMZJJ4CP' + code);
                    }
                });

                const obj = {
                    'QMCPJ401B1002':['#mat_Q502','#mat_Q402'],
                    'QMCPJ401B1003':['#mat_Q403'],
                    'QMCPJ401B1012':['#mat_Q412'],
                    'QMCPJ401B1014':['#mat_Q314'],
                    'QMCPJ401B1018':['#mat_Q318','#mat_Q518'],
                    'TMSIJ400P2':['#stoptime','#stoptotal'],
                    'TMSIJ400PE':['#guzhangshijian','#guzhangcishu'],
                    'HBHA03':['#paifang']
                };

                for(let k in obj) {
                    obj[k].forEach(value => {
                        svg.find(value).css('cursor','pointer').click(function () {
                            IPlatInterop.Call4CForm(k);
                        });
                    })
                };

            };
            openWindow();
            // end 跳转页面
            // start 动画效果(跑马灯和右侧动画效果)
            function animation() {
                const circleArr = svg.find('path[class^="circle"]');
                let num = 0;
                // 跑马灯
                // 节流阀
                let flag = true;
                let num1 = 1755;
                let num2 = 0;
                // 内容数组
                let textArr = getTdNum('report1','A29');
                let length = textArr.length;
                const $box = svg.find('#anquan_2_ text ');
                function running(num) {
                    $box.html(textArr[num].replace('检查信息','<tspan fill="#F29600" font-size="40" font-weight="900">检查信息</tspan>').replace('公司安全信息','<tspan fill="#F29600" font-size="40" font-weight="900">公司安全信息</tspan>').replace('动火预报','<tspan fill="#F29600" font-size="40" font-weight="900">动火预报</tspan>').replace('高危预报','<tspan fill="#F29600" font-size="40" font-weight="900">高危预报</tspan>')).hover(function () {
                        flag = false;
                    },function () {
                        flag = true;
                    });
                }
                running(num2);

                setInterval(function () {
                    num++;
                    circleArr.each((index,value) => {
                        const $circle = $(value);
                        const num2 = $circle.attr('class').substr(6);
                        $circle.attr('transform','rotate('+(num * num2)+' 3503.13,500.478)');
                    });
                    if (flag) {
                        num1-=3;
                        $box.attr('x',num1);
                        if (num1 <=  -$box[0].getBBox().width) {
                            num1 = 1755;
                            num2++;
                            running(num2 % length);
                        };
                        $box.attr('x',1420 + num1 );
                    };
                },18);
            };
            animation();

            // end 动画效果
            // start 文字提示
            function TipsText(obj) {
                const $Tip = $('#TipsText');
                if (obj.isEnter) {
                    // 判断是进入还是离开
                    // 显示
                    $Tip.html('值:'+obj.num + '<br>' + '日期:' + obj.orderby)
                        .css({
                            'left':obj.x - 30,
                            'top':obj.y + 30
                        }).stop().fadeToggle(1000)
                }else {
                    $Tip.stop().fadeToggle(1000)
                }
            }
            // end 文字提示

            // start 环保信息
            const bingTu = function ({name,$ele,data,rIn,rOut,color,x,y}) {
                const $svg = $('div[widgetname="REPORT0"] td[id^="A1-0"]').find('svg');
                $ele = typeof $ele == 'string' ? $svg.find($ele) : $ele;
                if (!$ele[0]) {
                    console.log($ele,'环形图元素查询失败');
                    return;
                };
                if (typeof data == 'string') data = data.split(',');
                // 渲染圆环
                let sum = 0;
                let sum2 = 0;
                let pathArr = [];
                let textX = '';
                let textY = '';
                // 求和
                data = data.map(value => {
                    value *= 1;
                    sum += value;
                    return value;
                });
                data.forEach((value,index) => {
                    if (value / sum < 0.5) {
                        pathArr.push('<path d="M'+(x - rOut + rOut * Math.cos(Math.PI * 2 * sum2 / sum ))+','+(y - Math.sin(Math.PI * 2 * sum2 / sum) * rOut)+',A'+rOut+','+rOut+',0,0,0,'+(x - rOut + rOut * Math.cos(Math.PI * 2 * (sum2 + value) / sum ))+','+(y - Math.sin(Math.PI * 2 * (sum2 + value) / sum) * rOut)+',L'+(x - rOut)+','+y+' Z" fill="'+color[index]+' "></path>');
                    } else if(value / sum < 1) {
                        pathArr.push('<path d="M'+(x - rOut + rOut * Math.cos(Math.PI * 2 * sum2 / sum ))+','+(y - Math.sin(Math.PI * 2 * sum2 / sum) * rOut)+',A'+rOut+','+rOut+',0,1,0,'+(x - rOut + rOut * Math.cos(Math.PI * 2 * (sum2 + value) / sum ))+','+(y - Math.sin(Math.PI * 2 * (sum2 + value) / sum) * rOut)+',L'+(x - rOut)+','+y+' Z" fill="'+color[index]+' "></path>');
                    }else if(value / sum == 1){
                        pathArr.push('<circle cx="'+(x - rOut)+'" cy="'+ y +'" r="'+ rOut +'" fill="'+color[index]+' "/>');
                    }
                    sum2 += value;
                });
                if (rIn) {
                    pathArr.push('<circle r="'+rIn+'" cx="'+(x - rOut)+'" cy="'+y+'" fill="rgb(6,14,82)"></circle>');
                }

                if(name){
                    pathArr.push('<text x="'+(x - rOut)+'" y="'+(y + 13)+'" font-size="30" fill="white" class="name">'+name+'</text>');
                }
                data.forEach((value,index) => {
                    if(value > 0){
                        textX = Math.cos(Math.PI * 2 * (sum2 + value / 2)/sum) * 60 + x - rOut - 30;
                        textY = - Math.sin(Math.PI * 2 * (sum2 + value / 2)/sum) * 60 + y + 13;
                        pathArr.push('<text x="'+textX+'" y="'+textY+'" font-size="25" fill="white">'+parseInt(value)+'%</text>')
                    }
                    sum2 += value;
                });
                $ele.find('.path').html(pathArr.join(''));
                const $name = $ele.find('.path .name')
                $name.attr('x',$name.attr('x') - $name[0].getBBox().width / 2)
            };

            bingTu({
                name:'NOX',
                data:getTd('report1','A33-0').text().split(','),
                rOut:80,
                rIn:40,
                color:['#004DB5','#36C2E5','#EFD95B','#F59122'],
                x:3008.849,
                y:1488.707125,
                $ele:'#NOX'
            });
            bingTu({
                name:'粉尘',
                data:getTd('report1','B33-0').text().split(','),
                rOut:80,
                rIn:40,
                color:['#004DB5','#36C2E5','#EFD95B','#F59122'],
                x:3008.849,
                y:1669.487375,
                $ele:'#POWDER'
            });
            bingTu({
                name:'SO2',
                data:getTd('report1','C33-0').text().split(','),
                rOut:80,
                rIn:40,
                color:['#004DB5','#36C2E5','#EFD95B','#F59122'],
                x:3008.849,
                y:1850.267625,
                $ele:'#SO2'
            });
            bingTu({
                name:'综合',
                data:getTd('report1','D33-0').text().split(','),
                rOut:80,
                rIn:40,
                color:['#004DB5','#36C2E5','#EFD95B','#F59122'],
                x:3008.849,
                y:2031.047875,
                $ele:'#TOL'
            });

            // end 环保信息
            f2();
        }
    },10);
};
function f2() {

    const svg = $('div[widgetname="REPORT0"] td[id^="A1-0"]').find('svg');
    const stockShowArr = svg.find('text[id^="stock_"]');
    const codeShowArr = svg.find('text[id^="unit_code"]');
    // start 机组开停机状态
    function state(obj) {
        // 获取所有需要变色的机组图元素
        const stateShowArr = svg.find('[class^="state"]');
        const abilityShowArr = svg.find('text[id^="ability_Q"]');
        const matShowArr = svg.find('text[id^="mat_Q"]');
        // 获取机组号数组
        const codeArr = getTdNum(obj.reportName , obj.code);
        codeArr.push('Q165');
        // 获取状态数据
        const stateArr = getTdNum(obj.reportName , obj.state);
        stateArr.push('1000')
        // 获取材料号的机组号
        const codeMatArr = getTdNum(obj.reportName, obj.codeMat);
        // 获取材料号
        const MatArr = getTdNum(obj.reportName, obj.mat);
        // 获取综合制造能力
        const codeAbilityArr = getTdNum(obj.reportName , obj.codeAbility);
        const abilityArr = getTdNum(obj.reportName, obj.ability);

        // 迭代机组元素
        // 都变成灰色的先
        stateShowArr.attr('fill','#9E9E9F').css('cursor','pointer');
        codeShowArr.attr('fill','#888888');
        abilityShowArr.attr('fill','#888888');
        matShowArr.attr('fill','#9E9E9F').text('');
        abilityShowArr.attr('fill','#9E9E9F').text('0%')

        codeArr.forEach((value,index) => {
            // 获取机组对应的状态
            const state = stateArr[index];
            if (state == '1000' ) {
                svg.find('.state_'+value).attr('fill','#00B5E2');
                codeShowArr.filter('#unit_code_' + value).attr('fill','#FFFFFF');
                abilityShowArr.filter('#ability_' + value).attr('fill','#03FFFF');
                matShowArr.filter('#mat_' + value).attr('fill','#2CA6E0').show();
            }else if (state == '6000') {
                svg.find('.state_'+value).attr('fill','#9E9E9F');
                codeShowArr.filter('#unit_code_' + value).attr('fill','#9E9E9F');
                abilityShowArr.filter('#ability_' + value).attr('fill','#888888');
                matShowArr.filter('#mat_' + value).attr('fill','#9E9E9F').hide();
            };
        });



        codeMatArr.forEach((value, index) => {
            matShowArr.filter('#mat_' + value).text(MatArr[index]);
        });
        codeAbilityArr.forEach((value,index ) => {
            if (value == 'Q300') {
                abilityShowArr.filter('#ability_'+value).attr('fill','#FFFFFF').text((abilityArr[index]*100).toFixed(2) + '%')
            }else {
                abilityShowArr.filter('#ability_'+value).text(parseInt(abilityArr[index]*100) + '%');
            }
        });
        abilityShowArr.filter('[id^="ability_Q16"],[id^="ability_Q17"]').each((index,value) => {
            $(value).text(parseInt(Math.random() * 20)  + 80 + '%');
        })
        svg.find('#ability_Q300').click(function (event) {
            FR.doHyperlink(event||window.event, [{"data":"var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({\"url\":\"/webroot/decision/view/form?viewlet=%252F%25E7%25A1%2585%25E9%2592%25A2%252F%25E8%25B6%258B%25E5%258A%25BF%25E5%259B%25BE.frm\",\"para\":{\"__pi__\":true},\"target\":\"_dialog\",\"feature\":{\"width\":2000,\"height\":1100,\"isCenter\":true,\"title\":\"\"},\"title\":\"网络报表1\"})}, this, as)","name":"网络报表1"}], true)
        }).css('cursor','pointer');
        // 累计实际产量趋势图
        svg.find('#wuquxiangpercentage,#quxiangpercentage').click(function (event) {
            FR.doHyperlink(event||window.event, [{"data":"var as=arguments; return FR.tc(function(){FR.doHyperlinkByGet4Reportlet({\"url\":\"/webroot/decision/view/form?viewlet=%25E7%25A1%2585%25E9%2592%25A2%252F%25E7%25B4%25AF%25E8%25AE%25A1%25E5%25AE%259E%25E9%2599%2585%25E4%25BA%25A7%25E9%2587%258F%25E8%25B6%258B%25E5%258A%25BF%25E5%259B%25BE.frm\",\"para\":{\"__pi__\":true},\"target\":\"_dialog\",\"feature\":{\"width\":2000,\"height\":1100,\"isCenter\":true,\"title\":\"\"},\"title\":\"网络报表1\"})}, this, as)","name":"网络报表1"}], true)
        }).css('cursor','pointer');
    };
    state({
        reportName:'report1',
        code:'A23-',
        state:'B23-',
        codeMat : 'C23-',
        mat : 'D23-',
        codeAbility: 'E23-',
        ability:'F23-'
    });
    // end 开停机状态
    // start
    function stockState(obj) {

        // 获取机组号
        const codeStrokeArr = getTdNum(obj.reportName , 'A26-');
        // 获取数据
        const strokeArr = getTdNum(obj.reportName , obj.num);
        // 库区


        // 清空缓存
        stockShowArr.text('0%');
        // 渲染数据
        codeStrokeArr.forEach((value,index) => {
            let color = '';
            const num = parseInt( strokeArr[index] * 100 );
            if (num < 70 ) {
                color = '#9FD200';
            }else if (num >= 90) {
                color = '#FF2A00';
            }else {
                color = '#F29600';
            }
            stockShowArr.filter('#stock_' + value).text(num + '%' ).attr('fill',color);
        });
    };
    stockState({
        reportName:'report1',
        code:'A26-',
        num:'B26-'
    });
};

var form = this.options.form;
setInterval(function () {
    form.getWidgetByName('report1').gotoPage(1,"{}",true);
    const data = $('#date');
    const year = new Date().getFullYear();
    const month = new Date().getMonth() + 1;
    const day = new Date().getDate();
    data.text(year + '.' + (month < 10 ? '0' + month : month) + '.' + (day < 10 ? '0' + day : day));
    f2();
},60000);