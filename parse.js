const fs = require('fs');

const fileContent = fs.readFileSync('Applicant.sql', { encoding: 'utf-8' });

const lines = fileContent.split('\n');
let newLines = [];

console.log('begin split', lines.length);

lines.forEach((line, index) => {
  newLines.push(`(${line.trim()}),`);
});

fs.writeFileSync('out.txt', newLines.join('\n'));

console.log('done');