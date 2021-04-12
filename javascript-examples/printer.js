function createPrinter(printer) {
  return str => {
    const capitalized = str.toUpperCase();
    return printer(capitalized);
  };
}

function starPrinter(str) {
  return `***${str}***`;
}

function hashPrinter(str) {
  return `#${str}`;
}

const printWithStars = createPrinter(starPrinter);
const printWithHash = createPrinter(hashPrinter);

printWithStars('Glorious title');
printWithHash('tag');
