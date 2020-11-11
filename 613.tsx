function main() {
    const result = (Math.log(256/625) + 3 * Math.atan(3/4)) / 6 / Math.PI + (Math.log(27/125) + 4 * Math.atan(4/3)) / 8 / Math.PI + 1/4;
    console.log(result);
}

main();

// I had to put this here so the namespaces don't collide, but in order to run via
// command line you have to comment this out
export default {};
