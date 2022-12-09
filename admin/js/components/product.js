import { $, $$ } from "../configs/constants.js";
import { baseURL } from "../configs/configs.js";
let id = Object.fromEntries(
    new URLSearchParams(window.location.search).entries()
).id;
let product;
let capacities;
async function getProduct() {
    try {
        await new Promise((resolve, reject) => {
            fetch(`${baseURL}admin/controller/product.php?id=${id}`, {
                method: "GET",
                credentials: "include",
            }).then((res) => {
                if (res.status === 200 || res.status === 201) {
                    res.text().then((res) => {
                        product = JSON.parse(res);
                        resolve();
                    });
                } else {
                    reject();
                }
            });
        });
    } catch (err) {}
}
async function getCapacities() {
    try {
        await new Promise((resolve, reject) => {
            fetch(
                `${baseURL}admin/controller/capacities.php?product_id=${id}`,
                {
                    method: "GET",
                    credentials: "include",
                }
            ).then((res) => {
                if (res.status === 200 || res.status === 201) {
                    res.text().then((res) => {
                        capacities = JSON.parse(res);
                        resolve();
                    });
                } else {
                    reject();
                }
            });
        });
    } catch (err) {}
}
async function main() {
    try {
        await getProduct();
        await getCapacities();
        renderProductContainer();
    } catch (err) {}
}
function renderCapacities() {
    let dataRes = "";
    capacities.forEach((capacity) => {
        let capacitiesHref = `index.php?view=change-capacity-product&id=${capacity['id']}`;
        dataRes+=`
            <tr>
                <td>${capacity["capacity_name"]}</td>
                <td>${capacity["quantity"]}</td>
                <td>${capacity["price"]}</td>
                <td>
                    <a class="btn" href="${capacitiesHref}" data-id="${capacity['id']}">Sửa</a>
                </td>
            </tr>
        '`;
    });
    return dataRes;
}
function renderProductContainer(){
    let productContainer = document.getElementById("product-container")
    let productContent = `
    <h2 style="text-align:right">Thông tin sản phẩm</h2>
    <div class="product__detail">
        <ul class="product__detail__infor">
            <li><span>Tên</span><span>${product["model"]}</span> </li>
            <li><span>Loại sản phẩm</span><span>${product["nameBrand"]}</span> </li>
            <li><span>Xuất xứ</span><span>${product["screen"]}</span> </li>
            <li><span>Trọng lượng</span><span>${product["RAM"]}</span> </li>
            <li><span>Kích thước</span><span>${product["hardware"]}</span> </li>
            <li><span>Mô tả</span><span>${product["OS"]}</span> </li>
            <li><span>Thương hiệu</span><span>${product["CPU"]}</span> </li>
            <li><span>Bảo quản</span><span>${product["VGA"]}</span> </li>
            <li><span>Ảnh</span><span><img src="'.$background.'" alt=""></span> </li>
            <li><span>Tiêu chuẩn</span><span>${product["warranty"]}</span> </li>
            <li><span>Giảm giá</span><span>${product["discount"]}%</span> </li>
            <li><span>Màu</span><span>${product["color"]}</span> </li>
            <li><span>Tạo bởi</span><span>${product["nameUser"]}</span> </li>
        </ul>
        <div class="product__detail__capacity">
            <table border="1">
                <tr>
                    <th>Thể loại</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                    <th>Thao tác</th>
                </tr>
                ${renderCapacities()}
            </table>
        </div>
        <a class="btn" href="index.php?view=add-capacity-product&id-product=${id}">Thêm</a>
        <a class="btn" href="index.php?view=change-product&id=${id}">Sửa</a>
    </div> `
    productContainer.innerHTML=productContent
}
main();
