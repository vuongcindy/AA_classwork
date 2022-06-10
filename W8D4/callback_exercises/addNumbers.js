const readline = require("readline");
const reader = readline.createInterface({
    input: process.stdin, 
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        //prompt user for number (use reader)
        reader.question("please type a number:", function(callback) {
        // pass callback that:
            // uses parseInt to parse input
            let inputNum = parseInt(callback);
            // increment sum and console.log it
            sum += inputNum;
            console.log("current num:" + sum);
            // recursively calls addNumbers again passing in: increased sum, decreased numsLeft, same completionCallback
            addNumbers(sum, numsLeft - 1, completionCallback);
        });
    } else {
        return completionCallback(sum);
    }
}


addNumbers(0, 3, function(sum) {
    console.log(`total sum: ${sum}`);
    reader.close();
}); 