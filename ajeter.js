const aaa = Array(10000).fill('Toto');
const bbb = aaa.slice();

let result = [];
let t1 = Date.now();
for (let i = 0; i < 10000; i++){
    //result.push(aaa.join() === bbb.join());
    result.push(aaa.map((x, i) => x != bbb[i] ));
}

console.log(result, "\ndurée : ", Date.now()-t1);


// let a = [1, 2, 3, 4];
// const b = [1, 2, 3, 5];
// console.log(a.filter((x, i) => x == b[i]));