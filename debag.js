const { execSync } = require('child_process');
const path = require('path');
const fs = require('fs');

// Загрузка конфигурации из setup.json
const config = JSON.parse(fs.readFileSync('setup.json', 'utf8'));

// Пути к OllyDbg и исполняемому файлу из конфигурации
const ollyDbgPath = config.ollyDbgPath;
const executablePath = config.debugExecutablePath;
const projectDir = config.projectDir;

try {
    // Переход в директорию с OllyDbg
    process.chdir(path.dirname(ollyDbgPath));
    console.log(`Current directory: ${process.cwd()}`);

    // Запуск OllyDbg с переданным файлом
    const command = `"${ollyDbgPath}" "${executablePath}"`;
    console.log(`Executing: ${command}`);
    execSync(command, { stdio: 'inherit' });

    // Возврат в директорию проекта
    process.chdir(projectDir);
    console.log(`Returned to directory: ${process.cwd()}`);

} catch (error) {
    console.error(`Error: ${error.message}`);
    process.exit(1);
}
