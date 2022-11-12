<style>
    table td,table th{
        padding: 3px !important;
    }
</style>
<?php 
$date_start = isset($_GET['date_start']) ? $_GET['date_start'] :  date("Y-m-d",strtotime(date("Y-m-d")." -7 days")) ;
$date_end = isset($_GET['date_end']) ? $_GET['date_end'] :  date("Y-m-d") ;
?>
<div class="card card-primary card-outline">
    <div class="card-header">
        <h5 class="card-title">Sales Report</h5>
    </div>
    <div class="card-body">
        <form id="filter-form">
            <div class="row align-items-end">
                <div class="form-group col-md-3">
                    <label for="date_start">Date Start</label>
                    <input type="date" class="form-control form-control-sm" name="date_start" value="<?php echo date("Y-m-d",strtotime($date_start)) ?>">
                </div>
                <div class="form-group col-md-3">
                    <label for="date_start">Date End</label>
                    <input type="date" class="form-control form-control-sm" name="date_end" value="<?php echo date("Y-m-d",strtotime($date_end)) ?>">
                </div>
                <div class="form-group col-md-2">
                    <button class="btn btn-flat btn-block btn-primary btn-sm"><i class="fa fa-filter"></i> Filter</button>
                </div>
                <div class="form-group col-md-2">
                    <button class="btn btn-flat btn-block btn-success btn-sm" type="button" id="printBTN"><i class="fa fa-print"></i> Print</button>
                </div>
            </div>
        </form>
        <hr>
        <div id="printable">
            <div class="row row-cols-2 justify-content-center align-items-center" id="print_header" style="display:none">
                <div class="col-1">
                    <img src="<?php echo validate_image($_settings->info('logo')) ?>" alt="<?php echo $_settings->info('short_name') ?>" width="75px" heigth="75px">
                </div>
                <div class="col-7">
                    <h4 class="text-center m-0"><?php echo $_settings->info('name') ?></h4>
                    <h3 class="text-center m-0"><b>Sales Report</b></h3>
                    <?php if($date_start != $date_end): ?>
                    <p class="text-center m-0">Date Between <?php echo date("M d,Y", strtotime($date_start)) ?> and <?php echo date("M d,Y", strtotime($date_end)) ?></p>
                    <?php else: ?>
                    <p class="text-center m-0">As of <?php echo date("M d,Y", strtotime($date_start)) ?></p>
                    <?php endif; ?>
                </div>
            </div>
            <hr>


            <table class="table table-bordered">
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="25%">
                    <col width="15%">
                    <col width="15%">
                    <col width="15%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr class="text-center">
                        <th>#</th>
                        <th>Date Order</th>
                        <th>Client</th>
                        <th>Paid</th>
                        <th>Status</th>
                        <th>Total Amount</th>
                        <th class="text-center">Action</th>
                        
                    </tr>
                </thead>
           <tbody>
                    <?php 
                    $i = 1;
                    $alltotal = 0;
                        $qry = $conn->query("SELECT o.*,concat(c.firstname,' ',c.lastname) as client from `orders` o inner join clients c on c.id = o.client_id where paid=1 order by unix_timestamp(o.date_created) desc ");
                        while($row = $qry->fetch_assoc()):
                        
                    ?>
                        <tr>
                            <td class="text-center"><?php echo $i++; ?></td>
                            <td><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
                            <td><?php echo $row['client'] ?></td>
                            
                            <td class="text-center">
                                <?php if($row['paid'] == 0): ?>
                                    <span class="badge badge-light border px-2 rounded-pill">No</span>
                                <?php else: ?>
                                    <span class="badge badge-success px-2 rounded-pill">Yes</span>
                                <?php endif; ?>
                            </td>
                            <td class="text-center">
                                <?php if($row['status'] == 0): ?>
                                    <span class="badge badge-light border px-3 rounded-pill">Pending</span>
                                <?php elseif($row['status'] == 1): ?>
                                    <span class="badge badge-primary px-3 rounded-pill">Packed</span>
                                <?php elseif($row['status'] == 2): ?>
                                    <span class="badge badge-warning px-3 rounded-pill">Out for Delivery</span>
                                <?php elseif($row['status'] == 3): ?>
                                    <span class="badge badge-success px-3 rounded-pill">Delivered</span>
                                <?php else: ?>
                                    <span class="badge badge-danger px-3 rounded-pill">Cancelled</span>
                                <?php endif; ?>
                            </td>
                            
                            <td class="text-right">₱ &nbsp;<?php echo number_format($row['amount'] + 65) ?></td>
                            <td align="center">
                                 <a class="" href="?page=orders/view_order2&id=<?php echo $row['id'] ?>">View</a>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="5" class="font-weight-bold text-right">TOTAL SALES</th>
                        <th class="text-right font-weight-bold">₱ &nbsp;<?php
                        $allpaidsum = $conn->query("SELECT SUM(amount) as total1 FROM `orders` where paid=1 ")->fetch_assoc()['total1'] ;
                            $allorders = $conn->query("SELECT COUNT(*) as total2 FROM `orders` where paid=1 ")->fetch_assoc()['total2'];

                            $addorder=($allorders *  65);

                            $alltotal = $allpaidsum + $addorder;
                         echo number_format($alltotal); 


                     ?></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>


<!-- <div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">Sales Report</h3>

    </div>
    <div class="card-body">
        <div class="container-fluid">
        <div class="container-fluid">
            <table class="table table-bordered table-stripped">
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="25%">
                    <col width="15%">
                    <col width="15%">
                    <col width="15%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr class="text-center">
                        <th>#</th>
                        <th>Date Order</th>
                        <th>Client</th>
                        <th>Paid</th>
                        <th>Status</th>
                        <th>Total Amount</th>
                        <th class="text-center">Action</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    $i = 1;
                    $alltotal = 0;
                        $qry = $conn->query("SELECT o.*,concat(c.firstname,' ',c.lastname) as client from `orders` o inner join clients c on c.id = o.client_id where paid=1 order by unix_timestamp(o.date_created) desc ");
                        while($row = $qry->fetch_assoc()):
                        
                    ?>
                        <tr>
                            <td class="text-center"><?php echo $i++; ?></td>
                            <td><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
                            <td><?php echo $row['client'] ?></td>
                            
                            <td class="text-center">
                                <?php if($row['paid'] == 0): ?>
                                    <span class="badge badge-light border px-2 rounded-pill">No</span>
                                <?php else: ?>
                                    <span class="badge badge-success px-2 rounded-pill">Yes</span>
                                <?php endif; ?>
                            </td>
                            <td class="text-center">
                                <?php if($row['status'] == 0): ?>
                                    <span class="badge badge-light border px-3 rounded-pill">Pending</span>
                                <?php elseif($row['status'] == 1): ?>
                                    <span class="badge badge-primary px-3 rounded-pill">Packed</span>
                                <?php elseif($row['status'] == 2): ?>
                                    <span class="badge badge-warning px-3 rounded-pill">Out for Delivery</span>
                                <?php elseif($row['status'] == 3): ?>
                                    <span class="badge badge-success px-3 rounded-pill">Delivered</span>
                                <?php else: ?>
                                    <span class="badge badge-danger px-3 rounded-pill">Cancelled</span>
                                <?php endif; ?>
                            </td>
                            
                            <td class="text-right">₱ &nbsp;<?php echo number_format($row['amount'] + 65) ?></td>
                            <td align="center">
                                 <a class="" href="?page=orders/view_order2&id=<?php echo $row['id'] ?>">View</a>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="5" class="font-weight-bold text-right">TOTAL SALES</th>
                        <th class="text-right font-weight-bold">₱ &nbsp;<?=
                        $allpaidsum = $conn->query("SELECT SUM(amount) as total1 FROM `orders` where paid=1 ")->fetch_assoc()['total1'];
                            $allorders = $conn->query("SELECT COUNT(*) as total2 FROM `orders` where paid=1 ")->fetch_assoc()['total2'];

                            $addorder=($allorders *  65);

                            $alltotal += $allorders + $addorder;
                         format_num($alltotal) 


                     ?></th>
                    </tr>
                </tfoot>
            </table>
        </div>
        </div>
    </div>
</div>
 -->

<noscript>
    <style>
        .m-0{
            margin:0;
        }
        .text-center{
            text-align:center;
        }
        .text-right{
            text-align:right;
        }
        .table{
            border-collapse:collapse;
            width: 100%
        }
        .table tr,.table td,.table th{
            border:1px solid gray;
        }
    </style>
</noscript>
<script>
    $(function(){
        $('table th, table td').addClass("px-1 py-2 align-middle")
        $('#filter-form').submit(function(e){
            e.preventDefault()
            location.href = "./?page=sales&date_start="+$('[name="date_start"]').val()+"&date_end="+$('[name="date_end"]').val()
        })

        $('#printBTN').click(function(){
            var head = $('head').clone();
            var rep = $('#printable').clone();
            var ns = $('noscript').clone().html();
            start_loader()
            rep.prepend(ns)
            rep.prepend(head)
            rep.find('#print_header').show()
            var nw = window.document.open('','_blank','width=900,height=600')
                nw.document.write(rep.html())
                nw.document.close()
                setTimeout(function(){
                    nw.print()
                    setTimeout(function(){
                        nw.close()
                        end_loader()
                    },200)
                },300)
        })
    })
</script>