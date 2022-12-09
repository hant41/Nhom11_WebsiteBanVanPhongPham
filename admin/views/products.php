<!-- danh sach san pham -->
    <div class="container">
        <a href="index.php?view=new-product" class="btn">Thêm mới</a>
        <!-- <a href="index.php?view=product&id=1" class="btn">Xem</a>  -->
        <!-- <a href="index.php?view=change-product&id=1" class="btn">Sửa</a>  -->
        <table border="1">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên</th>
                    <th>Ảnh</th>
                    <th>Xuất xứ</th>
                    <th>Trọng lượng</th>
                    <th>Kích thước</th>
                    <th>Mô tả</th>
                    <th>Thương hiệu</th>
                    <th>Bảo quản</th>
                    <th>Tiêu chuẩn</th>
                    <th>Giảm giá</th>
                    <th>Màu sắc</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody id="product__list">
            </tbody>
            
        </table>
        <script type="module" src="js/components/products.js"></script>
    </div>