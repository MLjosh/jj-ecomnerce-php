<section class="py-5">
    <div class="container">
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