<nav class="navbar navbar-expand-lg navbar-dark bg-gradient-orange">
            <div class="container">
                <button class="navbar-toggler btn btn-sm" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <a class="navbar-brand fw-bold" href="./">
                <img src="<?php echo validate_image($_settings->info('logo')) ?>" width="50" height="50" class="brand-image img-circle elevation-3" alt="" loading="lazy">
                <?php echo $_settings->info('short_name') ?>
                </a>

                <form class="form-inline" id="search-form">
                  <div class="input-group">
                    <input class="form-control form-control-sm form " type="search" placeholder="Search" aria-label="Search" name="search"  value="<?php echo isset($_GET['search']) ? $_GET['search'] : "" ?>"  aria-describedby="button-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-outline-light btn-sm m-0" type="submit" id="button-addon2"><i class="fa fa-search"></i></button>
                    </div>
                  </div>
                </form>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link text-white" aria-current="page" href="./">Home</a></li>
                        <?php 
                        $cat_qry = $conn->query("SELECT * FROM categories where status = 1  limit 3");
                        $count_cats =$conn->query("SELECT * FROM categories where status = 1 ")->num_rows;
                        while($crow = $cat_qry->fetch_assoc()):
                        ?>
                        <li class="nav-item"><a class="nav-link text-white" aria-current="page" href="./?p=products&c=<?php echo md5($crow['id']) ?>"><?php echo $crow['category'] ?></a></li>
                        <?php endwhile; ?>
                        <?php if($count_cats > 3): ?>
                        <li class="nav-item"><a class="nav-link text-white" href="./?p=view_categories">All Categories</a></li>
                        <?php endif; ?>
                        <li class="nav-item"><a class="nav-link text-white" href="./?p=about">About</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="./?p=services">Services</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="./?p=contact">Contact Us</a></li>
                    </ul>
                    <div class="d-flex align-items-center">
                      <?php if($_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 2): ?>
                        <a class="text-dark mr-2 nav-link text-white" href="./?p=cart">
                            <i class="bi-cart-fill me-1"></i>
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>


                            <span class="badge bg-danger text-white ms-1 rounded-pill" id="cart-count">
                              <?php 
                                $count = $conn->query("SELECT SUM(quantity) as items from `cart` where client_id =".$_settings->userdata('id'))->fetch_assoc()['items'];
                                echo ($count > 0 ? $count : 0);
                              ?>
                            </span>

                        </a>
                        
                          
                        

            

                  <div class="btn-group nav-link">
                  <button type="button" class="btn btn-rounded badge badge-light dropdown-toggle dropdown-icon" data-toggle="dropdown" aria-expanded="false">
                    <span class="fs-6"><b> Hi, <?php echo $_settings->userdata('firstname')?>!</b></span>
                    <span class="sr-only">Toggle Dropdown</span>
                  </button>
                  <div class="dropdown-menu" role="menu" style="left: 0px; right: inherit;">
                    <a class="dropdown-item text-orange" href="./?p=my_account"><span class="fa fa-user"></span>&nbsp; My Account</a>
                    <div class="dropdown-divider bg-gradient-orange"></div>
                    <a class="dropdown-item text-orange" href="logout.php"><span class="fa fa-power-off text-danger"></span>&nbsp; Logout</a>
                  </div>
                  </div>

                  <?php else: ?>
                        <button class="btn btn-outline-light ml-2 text-white" id="login-btn" type="button" style="background-color: #f57224;">
                        Login</button>
                        <?php endif; ?>

                    </div>
                </div>
            </div>
        </nav>
<script>
  $(function(){
    $('#login-btn').click(function(){
      uni_modal("","login.php")
    })
    $('#navbarResponsive').on('show.bs.collapse', function () {
        $('#mainNav').addClass('navbar-shrink')
    })
    $('#navbarResponsive').on('hidden.bs.collapse', function () {
        if($('body').offset.top == 0)
          $('#mainNav').removeClass('navbar-shrink')
    })
  })

  $('#search-form').submit(function(e){
    e.preventDefault()
     var sTxt = $('[name="search"]').val()
     if(sTxt != '')
      location.href = './?p=products&search='+sTxt;
  })
</script>