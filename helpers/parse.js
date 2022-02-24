const fs = require('fs');

const inputFileName = 'Applicant.sql'
const fileContent = fs.readFileSync(inputFileName, { encoding: 'utf-8' });
const lines = fileContent.split('\n');

let output = [];

lines.forEach((line, index) => {
  output.push(`(${line.trim()}),`);
});

fs.writeFileSync('out.txt', output.join('\n'));

console.log('finito');