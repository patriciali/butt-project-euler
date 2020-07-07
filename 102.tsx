class Point {
    x: number;
    y: number;
    constructor(x: number, y: number) {
        this.x = x;
        this.y = y;
    }
}

// If line is vertical, the convention will be that right is "above"
function isPointAboveRadialLine(point: Point): boolean {
    return true;
}

function main() {
    const filename = '102.txt';

}

main();

// I had to put this here so the namespaces don't collide, but in order to run via
// command line you have to comment this out
// export default {};
