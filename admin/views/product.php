<?php
    include_once "../db/config.php";
    include_once "../utils/dbhelper.php";
    include_once "../utils/session.php";
    include_once "../utils/validate.php";
    if($_GET["view"]=="new-product"){
        echo '
            <div class="container__detail__product">
            <form id="form-add-product" enctype="multipart/form-data" method="POST">
                <label for="brand">Loại sản phẩm</label>
                <select required name="brand_id" id="brand">
                </select>
        
                <label for="model">Tên sản phẩm</label>
                <input type="text" required name="model" id="model" placeholder="Nhập tên sản phẩm">
                
                <label for="screen">Xuất xứ</label>
                <textarea rows="3" id="screen" required name="screen">
                </textarea>

                <label for="RAM">Trọng lượng</label>
                <input type="text" required name="RAM" id="RAM" placeholder="Nhập trọng lượng sản phẩm">

                <label for="hardware">Kích thước</label>
                <input type="text" required name="hardware" id="hardware" placeholder="Nhập kích thước">

                <label for="OS">Mô tả</label>
                <input type="text" required name="OS" id="OS" placeholder="Nhập mô tả">
        
                <label for="CPU">Thương hiệu</label>
                <input type="text" required name="CPU" id="CPU" placeholder="Nhập thương hiệu">
        
                <label for="VGA">Bảo quản</label>
                <textarea rows="3" id="VGA" required name="VGA" placeholder="Cách bảo quản">
                </textarea>
        
                <label for="background">Hình ảnh</label>
                <input type="file" required name="background" id="background">
        
                <label for="warranty">Tiêu chuẩn</label>
                <input type="text" required name="warranty" id="warranty" placeholder="Tiêu chuẩn sản phẩm">
        
                <label for="discount">Giảm giá</label>
                <input type="number" required name="discount" id="discount">
        
                <label for="color">Màu sắc</label>
                <input type="text" required name="color" id="color" placeholder="Nhập màu sắc">
                
                <label for="capacity_name">Phân loại hàng</label>
                <input type="text" required name="capacity_name" id="capacity_name" placeholder="Nhập phân loại hàng">
        
                <label for="price">Giá bán</label>
                <input type="number" required name="price" id="price">
        
                <label for="quantity">Số lượng bán</label>
                <input type="number" required name="quantity" id="quantity">
                <input type="hidden" name="crud_request" value="add-newproduct">
                <button type="submit" style="margin-top: 10px" class="btn">Lưu</button>
            </form>
        </div>
        <script type="module" src="js/components/addProduct.js"></script>';
    }elseif($_GET["view"]=="product"){
        echo '
        <div class="container" id="product-container">
        </div>
        <script type="module" src="js/components/product.js"></script>';
    }else if($_GET["view"]=="change-capacity-product" && !empty($_GET["id"])){
        echo '
        <div class="container">
            <form id="form-change-capacity" method="POST">
                <label for="capacity_name">Phân loại</label>
                <input type="text" required name="capacity_name" value="" id="capacity_name" placeholder="Nhập phân loại hàng">
        
                <label for="price">Giá bán</label>
                <input type="number" value="" required name="price" id="price">
        
                <label for="quantity">Số lượng bán</label>
                <input type="number" value="" required name="quantity" id="quantity">
                <input type="hidden" name="crud_request" value="change-capacity-product">
                <button type="submit" style="margin-top: 10px" class="btn">Lưu</button>
            </form>
        </div>
        <script type="module" src="js/components/changeCapacityProduct.js"></script>';
    }else if($_GET["view"]=="add-capacity-product" && !empty($_GET["id-product"])){
        echo '
        <div class="container">
            <form id="form-add-capacity" method="POST">
                <label for="capacity_name">Phân loại</label>
                <input type="text" required name="capacity_name"  id="capacity_name" placeholder="Nhập phân loại">
        
                <label for="price">Giá bán</label>
                <input type="number"  required name="price" id="price">
        
                <label for="quantity">Số lượng bán</label>
                <input type="number"  required name="quantity" id="quantity">
                <input type="hidden" name="crud_request" value="add-capacity-product">
                <button type="submit" style="margin-top: 10px" class="btn">Lưu</button>
            </form>
        </div>
        <script type="module" src="js/components/addCapacityProduct.js"></script>';
    }else if($_GET["view"]=="change-product" && !empty($_GET["id"])){
        echo '
            <div class="container__detail__product">
            <form id="form-change-product" enctype="multipart/form-data" method="POST">
            </form>
        </div>
        <script type="module" src="js/components/changeProduct.js"></script>';
    }

