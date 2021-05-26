const obj = {
    _data:{}
}
Object.defineProperty(obj,'name',{
    set(v) {
        console.log(this)
        this._data.name = v;
    },
    get() {
        return  this._data.name
    }
});
obj.name = 'aaa';
console.log(obj.name);