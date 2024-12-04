"use strict";
let firstName = prompt("Please enter a firstName");
let lastName = prompt("Please enter a lastName");
let fullName;
function firstLetterToUpperCase(p) {
    if (!p) {
        return "";
    }
    return p.charAt(0).toUpperCase() + p.slice(1).toLowerCase();
}
fullName =
    firstLetterToUpperCase(firstName) + " " + firstLetterToUpperCase(lastName);
alert(fullName);
let str = prompt("Please enter here: ");
console.log([...new Set(str)].join(""));
function sum(p1, p2) {
    let a = Number(p1);
    let b = Number(p2);
    if (!isNaN(a) && !isNaN(b)) {
        return `Tong cua phep tinh la ${a + b}`;
    }
    else {
        return `Phep tinh khong hop le`;
    }
}
function product(p1, p2) {
    let a = Number(p1);
    let b = Number(p2);
    if (!isNaN(a) && !isNaN(b)) {
        return `Tich cua phep tinh la ${a * b}`;
    }
    else {
        return `Phep tinh khong hop le`;
    }
}
function difference(p1, p2) {
    let a = Number(p1);
    let b = Number(p2);
    if (!isNaN(a) && !isNaN(b)) {
        return `Hieu cua phep tinh la ${a - b}`;
    }
    else {
        return `Phep tinh khong hop le`;
    }
}
function quotient(p1, p2) {
    let a = Number(p1);
    let b = Number(p2);
    if (!isNaN(a) && !isNaN(b)) {
        return `Thuong cua phep tinh la ${a / b}`;
    }
    else {
        return `Phep tinh khong hop le`;
    }
}
let result = product("5", 6);
console.log(result);
function giaiThua(p1) {
    let a = Number(p1);
    let ketQua = 1;
    if (!isNaN(a) && a > 0 && Number.isInteger(a)) {
        for (let i = a; i >= 1; i--) {
            ketQua *= i;
        }
        return `Kết quả giai thừa của ${a} là ${ketQua}`;
    }
    else {
        return `Phép tính không hợp lệ`;
    }
}
function luyThua(p1, p2) {
    let a = Number(p1);
    let b = Number(p2);
    if (!isNaN(a) && !isNaN(b)) {
        return `Kết quả lũy thừa ${a}^${b} là ${a ** b}`;
    }
    else {
        return `Phép tính không hợp lệ`;
    }
}
function can(p1, p2) {
    let a = Number(p1);
    let b = Number(p2);
    if (!isNaN(a) && !isNaN(b) && a > 0) {
        const result = Math.pow(b, 1 / a);
        return `Căn bậc ${a} của ${b} là ${result}`;
    }
    else {
        return `Phép tính không hợp lệ`;
    }
}
function calculate(operation) {
    const input1 = document.getElementById("input1").value;
    const input2 = document.getElementById("input2").value;
    let result;
    switch (operation) {
        case "sum":
            result = sum(input1, input2);
            break;
        case "difference":
            result = difference(input1, input2);
            break;
        case "product":
            result = product(input1, input2);
            break;
        case "quotient":
            result = quotient(input1, input2);
            break;
        case "giaiThua":
            result = giaiThua(input1);
            break;
        case "luyThua":
            result = luyThua(input1, input2);
            break;
        case "can":
            result = can(input1, input2);
            break;
        default:
            result = "Unknown operation";
    }
    const resultElement = document.getElementById("result");
    resultElement.textContent = result;
}
function bangCuuChuong() {
    for (let i = 1; i < 10; i++) {
        for (let j = 1; j <= 10; j++) {
            let result = `${i} x ${j} = ${i * j}`;
            console.log(result);
        }
        console.log("--------------------");
    }
}
bangCuuChuong();
