const { execSync } = require('child_process');
const path = require('path');
const fs = require('fs');

console.log("10% - Read setup.json;");
const config = JSON.parse(fs.readFileSync('setup.json', 'utf8'));

console.log("20% - Check build parameters;");
const buildType = process.argv[2] || 'Debug';
if (!buildType || (buildType !== 'Debug' && buildType !== 'Release')) {
    console.error("Usage: node build.js <Debug|Release>");
    process.exit(1);
}

console.log("35% - Branching by parameter;");
const buildConfig = config[buildType.toLowerCase()];
if (!buildConfig) {
    console.error(`Error: Unknown build type: ${buildType}`);
    process.exit(1);
}

try {
    console.log(`50% - Switching to the compiler directory: ${process.cwd()};`);
    process.chdir(config.fasmPath);

    console.log(`55% - Try to build;`);
    const command = `fasm ${buildConfig.input} ${buildConfig.output}`;
    execSync(command, { stdio: 'inherit' });
    console.log(`85% - Success`);

    console.log(`90% - Return in work directory: ${process.cwd()};`);
    process.chdir(config.projectDir);
    console.log(`Complete with exit code 0.`);
    process.exit(0);
} catch (error) {
    console.error(`Error: ${error.message}`);
    process.exit(1);
}
