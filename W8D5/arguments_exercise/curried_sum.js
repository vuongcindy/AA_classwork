function curriedSum(numArgs) {
    let numbers = [];

    return function _curriedSum(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            console.log(numbers.reduce((acc, ele) => {
                return acc + ele;
            }));         
        }
        return _curriedSum;
    };
}

const sum = curriedSum(4);
sum(5)(30)(20)(1); // => 56