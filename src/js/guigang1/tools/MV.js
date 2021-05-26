
// const data = {
//     a1:{
//         val:111,
//         cds:[]
//     }
// }




function MV({data= {},cds}) {
    const me = this;
    this.data = data;

    this.cds = typeof cds == 'function' ? [cds] : [...cds];

    for (let key in this.data) {
        Object.defineProperty(me,key,{
            configurable:false,
            enumerable:true,
            get() {
                return me.data[key]
            },
            set(v) {
                me.data[key] = v;
                me.cds.forEach(cd => cd.call(me));
            }
        })
    };
    this.cds.forEach(cd => cd.call(this))
};
MV.prototype.append = function (key,cds) {
    const me = this
    if (cds instanceof Array) {
        cds.forEach(cd => cd.call(me));
        this.cds.push(...cds);
    }else if (typeof cds == 'function') {
        cds.call(me);
        this.cds.push(cds);
    }
};

export default MV;
