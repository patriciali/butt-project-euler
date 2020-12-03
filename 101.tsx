function cube(n: number): number {
    return Math.pow(n, 3)
}

function u(n: number): number {
    let result = 0;
    for (let i = 0; i < 11; i += 1) {
        result += Math.pow(-1, i) * Math.pow(n, i);
    }
    return result;
}

function getFirstIncorrectTerm(sequence: Array<number>): number {
    if (sequence.length === 1) {
        return sequence[0];
    }

    const differences = [];
    for (let i = 1; i < sequence.length; i += 1) {
        differences.push(sequence[i] - sequence[i-1]);
    }
    const thingToAddToGetNextTerm = getFirstIncorrectTerm(differences);
    return sequence[sequence.length - 1] + thingToAddToGetNextTerm;
}

function main(): void {
    // For a function of order 10, we only need to add firstIncorrectTerms for sequences of length <= 10
    const numTermsToAdd = 10;
    const sequenceGeneratingFunction = u;

    const sequence = [];
    for (let n = 1; n < numTermsToAdd + 1; n += 1) {
        sequence.push(sequenceGeneratingFunction(n));
    }

    let sum = 0;
    for (let i = 1; i < numTermsToAdd + 1; i += 1) {
        sum += getFirstIncorrectTerm(sequence.slice(0, i));
    }

    console.log(sum);
}

// I had to put this here so the namespaces don't collide, but in order to run via
// command line you have to comment this out
export default {};
