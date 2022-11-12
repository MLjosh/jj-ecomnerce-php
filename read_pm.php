<section class="py-5">
    <div class="container">
        <div class="card rounded-0">
            <div class="card-body">
                <div class="w-100 justify-content-between d-flex">
                    <h4><b>Unread Messages</b></h4>
                    <a href="./?p=new_pm" class="btn btn btn-default btn-flat bg-orange text-white"><div class="fas fa-plus"></div> New Message</a>
                </div>
                    <hr class="border-warning">
                    <table class="table table-stripped text-dark">
                        <colgroup>
                            <col width="10%">
                            <col width="25">
                            <col width="15">
                            <col width="25">
                            <col width="15">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>No. Replies</th>
                                <th>Participant</th>
                                <th>Date Sent</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                $i = 1;
                                $qry = $conn->query("SELECT o.*,concat(c.firstname,' ',c.lastname) as client from `orders` o inner join clients c on c.id = o.client_id where o.client_id = '".$_settings->userdata('id')."' order by unix_timestamp(o.date_created) desc ");
                                while($row = $qry->fetch_assoc()):
                            ?>
                                <tr>
                                    <td><?php echo $i++ ?></td>
                                    <td><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
                                    <td><a href="javascript:void(0)" class="view_order" data-id="<?php echo $row['id'] ?>"><?php echo $row['ref_code'] ?></a></td>
                                    <td><?php echo number_format($row['amount']) ?> </td>
                                    <td class="text-center">
                                            <?php if($row['status'] == 0): ?>
                                                <span class="badge badge-light text-dark border px-3 rounded-pill">Pending</span>
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
                                    </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
            </div>
        </div>
    </div>





        
        <div class="card rounded-0">
            <div class="card-body align-self-center">
                <div class="row">
                    <div class="col">

                        <h1>New Personal Message</h1>
    <form action="new_pm.php" method="post">
    <!--    Please fill this form to send a PM:<br /> -->
        <div class="col-md-12 col-md-offset-4">
        <label for="title">Title</label>
        <input type="text" class="form-control" placeholder="Title" value="" id="title" name="title"><br>
 
        <label for="recip">Recipient<span class="small">(Username)</span></label>
        <input type="text" class="form-control" placeholder="Recipient" value="" id="recip" name="recip"><br>
     
        <label for="message">Message</label>
        <textarea cols="40" rows="5" class="form-control" placeholder="Please Input your message his/her" id="message" name="message"></textarea><br>
        <input type="submit" class="btn btn-primary btn-block" value="Send">
                        
                    </div>
    
    </div></form>
</div>
            </div>
        </div>
    </div>
</section>