const { execSync } = require('child_process');
const path = require('path');
const fs = require('fs');

console.log("10% - Read setup.json;");
const config = JSON.parse(fs.readFileSync('setup.json', 'utf8'));

console.log("20% - Reading the necessary information from .json;");
const ollyDbgPath = config.ollyDbgPath;
const executablePath = config.debugExecutablePath;
const projectDir = config.projectDir;

try {
    console.log(`40% - check is debag file exist;`);
    if (!fs.existsSync(executablePath)) 
        {
        throw new Error(`Executable file not found: ${executablePath}`);
    }    

    console.log(`50% - Switching to Olly Dbg directory: ${process.cwd()};`);
    process.chdir(path.dirname(ollyDbgPath));

    console.log(`55% - Start up Oly Dbg;`);
    const command = `"${ollyDbgPath}" "${executablePath}"`;
    execSync(command, { stdio: 'inherit' });

    console.log(`90% - Return in work directory: ${process.cwd()};`);
    process.chdir(projectDir);
    console.log(`Complete with exit code 0.`);
    process.exit(0);
} catch (error) {
    console.error(`Error: ${error.message}`);
    process.exit(1);
}
