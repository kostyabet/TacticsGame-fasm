const { execSync } = require('child_process');
const path = require('path');
const fs = require('fs');

console.log("10% - Read setup.json;");
const config = JSON.parse(fs.readFileSync('setup.json', 'utf8'));

console.log("20% - Check build parameters;");
const buildType = process.argv[2] || 'Debug';
if (!buildType || (buildType !== 'Debug' && buildType !== 'Release')) {
    console.error("Usage: node run.js <Debug|Release>");
    process.exit(1);
}

console.log("35% - Branching by parameter;");
const buildConfig = config[buildType.toLowerCase()];
if (!buildConfig) {
    console.error(`Error: Unknown build type: ${buildType}`);
    process.exit(1);
}

try {
    console.log(`40% - check is file exist;`);
    if (!fs.existsSync(buildConfig.output)) 
    {
        throw new Error(`Executable file not found: ${buildConfig.output}`);
    }  

    console.log(`55% - Try to run;`);
    const command = `start ${buildConfig.output}`;
    execSync(command, { stdio: 'inherit' });
    console.log(`85% - Success`);
    console.log(`Complete with exit code 0.`);
    process.exit(0);
} catch (error) {
    console.error(`Error: ${error.message}`);
    process.exit(1);
}