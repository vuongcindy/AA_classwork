// uses arguments keyword
// must use "arguments" if there is no arguments
function sum() {
    let total = 0;
    let len = arguments.length
    for (let i = 0; i < len; i++) {
        total += arguments[i];
    }
    console.log(total);
}

//uses ... rest operator
// "nums" is banana
function sum(...nums) {
    let total = 0;
    let len = nums.length
    for (let i = 0; i < len; i++) {
        total += nums[i];
    }
    console.log(total);
}

// sum(1, 2, 3, 4); // === 10;
// sum(1, 2, 3, 4, 5); // === 15;