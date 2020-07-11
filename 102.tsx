import * as fs from 'fs';

function isPointStrictlyAboveRadialLine(
    radialLineRefPointX: number,
    radialLineRefPointY: number,
    pointX: number,
    pointY: number,
): boolean {
    // If line is vertical, the convention will be that right is "above"
    if (radialLineRefPointX === 0) {
        return pointX > radialLineRefPointX;
    }
    return pointY > radialLineRefPointY * pointX / radialLineRefPointX;
}

function doesTriangleContainOrigin(
    aX: number,
    aY: number,
    bX: number,
    bY: number,
    cX: number,
    cY: number,
): boolean {
    // for each vertex, check that the other two are on opposite sides of its radial line
    return (
        (isPointStrictlyAboveRadialLine(aX, aY, bX, bY) !== isPointStrictlyAboveRadialLine(aX, aY, cX, cY)) &&
        (isPointStrictlyAboveRadialLine(bX, bY, aX, aY) !== isPointStrictlyAboveRadialLine(bX, bY, cX, cY)) &&
        (isPointStrictlyAboveRadialLine(cX, cY, aX, aY) !== isPointStrictlyAboveRadialLine(cX, cY, bX, bY))
    );
}

function main() {
    const filename = '102.txt';
    const lines = fs.readFileSync(filename, 'utf8').split('\n').filter(line => {
        return line.trim().length !== 0;
    });

    let numTrianglesThatContainOrigin = 0;
    for (const line of lines) {
        const coords = line.split(',');
        const doesTriangleContainOriginInner = doesTriangleContainOrigin(
            parseInt(coords[0]),
            parseInt(coords[1]),
            parseInt(coords[2]),
            parseInt(coords[3]),
            parseInt(coords[4]),
            parseInt(coords[5]),
        );
        if (doesTriangleContainOriginInner) {
            numTrianglesThatContainOrigin += 1;
        }
    }
    console.log(numTrianglesThatContainOrigin);
}

main();

// I had to put this here so the namespaces don't collide, but in order to run via
// command line you have to comment this out
export default {};
