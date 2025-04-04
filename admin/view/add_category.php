<?php include_once "header.php" ?>

<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
    <!-- Sidebar -->
    <?php include_once "nav.php" ?>
    <!-- Begin Page Content -->
    <div class="container-fluid">
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Thêm Loại</h6>
        </div>
        <div class="card-body">
          <div class="form-addcate">
            <form action="./index.php?act=add_category" method="post">
              <div class="form-group mt-3">
                <label for="formGroupExampleInput" class="font-lb">Mã loại</label>
                <input type="text" class="form-control" placeholder="Mã loại (auto increase)" disabled>
              </div>
              <div class="form-group mt-3">
                <label for="formGroupExampleInput" class="font-lb">Tên loại</label>
                <input type="text" name="name_cate" class="form-control" placeholder="Tên loại gấu bông" required>
              </div>
              <div class="wrap-btn">
                <input type="submit" name="btn_add" class="btn btn-success mt-3" value="Thêm">
                <a href="index.php?act=list_category" class="btn btn-danger mt-3">Quay Lại danh sách</a>
              </div>
            </form>
            <h3 class="text-success fs-6 mt-3 fw-bolder">
              <?php
              if (isset($notice) && $notice != "") {
                echo $notice;
              }
              ?>
            </h3>
          </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      <?php include_once "footer.php" ?>