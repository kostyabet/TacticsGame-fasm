const { execSync } = require('child_process');
const path = require('path');
const fs = require('fs');
const { promisify } = require('util');
const ncp = promisify(require('ncp').ncp);

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
    const command = `fasm ${buildConfig.input} ${buildConfig.output} -s ${buildConfig.folder}tactickgame.fas`;
    execSync(command, { stdio: 'inherit' });
    console.log(`85% - Success`);

    console.log(`90% - Return in work directory: ${process.cwd()};`);
    process.chdir(config.projectDir);
    process.exit(0);
    // const sourceFolder = path.join(config.projectDir, config.copy.srcFolder);
    // const destFolder = path.join(buildConfig.folder, config.copy.destFolder);
    // console.log(`0% - Start copy source from ${sourceFolder} to ${destFolder}`);
    // ncp(sourceFolder, destFolder)
    // .then(() => {
    //     console.log(`100% - Files copied successfully from ${sourceFolder} to ${destFolder}`);
    //     process.exit(0);
    // })
    // .catch(err => {
    //     console.error(`Error copying files: ${err}`);
    //     process.exit(1);
    // });
} catch (error) {
    console.error(`Error: ${error.message}`);
    process.exit(1);
}
