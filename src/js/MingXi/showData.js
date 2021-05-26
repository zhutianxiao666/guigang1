export default function (data) {
    const listBig = [];
    const orders = JSON.parse(order);
    const titles = JSON.parse(title);
    const widths = Number(width) || 100;
    // 修改html字体大小
    if (window.screen.width > 3000) {
        document.querySelector('html').style.fontSize = '15px';
    }else {
        document.querySelector('html').style.fontSize = '12px';
    }

    let listSmall = [];
    titles.forEach((value,index) => {
        if (index == 0) {
            listSmall.push(`<li class="title" ><span style="width: 80px">序列号</span><span style="flex: ${orders[index] || 1}">${value}</span>`)
        } else if (index == titles.length - 1) {
            listSmall.push(`<span style="flex: ${orders[index] || 1}">${value}</span></li>`);
            listBig.push(listSmall.join(''));
            listSmall = [];
        }else {
            listSmall.push(`<span style="flex: ${orders[index] || 1}">${value}</span>`);
        };
    })
    function isTrue() {
        for (let i = 0 ; i < data.length ; i++ ) {
            for (let j = 0 ; j < data[i].length ; j++) {
                if (data[i][j] != '') {
                    return true;
                    break;
                }
            }
        }
        return false
    };
    isTrue();

    if (isTrue()) {
        data.forEach((value,index) => {

            value.forEach((value1 ,index1) => {
                if (index1 == 0) {
                    listSmall.push(`<li><span style="width: 80px">${index + 1}</span><span style="flex: ${orders[index1] || 1}">${value1}</span>`);
                }else if (index1 == value.length - 1) {
                    listSmall.push(`<span style="flex: ${orders[index1] || 1}">${value1}</span></li>`);
                }else {
                    listSmall.push(`<span style="flex: ${orders[index1] || 1}">${value1}</span>`);
                };
            });
            listBig.push(listSmall.join(''));
            listSmall = [];
        });

    };
    $('#content .main').html(listBig.join(''));
    $('#content .main li').css({
        'width': widths + '%'
    });

}