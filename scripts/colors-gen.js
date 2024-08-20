const hex = process.argv.slice(2);

if (hex.length !== 1) {
    console.log("Error!");
    process.exit(1);
}

const str = hex[0];
const r = parseInt(str.slice(0, 2), 16);
const g = parseInt(str.slice(2, 4), 16);
const b = parseInt(str.slice(4, 6), 16);

console.log(`${r/256.0}, ${g/256.0}, ${b/256.0}`);