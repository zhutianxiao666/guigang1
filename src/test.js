var obj = {
    name:'ztx',
    age:333
};

function MVVM(obj) {
    this.data = {};
    for (let key in obj) {
        this.data[key] = obj[key];
        this.define(this,key)
    };

};
console.log(new MVVM(obj));

MVVM.prototype.define= function(obj,key) {
    const me = this;
    Object.defineProperty(obj,key,{
        get() {

            return me.data[key]
        },
        set(v){
            me.data[key] = v;
        }

    })
}