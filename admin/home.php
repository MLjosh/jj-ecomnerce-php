<h1>Welcome to <?php echo $_settings->info('name') ?></h1>
<hr>
<div class="row">
          <div class="col-12 col-sm-6 col-md-3">
             <a class="text-dark" href="?page=inventory">
             <div class="info-box">
              <span class="info-box-icon bg-maroon elevation-1"><i class="fas fa-table"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Stocks</span>
                <span class="info-box-number">
                  <?php 
                    $inv = $conn->query("SELECT sum(quantity) as total FROM inventory ")->fetch_assoc()['total'];
                    $sales = $conn->query("SELECT sum(quantity) as total FROM order_list where order_id in (SELECT order_id FROM sales) ")->fetch_assoc()['total'];
                    echo number_format($inv - $sales);
                  ?>
                  <?php ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div></a>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <a class="text-dark" href="?page=orders">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-purple elevation-1"><i class="fas fa-th-list"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Pending Orders</span>
                <span class="info-box-number">
                  <?php 
                    $pending = $conn->query("SELECT COUNT(*) as total FROM `orders` where status = '0' ")->fetch_assoc()['total'];
                    echo number_format($pending);
                  ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
          </a>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <a class="text-dark" href="?page=sales">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Sales Today</span>
                <span class="info-box-number">
                <?php
                        $allpaidsum = $conn->query("SELECT SUM(amount) as total1 FROM `orders` where paid=1 ")->fetch_assoc()['total1'] ;
                            $allorders = $conn->query("SELECT COUNT(*) as total2 FROM `orders` where paid=1 ")->fetch_assoc()['total2'];

                            $addorder=($allorders *  65);

                            $alltotal = $allpaidsum + $addorder;
                         echo number_format($alltotal); 


                     ?>

                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
          </a>
            <!-- /.info-box -->
          </div>
          <div class="col-12 col-sm-6 col-md-3">
            <a class="text-dark" href="?page=clients">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-pink elevation-1"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Registered Clients</span>
                <span class="info-box-number">
                <?php 
                    $sales = $conn->query("SELECT * FROM `clients` where delete_flag = 0 ")->num_rows;
                    echo number_format($sales);
                  ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
          </a>
            <!-- /.info-box -->
          </div>
        </div>
<div class="container">
  <?php 
    $files = array();
      $fopen = scandir(base_app.'uploads/banner');
      foreach($fopen as $fname){
        if(in_array($fname,array('.','..')))
          continue;
        $files[]= validate_image('uploads/banner/'.$fname);
      }
  ?>
  <div id="tourCarousel"  class="carousel slide" data-ride="carousel" data-interval="3000">
      <div class="carousel-inner h-100">
          <?php foreach($files as $k => $img): ?>
          <div class="carousel-item  h-100 <?php echo $k == 0? 'active': '' ?>">
              <img class="d-block w-100  h-100" style="object-fit:contain" src="<?php echo $img ?>" alt="">
          </div>
          <?php endforeach; ?>
      </div>
      <a class="carousel-control-prev" href="#tourCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#tourCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
      </a>
  </div>
</div>
