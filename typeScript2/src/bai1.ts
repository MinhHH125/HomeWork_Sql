// Khai báo 2 biến firstName và lastName có kiểu dữ liệu string và gán giá trị cho chúng.
// Tiến hành ghép 2 chuỗi lại với dấu cách ở giữa và gán giá trị đã được ghép cho biến fullName.
// Trước khi ghép thì kiểm tra xem các chữ cái đầu đã viết hoa chưa, nếu chưa thì viết hoa chữ cái đầu trong hai chuỗi.

let firstName: string | null = prompt("Please enter a firstName");
let lastName: string | null = prompt("Please enter a lastName");
let fullName: string;

function firstLetterToUpperCase(p: string | null): string {
  if (!p) {
    return "";
  }
  return p.charAt(0).toUpperCase() + p.slice(1).toLowerCase();
}
fullName =
  firstLetterToUpperCase(firstName) + " " + firstLetterToUpperCase(lastName);
alert(fullName);

//bai 4
// Khai báo một biến kiểu string và gán giá trị cho biến đó là một câu bất kỳ.
// Hãy lọc tất cả các ký tự bị trùng lặp ra khỏi chuỗi đó.

let str: string | null = prompt("Please enter here: ");
console.log([...new Set(str)].join(""));

//bai5
// Xây dựng các hàm thực hiện các phép toán cộng, trừ , nhân, chia, mỗi hàm có 2 tham số và trả về kết quả của phép tính.
//  Kiểu dữ liệu của tham số có thể là number hoặc string.
//   Nếu kiểu dữ liệu là string thì trong hàm phải kiểm tra xem có thể chuyển về dạng số được không,
//    nếu có thể thì thực hiện phép tính như bình thường, nếu không thì thông báo không hợp lệ.

function sum(p1: number | string, p2: number | string): string {
  let a = Number(p1);
  let b = Number(p2);
  if (!isNaN(a) && !isNaN(b)) {
    return `Tong cua phep tinh la ${a + b}`;
  } else {
    return `Phep tinh khong hop le`;
  }
}

function product(p1: number | string, p2: number | string): string {
  let a = Number(p1);
  let b = Number(p2);
  if (!isNaN(a) && !isNaN(b)) {
    return `Tich cua phep tinh la ${a * b}`;
  } else {
    return `Phep tinh khong hop le`;
  }
}

function difference(p1: number | string, p2: number | string): string {
  let a = Number(p1);
  let b = Number(p2);
  if (!isNaN(a) && !isNaN(b)) {
    return `Hieu cua phep tinh la ${a - b}`;
  } else {
    return `Phep tinh khong hop le`;
  }
}
function quotient(p1: number | string, p2: number | string): string {
  let a = Number(p1);
  let b = Number(p2);
  if (!isNaN(a) && !isNaN(b)) {
    return `Thuong cua phep tinh la ${a / b}`;
  } else {
    return `Phep tinh khong hop le`;
  }
}

let result = product("5", 6);
console.log(result);

//Bai 6
// Xây dựng giao diện máy tính đơn giản gồm 2 ô input
// và các nút tính toán để có thể sử dụng các hàm ở bài 5 với dữ liệu được nhập vào.
// Tạo thêm các hàm để thực hiện các tác vụ tính toán lũy thừa, giai thừa và căn bậc bất kỳ của một số.
// function sum(p1: number | string, p2: number | string): string {
//   let a = Number(p1);
//   let b = Number(p2);
//   if (!isNaN(a) && !isNaN(b)) {
//     return `Tổng của phép tính là ${a + b}`;
//   } else {
//     return `Phép tính không hợp lệ`;
//   }
// }

// function product(p1: number | string, p2: number | string): string {
//   let a = Number(p1);
//   let b = Number(p2);
//   if (!isNaN(a) && !isNaN(b)) {
//     return `Tích của phép tính là ${a * b}`;
//   } else {
//     return `Phép tính không hợp lệ`;
//   }
// }

// function difference(p1: number | string, p2: number | string): string {
//   let a = Number(p1);
//   let b = Number(p2);
//   if (!isNaN(a) && !isNaN(b)) {
//     return `Hiệu của phép tính là ${a - b}`;
//   } else {
//     return `Phép tính không hợp lệ`;
//   }
// }

// function quotient(p1: number | string, p2: number | string): string {
//   let a = Number(p1);
//   let b = Number(p2);
//   if (!isNaN(a) && !isNaN(b) && b !== 0) {
//     return `Thương của phép tính là ${a / b}`;
//   } else {
//     return `Phép tính không hợp lệ`;
//   }
// }

function giaiThua(p1: number | string): string {
  let a = Number(p1);
  let ketQua = 1;
  if (!isNaN(a) && a > 0 && Number.isInteger(a)) {
    for (let i = a; i >= 1; i--) {
      ketQua *= i;
    }
    return `Kết quả giai thừa của ${a} là ${ketQua}`;
  } else {
    return `Phép tính không hợp lệ`;
  }
}

function luyThua(p1: number | string, p2: number | string): string {
  let a = Number(p1);
  let b = Number(p2);
  if (!isNaN(a) && !isNaN(b)) {
    return `Kết quả lũy thừa ${a}^${b} là ${a ** b}`;
  } else {
    return `Phép tính không hợp lệ`;
  }
}

function can(p1: number | string, p2: number | string): string {
  let a = Number(p1);
  let b = Number(p2);
  if (!isNaN(a) && !isNaN(b) && a > 0) {
    const result = Math.pow(b, 1 / a);
    return `Căn bậc ${a} của ${b} là ${result}`;
  } else {
    return `Phép tính không hợp lệ`;
  }
}

// Hàm xử lý sự kiện
function calculate(operation: string): void {
  const input1 = (document.getElementById("input1") as HTMLInputElement).value;
  const input2 = (document.getElementById("input2") as HTMLInputElement).value;

  let result: string;

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
      result = giaiThua(input1); // Giai thừa chỉ cần một tham số
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

  // Hiển thị kết quả lên giao diện
  const resultElement = document.getElementById("result") as HTMLSpanElement;
  resultElement.textContent = result;
}

//bai7
function bangCuuChuong(): void {
  for (let i: number = 1; i < 10; i++) {
    for (let j: number = 1; j <= 10; j++) {
      let result: string = `${i} x ${j} = ${i * j}`;
      console.log(result);
    }
    console.log("--------------------");
  }
}

bangCuuChuong();
