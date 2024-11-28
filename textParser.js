const process = require('process');

const inputString = process.argv[2];

if (!inputString) {
    console.log('Put string for encoding.');
    process.exit(1);
}

let encodedString = "";
for (let i = 0; i < inputString.length; i++) {
    
    
    if (inputString.charCodeAt(i) >= 'А'.charCodeAt(0) && inputString.charCodeAt(i) <= 'Е'.charCodeAt(0))
        encodedString += (inputString.charCodeAt(i) - 'А'.charCodeAt(0) + 1) + ", ";
    if (inputString.charCodeAt(i) >= 'а'.charCodeAt(0) && inputString.charCodeAt(i) <= 'е'.charCodeAt(0))
        encodedString += (inputString.charCodeAt(i) - 'а'.charCodeAt(0) + 1) + ", ";
    if (inputString.charCodeAt(i) == 'ё'.charCodeAt(0) || inputString.charCodeAt(i) == 'Ё'.charCodeAt(0))
        encodedString += 7 + ", ";
    if (inputString.charCodeAt(i) >= 'Ж'.charCodeAt(0) && inputString.charCodeAt(i) <= 'Я'.charCodeAt(0))
        encodedString += (inputString.charCodeAt(i) - 'Ж'.charCodeAt(0) + 8) + ", ";
    if (inputString.charCodeAt(i) >= 'ж'.charCodeAt(0) && inputString.charCodeAt(i) <= 'я'.charCodeAt(0))
        encodedString += (inputString.charCodeAt(i) - 'ж'.charCodeAt(0) + 8) + ", ";
    if (inputString.charCodeAt(i) >= '0'.charCodeAt(0) && inputString.charCodeAt(i) <= '9'.charCodeAt(0))
        encodedString += (inputString.charCodeAt(i) - '0'.charCodeAt(0) + 34) + ", ";
    switch (inputString.charCodeAt(i)) {
        case  ' '.charCodeAt(0): encodedString += 44 + ",\\\n"; break;
        case  ','.charCodeAt(0): encodedString += 45 + ", "; break;
        case  '.'.charCodeAt(0): encodedString += 46 + ", "; break;
        case  '?'.charCodeAt(0): encodedString += 47 + ", "; break;
        case  '!'.charCodeAt(0): encodedString += 48 + ", "; break;
        case  '-'.charCodeAt(0): encodedString += 49 + ", "; break;
        case '\n'.charCodeAt(0): encodedString += 50 + ", "; break;
    }
}
encodedString += '0';

console.log(`Закодированная строка: \n${encodedString}`);