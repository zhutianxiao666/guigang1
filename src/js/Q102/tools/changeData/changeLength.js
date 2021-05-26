export function change2Fixed(data,length) {
    data = Number(data);
    if (isNaN(data)) {
        data = 0;
    };
    data = data.toFixed(length);
    return data;
};
