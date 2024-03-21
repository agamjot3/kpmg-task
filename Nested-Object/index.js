const getValueFromNestedObject = require('./main');

const object1 = {"a":{"b":{"c":"d"}}};
const key1 = "a/b/c";
console.log(getValueFromNestedObject(object1, key1)); 
// Expected output: "d"

const object2 = {"x":{"y":{"z":"a"}}};
const key2 = "x/y/z";
console.log(getValueFromNestedObject(object2, key2)); 
// Expected output: "a"

const object3 = {"p":{"q":{"r": {"s": "t"}}}};
const key3 = "p/q/r/s";
console.log(getValueFromNestedObject(object3, key3)); 
// Expected output: "t"


// Testing with non-existent keys
const object5 = {"foo":{"bar":"baz"}};
const key5 = "foo/nonexistent";
console.log(getValueFromNestedObject(object5, key5)); 
// Expected output: undefined


