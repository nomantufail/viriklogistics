<script>

    function set_dr_cr_entry_link(link_id, type, product_type)
    {
        if(product_type == undefined)
        {
            product_type = 'black_oil';
        }
        var query_string = '';
        if(type == 'customer_freight')
        {
            <?php if(isset($_GET['customer']) && $_GET['customer'] != ''): ?>
            query_string = "?customer="+'<?= $_GET['customer'][0] ?>';
            <?php endif; ?>
        }
        var trips_details_ids = get_selected_ids();

        //preparing the url
        var url = "<?= base_url()."manageaccounts/open_voucher_for_user/" ?>"+trips_details_ids+"/"+type+"/"+product_type+query_string;
        //setting the url
        var link = document.getElementById(link_id);
        link.setAttribute('href', url);
    }

    function get_selected_ids()
    {
        var check_boxes = document.getElementsByClassName("filter_check_box");
        var trip_ids = '0';
        for(var count = 0; count < check_boxes.length; count++){
            if(check_boxes[count].checked == true){
                trip_ids = trip_ids+"_"+check_boxes[count].value;
            }
        }

        return trip_ids;
    }

    function show_monthly_results(month, path){

        var path = path+month;

        window.location.href = path;

    }

    function mass_payment(){
        var check_boxes = document.getElementsByClassName("filter_check_box");
        var trip_ids = '0';
        for(var count = 0; count < check_boxes.length; count++){
            if(check_boxes[count].checked == true){
                trip_ids = trip_ids+"_"+check_boxes[count].value;
            }
        }

        //preparing the url
        var url = "<?= base_url()."carriageContractors/contractor_mass_payment/" ?>"+trip_ids;
        //setting the url
        var mass_payment_link = document.getElementById("mass_payment_link");
        mass_payment_link.setAttribute('href', url);
    }

    function mass_credit(voucher_type){
        var check_boxes = document.getElementsByClassName("filter_check_box");
        var trip_ids = '0';
        for(var count = 0; count < check_boxes.length; count++){
            if(check_boxes[count].checked == true){
                trip_ids = trip_ids+"_"+check_boxes[count].value;
            }
        }

        //preparing the url
        var url = "<?= base_url()."carriageContractors/contractor_mass_credit/" ?>"+trip_ids+"/"+voucher_type;
        //setting the url
        var mass_credit_link = "";
        if(voucher_type == 1){
            mass_credit_link = document.getElementById("commission_mass_credit_link");
        }else{
            mass_credit_link = document.getElementById("service_charges_mass_credit_link");
        }

        mass_credit_link.setAttribute('href', url);
    }

    function set_details_ids_for_billing()
    {
        var check_boxes = document.getElementsByClassName("filter_check_box");
        var trip_details_ids = '0';
        for(var count = 0; count < check_boxes.length; count++){
            if(check_boxes[count].checked == true){
                trip_details_ids = trip_details_ids+"_"+check_boxes[count].value;
            }
        }
        document.getElementById("details_ids_for_billing").value = trip_details_ids;
        if(document.getElementById("details_ids_for_billing").value != '')
        {
            return true;
        }
        return false;
    }

    function set_details_ids_for_un_billing()
    {
        var check_boxes = document.getElementsByClassName("filter_check_box");
        var trip_details_ids = '0';
        for(var count = 0; count < check_boxes.length; count++){
            if(check_boxes[count].checked == true){
                trip_details_ids = trip_details_ids+"_"+check_boxes[count].value;
            }
        }
        var choice = confirm("ALERT!!\nDear User are you sure you want to Un-Bill selected trips?");
        if(choice == true)
        {
            document.getElementById("un_bill_trips_ids").value = trip_details_ids;
            if(document.getElementById("un_bill_trips_ids").value != '')
            {
                return true;
            }
        }
        return false;
    }

    /*function set_contractor_credit_chit_info(trip_id, trip_detail_id, total_credit_amount, voucher_type)
     {
     document.getElementById('contractor_credit_voucher_trip_detail_id').value = trip_detail_id;
     document.getElementById('contractor_credit_voucher_trip_id').value = trip_id;
     document.getElementById('contractor_credit_voucher_trip_id_label').innerHTML = trip_id;
     document.getElementById('contractor_credit_voucher_type').value = voucher_type;
     document.getElementById('contractor_total_creditable_amount').value = total_credit_amount;

     var test_link = document.getElementById("get_contractor_credit_voucher");
     test_link.setAttribute('href', '#');
     test_link.className="btn btn-success";

     }*/
</script>

<style>
    .dr_cr_btn{
        font-size: 12px;
    }
    .white-popup {
        position: relative;
        background: #FFF;
        padding: 20px;
        width: auto;
        max-width: 500px;
        margin: 20px auto;
    }
    .benefits-details-popup {
        position: relative;
        background: #FFF;
        padding: 20px;
        width: auto;
        max-width: 500px;
        margin: 20px auto;
    }

    .custom-accounts-popup{
        position: relative;
        background-color: #FFF;
        padding: 20px;
        width: auto;
        max-width: 600px;
        margin: 20px auto;
    }
    .bill-trips-popup{
        position: relative;
        background-color: #FFF;
        padding: 20px;
        width: auto;
        max-width: 400px;
        margin: 20px auto;
    }

    .contractor_credit_chit_popup{
        position: relative;
        background-color: #FFF;
        padding: 20px;
        width: auto;
        max-width: 600px;
        margin: 20px auto;
    }
    .voucher{
        position: relative;
        background-color: #FFF;
        padding: 20px;
        width: auto;
        margin: 20px auto;
    }
    .accounts-table{

        font-size: 11px;

    }
    .multiple_entites{
        border-bottom: 1px dashed lightgray;
    }
    .page-header{
        border-bottom: none;
    }
    .paid{
        background-color: rgba(0,255,0,0.2);
    }
    .unpaid{
        background-color: rgba(255,0,0,0.0);
    }
    .sortable-table-heading{
        display: block;
        width: 100%;
        color: #0088cc;
    }
    .sortable-table-heading:hover{
        color: #0088cc;
        text-decoration: underline;
    }
    .dr_cr_status{
        text-decoration: underline;
        color:white;
        text-align: center;
        font-weight: bold;
        background-color: green;
    }
</style>

<div id="page-wrapper">
<div class="container-fluid">
<!--upper navigation-->
<div class="row">
    <div class="col-lg-12">
        <section class="col-md-5">
            <h3 class="page-header">
                Manage Accounts <?= ($this->uri->segment(2) == 'white_oil')?'White Oil':'Black Oil' ?>
            </h3>
        </section>
    </div>
</div>

<!--body of accounts-->
<div class="row">

<?php
include_once(APPPATH."views/manageaccounts/components/custom_search.php");
?>

<!--this area is hedden from the view and is used for billing-->
<div id="bill-trips-popup" class="bill-trips-popup mfp-hide">
    <style></style>
    <script>
    </script>
    <div><h3 style="text-align: center;">Billing Trips</h3></div><hr>
    <form action="" method="post">
        <div class="row">
            <div class="col-lg-2" style="height: 10px;"></div><div class="col-lg-8"><b>Bill Date: </b><input type="date" name="bill_date" required="required" value="<?= date('Y-m-d') ?>" id="bill_date_time"></div>
        </div>

        <input type="hidden" name="details_ids" id="details_ids_for_billing">
        <input type="hidden" name="bill_trips">
        <hr>
        <input type="submit" name="bill_trips" value="Bill Trips" class="center-block btn btn-success">
    </form>
</div>
<!--***********************************************************************-->

<!--------------------Searched Queries----------------------------->
<?php
if(sizeof($_GET) > 0)
{
    include_once(APPPATH."views/manageaccounts/components/searched_queries.php");
}
?>
<!----------------------------------------------------------------->

<div class="col-lg-12">
<?php echo validation_errors('<div class="alert alert-danger alert-dismissible" role="alert">

                                            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>

                                            <strong>Error! </strong>', '</div>');
?>

<?php if(is_array($someMessage)){ ?>

    <div class="alert <?= $someMessage['type']; ?> alert-dismissible" role="alert">

        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>

        <?= $someMessage['message']; ?>

    </div>

<?php } ?>

<div class="panel-body">

<div id="myTabContent" class="tab-content" style="min-height: 500px;">

<div class="tab-pane fade in active" id="customers">

<div class="table-responsive">
<table style="width: 100%;">
    <tr>
        <td style="width: 50%;">
            <div class="col-md-3">
                <a href="<?= base_url()."manageaccounts/open_custom_voucher_for_user" ?>" class="open_custom_voucher_for_user btn btn-danger"><i class="fa fa-plus-circle"></i> Voucher</a>
            </div>
            <div class="col-md-3">
                <a href="#bill-trips-popup" onclick="set_details_ids_for_billing()" class="open-bill-trips-popup btn btn-primary">Bill Trips</a>
            </div>
            <div class="col-md-2">
                <form method="post" onsubmit="return set_details_ids_for_un_billing()">
                    <input type="hidden" name="un_bill_trips">
                    <input type="hidden" id="un_bill_trips_ids" name="un_bill_trips_ids" required="required">
                    <input type="submit" class="btn btn-warning" value="Un-Bill Trips" name="un_bill">
                </form>
            </div>
        </td>
        <td style="text-align: right"><a href="#custom-accounts-popup" class="open-custom-accounts-popup btn btn-success" style="border-radius: 0px;">Create Custom Accounts</a> </td>
    </tr>
</table>
<form name="selection_form" id="selection_form" method="post" action="<?php
if(strpos($this->helper_model->page_url(),'?') == false){
    echo $this->helper_model->page_url()."?";
}else{echo $this->helper_model->page_url()."&";}
?>print">
<table class="table table-bordered table-hover table-striped accounts-table sortable" style="min-width:1900px;">

<thead style="border-top: 4px solid lightgray;">

<tr>
    <th></th>
    <th><div><input id="" type="checkbox" name="column[]" value="id" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="trip_type" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="trip_date" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="source" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="destination" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="invoice_date" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="invoice_number" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="tanker" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="product" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="dis_qty" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="rec_qty" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="shortage_qty" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="frt_shrt_qty_cmp" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="frt_shrt_qty_cst" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="frt_unit_cmp" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="total_frt_cmp" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="frt_amount_cmp" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="company" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="shortage_rate" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="shortage_amount" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="payable_before_tax" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="wht" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="net_payable" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="contractor_net_freight" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="company_commission" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="contractor_commission" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="contractor" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="fr_unit_cst" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="total_fr_cst" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="fr_amount_cst" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="customer_fr" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="customer" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="service_charges" style="" checked></div></th>
    <th><div><input id="" type="checkbox" name="column[]" value="billed" style="" checked></div></th>

</tr>
<tr>
    <th colspan="22"></th>
    <th><a href="#" onclick="set_dr_cr_entry_link('company_wht_entry_link','company_wht', 'black_oil')" id="company_wht_entry_link" class="btn btn-danger dr_cr_btn open_voucher_for_user">Dr / Cr</a></th></th>
    <th><a href="#" onclick="set_dr_cr_entry_link('contractor_freight_entry_link','contractor_freight', 'black_oil')" id="contractor_freight_entry_link" class="btn btn-danger dr_cr_btn open_voucher_for_user">Dr / Cr</a></th>
    <th></th>
    <th><a href="#" onclick="set_dr_cr_entry_link('company_commission_entry_link','company_commission', 'black_oil')" id="company_commission_entry_link" class="btn btn-danger dr_cr_btn open_voucher_for_user">Dr / Cr</a></th>
    <th><a href="#" onclick="set_dr_cr_entry_link('contractor_commission_entry_link','contractor_commission', 'black_oil')" id="contractor_commission_entry_link" class="btn btn-danger dr_cr_btn open_voucher_for_user">Dr / Cr</a></th>
    <th colspan="4"></th>
    <th><a href="#" onclick="set_dr_cr_entry_link('customer_freight_entry_link','customer_freight', 'black_oil')" id="customer_freight_entry_link" class="btn btn-danger dr_cr_btn open_voucher_for_user">Dr / Cr</a></th>
    <th colspan="3"></th>
</tr>
<tr>
    <th><input id="parent_checkbox" onchange="check_boxes();" type="checkbox" style="" checked></th>
    <th><a href="<?php echo $this->helper_model->sorting_info('trip_id'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('trip_id', 'numeric'); ?>"> </i> ID</a></th>
    <th><a href="<?php echo $this->helper_model->sorting_info('trip_type'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('trip_type', 'string'); ?>"> </i> Trip Type</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('entry_date'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('entry_date', 'date'); ?>"> </i> Trip Date</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('source'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('source', 'string'); ?>"> </i> Source</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('destination'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('destination', 'string'); ?>"> </i> Destination</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('invoice_date'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('invoice_date', 'date'); ?>"> </i> Invoice Date</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('invoice_number'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('invoice_number', 'numeric'); ?>"> </i> Invoice#</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('tanker'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('tanker', 'string'); ?>"> </i> Tanker</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('product'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('product', 'string'); ?>"> </i> Product</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('dis_qty'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('dis_qty', 'numeric'); ?>"> </i> Dis Qty</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('rec_qty'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('rec_qty', 'numeric'); ?>"> </i> Rec Qty</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('shortage_qty'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('shortage_qty', 'numeric'); ?>"> </i> Shortage Qty</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('fr_on_shrt_qty_cmp'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('fr_on_shrt_qty_cmp', 'numeric'); ?>"> </i> Frt On Shrt Qty (cmp)</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('fr_on_shrt_qty_cst'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('fr_on_shrt_qty_cst', 'numeric'); ?>"> </i> Frt On Shrt Qty (cst)</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('fr_unit_cmp'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('fr_unit_cmp', 'numeric'); ?>"> </i> Frt Unit (cmp)</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('total_freight'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('total_freight', 'numeric'); ?>"> </i> Total Freight (cmp)</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('freight_amount'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('freight_amount', 'numeric'); ?>"> </i> Freight Amount (cmp)</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('company'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('company', 'string'); ?>"> </i> Company</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('shortage_rate'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('shortage_rate', 'numeric'); ?>"> </i> Shortage Rate</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('shortage_amount'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('shortage_amount', 'numeric'); ?>"> </i> Shortage Amount</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('payable_before_tax'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('payable_before_tax', 'numeric'); ?>"> </i> Payable Before Tax</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('wht'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('wht', 'numeric'); ?>"> </i> WHT</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('net_payable'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('net_payable', 'numeric'); ?>"> </i> Net Payable</a></th> <!--trip entry date-->
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('contractor_net_fr'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('contractor_net_fr', 'numeric'); ?>"> </i> Contractor Net Fr.</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('company_commission'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('company_commission', 'numeric'); ?>"> </i> Company Commission</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('contractor_commission'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('contractor_commission', 'numeric'); ?>"> </i> Contractor Commission</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('contractor'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('contractor', 'string'); ?>"> </i> Contractor</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('fr_unit_cst'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('fr_unit_cst', 'numeric'); ?>"> </i> Fr Unit (cst)</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('total_fr_cst'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('total_fr_cst', 'numeric'); ?>"> </i> Total Fr (cst)</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('fr_amount_cst'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('fr_amount_cst', 'numeric'); ?>"> </i> Fr Amount (cst)</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('customer_fr'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('customer_fr', 'numeric'); ?>"> </i> Customer Fr.</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('customer'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('customer', 'string'); ?>"> </i> Customer</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('service_charges'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('service_charges', 'numeric'); ?>"> </i> Service Charges</a></th>
    <th style="width: 5%"><a href="<?php echo $this->helper_model->sorting_info('billed'); ?>" class="sortable-table-heading"><i class="<?= $this->helper_model->sorting_icon('billed', 'string'); ?>"> </i> Billed</a></th>


</tr>
</thead>
<tbody>
<!-- Totals Variables Declaration -->
<?php
    $total_shortage_qty = 0;
    $total_dis_qty = 0;
    $total_rec_qty = 0;
    $total_freight_on_shrt_qty_cmp = 0;
    $total_freight_on_shrt_qty_cst = 0;
    $grand_total_frieght_cmp = 0;
    $grand_total_frieght_cst = 0;
    $total_freight_amount_cmp = 0;
    $total_shortage_amount = 0;
    $total_payable_before_tax = 0;
    $total_wht = 0;
    $total_net_payable = 0;
    $total_contractor_net_freight = 0;
    $total_company_commission = 0;
    $total_contractor_commission = 0;
    $total_freight_amount_cst = 0;
    $total_customer_freight = 0;
    $total_service_charges = 0;
?>
<!---------------------------------------->

<?php $parent_count = 0; ?>
<?php  foreach($accounts as $trip): ?>
    <?php
    $count = 0;
    $num_trip_product_details = sizeof($trip->trip_related_details);
    ?>
    <?php foreach($trip->trip_related_details as $detail): ?>
        <?php
        $count++;
        $parent_count++;

        /*-------------------------------------------------------------------------------*/
        /*                              Calculating Things                               */
        /*-------------------------------------------------------------------------------*/

        /*----- Calculating Shortage quantity ---------*/
        $shortage_quantity = $detail->get_shortage_quantity_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating Dis quantity ---------*/
        $dis_quantity = $detail->get_dis_quantity_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating Rec quantity ---------*/
        $rec_quantity = $detail->get_rec_quantity_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating Freight Per Unit (cmp) ---------*/
        $company_freight_unit = $detail->get_company_freight_unit_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating Freight Per Unit (cst) ---------*/
        $customer_freight_unit = $detail->get_customer_freight_unit_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating Freight On Shortage Quantity (cmp) ---------*/
        $freight_on_shortage_quantity_cmp = $detail->get_freight_on_shortage_quantity_cmp_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating Freight On Shortage Quantity (cst) ---------*/
        $freight_on_shortage_quantity_cst = $detail->get_freight_on_shortage_quantity_cst_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating total freight (cmp) ---------*/
        $total_freight_cmp = $detail->get_total_freight_cmp_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating total freight (cst) ---------*/
        $total_freight_cst = $detail->get_total_freight_cst_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating freight amount (cmp) ---------*/
        $freight_amount_cmp = $detail->get_freight_amount_cmp_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating freight amount (cst) ---------*/
        $freight_amount_cst = $detail->get_freight_amount_cst_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating shortage rate ---------*/
        $shortage_rate = $detail->get_shortage_rate_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating shortage amount ---------*/
        $shortage_amount = $detail->get_shortage_amount_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating payable before tax ---------*/
        $payable_before_tax = $detail->get_payable_before_tax_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating wht ---------*/
        $wht = $trip->company->wht;
        $wht_amount = $detail->get_wht_amount_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating net payable ---------*/
        $net_payable = $detail->get_net_payable_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating contractor commission ---------*/
        $contractor_commission = $detail->get_contractor_commission_percentage();
        $contractor_commission_amount = $detail->get_contractor_commission_amount_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating Contractor net freight ---------*/
        $contractor_net_freight = $detail->get_contractor_net_freight_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating company commission --------*/
        $company_commission = $trip->company->commission_1;
        $company_commission_amount = $detail->get_company_commission_amount_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating Customer Freight amount --------*/
        $customer_freight_amount = $detail->get_customer_freight_amount_for_black_oil();
        /*---------------------------------------------*/

        /*----- Calculating service charges --------*/
        $service_charges = $detail->get_service_charges_for_black_oil();
        /*---------------------------------------------*/

        /*-------------------------------------------------------------------------------------------------*/
        /*                                    Calculating Things End                                       */
        /*-------------------------------------------------------------------------------------------------*/

        /**--------------------------------
         * Totaling Things
         * ------------------------------
         * */
        $total_shortage_qty += $shortage_quantity;
        $total_dis_qty += $dis_quantity;
        $total_rec_qty += $rec_quantity;
        $total_freight_on_shrt_qty_cmp += $freight_on_shortage_quantity_cmp;
        $total_freight_on_shrt_qty_cst += $freight_on_shortage_quantity_cst;
        $grand_total_frieght_cmp += $total_freight_cmp;
        $grand_total_frieght_cst += $total_freight_cst;
        $total_freight_amount_cmp += $freight_amount_cmp;
        $total_shortage_amount += $shortage_amount;
        $total_payable_before_tax += $payable_before_tax;
        $total_wht += $wht_amount;
        $total_net_payable += $net_payable;
        $total_contractor_net_freight += $contractor_net_freight;
        $total_company_commission += $company_commission_amount;
        $total_contractor_commission += $contractor_commission_amount;
        $total_freight_amount_cst += $freight_amount_cst;
        $total_customer_freight += $customer_freight_amount;
        $total_service_charges += $service_charges;
        /*-----------------------------------------*/

       ?>
        <tr style="border-top: <?= ($count == 1)?'3':'0'; ?>px solid lightblue;">

            <td>
                <?php
                echo "<input class='filter_check_box' type='checkbox' name='check[]' style='' value=".$detail->product_detail_id." checked>";
                ?>
            </td>
            <?php
            $style = '';
            if($trip->is_complete() == true)
            {
                $style = "background-color: lightgreen; color:white;";
            }
            ?>
            <?php if($count == 1){echo "<td style='".$style."' rowspan=".($num_trip_product_details). "><a target=_blank href='".base_url()."trips/edit/".$trip->trip_id."'>".$trip->trip_id."</a></td>";} ?>
            <!--computing trip_type-->
            <?php
            $trip_type = 'undefined';

            switch($trip->type)
            {
                case 1:
                    $trip_type = 'Self / Mail';
                    break;
                case 2:
                    $trip_type = 'General';
                    break;
                case 3:
                    $trip_type = 'Local Company';
                    break;
                case 4:
                    $trip_type = 'Local Self';
                    break;
                case 5:
                    $trip_type = 'General Local';
                    break;
                case 6:
                    $trip_type = 'Secondary Local';
                    break;
                default:
                    $trip_type = 'undefined';
                    break;
            }
            ?>
            <!---->
            <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".$trip_type."</td>";} ?>
            <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".Carbon::createFromFormat('Y-m-d',$trip->dates->entry_date)->toFormattedDateString()."</td>";} ?>
            <td>
                <?= $detail->source->name ?>
            </td>
            <td>
                <?= $detail->destination->name ?>
            </td>
            <td>
                <?php $invoice_date = $trip->dates->invoice_date; ?>
                <?= ($invoice_date == "0000-00-00")? 'n/a' :Carbon::createFromFormat('Y-m-d',$invoice_date)->toDateString() ?>
            </td>
            <td>
                <?= $trip->invoice_number ?>
            </td>
            <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".$trip->tanker->tanker_number."</td>";} ?>

            <td> <?= $detail->product->name; ?> </td>
            <td>
                <?= $dis_quantity ?>
            </td>

            <td>
                <?= $rec_quantity ?>
            </td>

            <td>
                <?= $shortage_quantity ?>
            </td>

            <td>
                <?= rupee_format($freight_on_shortage_quantity_cmp) ?>
            </td>

            <td>
                <?= rupee_format($freight_on_shortage_quantity_cst) ?>
            </td>

            <td>
                <?= rupee_format($company_freight_unit) ?>
            </td>

            <td>
                <?= rupee_format($total_freight_cmp) ?>
            </td>

            <td>
                <?= rupee_format($freight_amount_cmp) ?>
            </td>

            <!--company-->
            <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">". $trip->company->name."</td>";} ?>

            <td>
                <?= rupee_format($shortage_rate) ?>
            </td>

            <td>
                <?= rupee_format($shortage_amount) ?>
            </td>

            <td>
                <?= rupee_format($payable_before_tax) ?>
            </td>

            <td>
                <div class="dr_cr_status"><?= $detail->get_dr_cr_status('company_wht'); ?></div>
                <?= $wht."%: ".rupee_format($wht_amount) ?>
            </td>

            <td>
                <div class="dr_cr_status"><?= $detail->get_dr_cr_status('contractor_freight'); ?></div>
                <?= rupee_format($net_payable) ?>
            </td>

            <td>
                <?= rupee_format($contractor_net_freight) ?>
            </td>

            <td>
                <div class="dr_cr_status"><?= $detail->get_dr_cr_status('company_commission'); ?></div>
                <?= $company_commission."%: ".rupee_format($company_commission_amount) ?>
            </td>

            <td>
                <div class="dr_cr_status"><?= $detail->get_dr_cr_status('contractor_commission'); ?></div>
                <?= $contractor_commission."%: ".rupee_format($contractor_commission_amount) ?>
            </td>
            <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">". $trip->contractor->name."</td>";} ?>
            <td>
                <?= rupee_format($customer_freight_unit) ?>
            </td>

            <td>
                <?= rupee_format($total_freight_cst) ?>
            </td>

            <td>
                <?= rupee_format($freight_amount_cst) ?>
            </td>

            <td>
                <div class="dr_cr_status"><?= $detail->get_dr_cr_status('customer_freight'); ?></div>
                <?= rupee_format($customer_freight_amount) ?>
            </td>

            <!--customer-->
            <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">". $trip->customer->name."</td>";} ?>

            <td>
                <div class="dr_cr_status"><?= $detail->get_dr_cr_status('contractor_service_charges'); ?></div>
                <a href="<?= base_url()."carriageContractors/show_benefit/".$trip->trip_id."/".$detail->product_detail_id."/black_oil"; ?>" class="show_benefit_detail" style="background-color: rgba(0,0,0,0); border: 0px; width: 100%; height: 100%;">
                    <?= (rupee_format($service_charges)); ?>
                </a>
            </td>

            <td style="<?= (($detail->bill->id != 0)?'background-color:green; color:white; font-weight:bold;':'color:red;') ?>">
                <?= (($detail->bill->id != 0)?'billed':'not billed') ?>
            </td>
        </tr>
    <?php endforeach ?>
<?php endforeach; ?>
</tbody>
<tfoot>
<tr style="color: white; background-color: #444444">
    <td colspan="9"></td>
    <td>
        <?= $total_dis_qty ?>
    </td>
    <td>
        <?= $total_rec_qty ?>
    </td>
    <td>
        <?= $total_shortage_qty ?>
    </td>
    <td>
        <?= rupee_format($total_freight_on_shrt_qty_cmp) ?>
    </td>
    <td>
        <?= rupee_format($total_freight_on_shrt_qty_cst) ?>
    </td>
    <td></td>
    <td>
        <?= rupee_format($grand_total_frieght_cmp) ?>
    </td>
    <td>
        <?= rupee_format($total_freight_amount_cmp) ?>
    </td>
    <!--company-->
    <td></td>
    <td></td>
    <td>
        <?= rupee_format($total_shortage_amount) ?>
    </td>
    <td>
        <?= rupee_format($total_payable_before_tax) ?>
    </td>
    <td>
        <?= rupee_format($total_wht) ?>
    </td>
    <td>
        <?= rupee_format($total_net_payable) ?>
    </td>
    <td>
        <?= rupee_format($total_contractor_net_freight) ?>
    </td>
    <td>
        <?= rupee_format($total_company_commission) ?>
    </td>
    <td>
        <?= rupee_format($total_contractor_commission) ?>
    </td>
    <td></td>
    <td> </td>
    <td>
        <?= rupee_format($grand_total_frieght_cst) ?>
    </td>
    <td>
        <?= rupee_format($total_freight_amount_cst) ?>
    </td>
    <td>
        <?= rupee_format($total_customer_freight) ?>
    </td>
    <!--customer-->
    <td></td>
    <td>
        <?= rupee_format($total_service_charges) ?>
    </td>
    <td></td>
</tr>
</tfoot>
</table>
</form>
</div>
<!--//pages-->
<div class="col-lg-12 text-center">
    <?php
    echo $pages;
    ?>
</div>
</div>
</div>
</div>
</div>
</div>

</div>

</div>

<script src="<?= js()."jquery.magnific-popup.min.js"; ?>"></script>

<script>


    $.magnificPopup.instance._onFocusIn = function(e) {
        // Do nothing if target element is select2 input
        if( $(e.target).hasClass('select2-search__field') ) {
            return true;
        }
        // Else call parent method
        $.magnificPopup.proto._onFocusIn.call(this,e);
    };

    $('.show_benefit_detail').magnificPopup({
        type: 'ajax',
        showCloseBtn:false
    }); $('.open_voucher_for_user').magnificPopup({
        type: 'ajax',
        showCloseBtn:false
    });
    $('.open-custom-accounts-popup').magnificPopup({
        type: 'inline',
        showCloseBtn:true,
        callbacks: {
            open: function() {
                $(".customers_select").select2();
                $(".contractors_select").select2();
                $(".companies_select").select2();
                $(".drivers_select").select2();
                $(".source_city_select").select2();
                $(".destination_city_select").select2();
                $(".product_select").select2();
                $(".tankers_select").select2();
                $(".titles_select").select2();
            }
            // e.t.c.
        }
    });
    $('.open-bill-trips-popup').magnificPopup({
        type: 'inline',
        showCloseBtn:true
    });
    $('.open_custom_voucher_for_user').magnificPopup({
        type: 'ajax',
        showCloseBtn:true
    });

</script>
