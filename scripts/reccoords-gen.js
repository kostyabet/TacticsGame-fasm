const args = process.argv.slice(2);

if (args.length !== 4) {
    console.log("Использование: node script.js x1 y1 x2 y2");
    process.exit(1);
}

function GenX(x) {
    return x/960.0-1.0;
}
function GenY(y) {
    return -(y/540.0-1.0);
}

const x1 = GenX(parseInt(args[0]));
const y1 = GenY(parseInt(args[1]));

const x2 = GenX(parseInt(args[2]));
const y2 = GenY(parseInt(args[3]));

console.log(`
    invoke	glVertex3f, ${x1}, ${y1}, 0.0
    invoke	glVertex3f, ${x1}, ${y2}, 0.0
    invoke	glVertex3f, ${x2}, ${y2}, 0.0
    invoke	glVertex3f, ${x2}, ${y1}, 0.0 
`);