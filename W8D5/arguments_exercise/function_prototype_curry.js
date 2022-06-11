// uses Function.prototype.apply
Function.prototype.curry = function(numArgs) {
    let numbers = [];

    return function(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            console.log(numbers.reduce((acc, ele) => {
                return acc + ele;
            }));         
        }
        return Function.prototype.apply(num);
    } 
}

// uses ... operator


function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
  }
  
   console.log(sumThree(4, 20, 6)); // == 30
  
//   you'll write `Function#curry`!
  let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
  f1 = f1(4); // [Function]
  f1 = f1(20); // [Function]
  f1 = f1(6); // = 30
  
//   or more briefly:
  console.log(sumThree.curry(3)(4)(20)(6)); // == 30