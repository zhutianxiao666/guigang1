export default function () {

    setInterval(() => {
        this.animations.forEach(cd => cd());
    },30)
}