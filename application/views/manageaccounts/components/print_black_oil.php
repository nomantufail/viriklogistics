<html>
    <head>
        <title>Accounts</title>
        <link href="<?= css()?>bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <style>
            table{
                font-size: <?= $font_size ?>;
            }
            table td, th{
                padding: 5px;
            }
            .multiple_entites{
                border-bottom: 1px dashed lightgray;
            }
        </style>
        <div id="page-wrapper" style="min-height: 700px;">
    <div class="container-fluid">

    <div class="row">
        <div class="col-lg-12">
            <section class="col-md-12" style="text-align: center;">
                <h3 class="">
                    Manage Accounts Black Oil
                </h3>
            </section>
        </div>
    </div>
    <div class="row">
    <div class="col-lg-12">
    <div class="panel-body">
    <div id="myTabContent" class="tab-content" style="min-height: 500px;">
    <div class="tab-pane fade in active" id="customers">
    <div class="table-responsive">
    <table class="table table-bordered table-hover table-striped accounts-table sortable" style="min-width:1900px;">

    <thead style="border-top: 4px solid lightgray;">
    <tr>
        <?= ((in_array('id', $columns) == true)?"<th>Id</th>":"") ?>
        <?= ((in_array('trip_type', $columns) == true)?"<th>Trip Type </th>":"") ?>
        <?= ((in_array('trip_date', $columns) == true)?"<th> Trip Date </th>":"") ?>
        <?= ((in_array('source', $columns) == true)?"<th> Source </th>":"") ?>
        <?= ((in_array('destination', $columns) == true)?"<th> Destination </th>":"") ?>
        <?= ((in_array('invoice_date', $columns) == true)?"<th> Invoice Date </th>":"") ?>
        <?= ((in_array('tanker', $columns) == true)?"<th> Tanker# </th>":"") ?>
        <?= ((in_array('product', $columns) == true)?"<th> Product </th>":"") ?>
        <?= ((in_array('dis_qty', $columns) == true)?"<th> Dis Qty </th>":"") ?>
        <?= ((in_array('rec_qty', $columns) == true)?"<th> Rec Qty </th>":"") ?>
        <?= ((in_array('shortage_qty', $columns) == true)?"<th> Shortage Qty </th>":"") ?>
        <?= ((in_array('frt_shrt_qty_cmp', $columns) == true)?"<th> Freight On Shortage Qty (cmp) </th>":"") ?>
        <?= ((in_array('frt_shrt_qty_cst', $columns) == true)?"<th> Freight on Shortage Qty (cst) </th>":"") ?>
        <?= ((in_array('frt_unit_cmp', $columns) == true)?"<th> Freight Unit (cmp) </th>":"") ?>
        <?= ((in_array('total_frt_cmp', $columns) == true)?"<th> Total Freight (cmp) </th>":"") ?>
        <?= ((in_array('frt_amount_cmp', $columns) == true)?"<th> Freight Amount (cmp) </th>":"") ?>
        <?= ((in_array('company', $columns) == true)?"<th> Company </th>":"") ?>
        <?= ((in_array('shortage_rate', $columns) == true)?"<th> Shortage Rate </th>":"") ?>
        <?= ((in_array('shortage_amount', $columns) == true)?"<th> Shortage Amount </th>":"") ?>
        <?= ((in_array('payable_before_tax', $columns) == true)?"<th> Payable Before Tax </th>":"") ?>
        <?= ((in_array('wht', $columns) == true)?"<th> W.H.T </th>":"") ?>
        <?= ((in_array('net_payable', $columns) == true)?"<th> Net Payable </th>":"") ?>
        <?= ((in_array('contractor_net_freight', $columns) == true)?"<th> Contractor Net Fr. </th>":"") ?>
        <?= ((in_array('company_commission', $columns) == true)?"<th> Company Commission </th>":"") ?>
        <?= ((in_array('contractor_commission', $columns) == true)?"<th> Contractor Commission </th>":"") ?>
        <?= ((in_array('contractor', $columns) == true)?"<th> Contractor </th>":"") ?>
        <?= ((in_array('fr_unit_cst', $columns) == true)?"<th> Freight Unit (cst) </th>":"") ?>
        <?= ((in_array('total_fr_cst', $columns) == true)?"<th> Total Freight (cst) </th>":"") ?>
        <?= ((in_array('fr_amount_cst', $columns) == true)?"<th> Freight Amount (cst) </th>":"") ?>
        <?= ((in_array('customer_fr', $columns) == true)?"<th> Customer Freight </th>":"") ?>
        <?= ((in_array('customer', $columns) == true)?"<th> Customer </th>":"") ?>
        <?= ((in_array('service_charges', $columns) == true)?"<th> Service Charges </th>":"") ?>
        <?= ((in_array('billed', $columns) == true)?"<th> Billed </th>":"") ?>

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
            <?php if(in_array('id', $columns) == true): ?>
                <?php
                $style = '';
                if($trip->is_complete() == true)
                {
                    $style = "background-color: lightgreen; color:white;";
                }
                ?>
                <?php if($count == 1){echo "<td style='".$style."' rowspan=".($num_trip_product_details). ">".$trip->trip_id."</td>";} ?>
            <?php endif; ?>

                <?php if(in_array('trip_type', $columns) == true): ?>
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
                <?php endif; ?>

                <?php if(in_array('trip_date', $columns) == true): ?>
                    <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".Carbon::createFromFormat('Y-m-d',$trip->dates->entry_date)->toFormattedDateString()."</td>";} ?>
                <?php endif; ?>

                <?php if(in_array('source', $columns) == true): ?>
                    <td>
                        <?= $detail->source->name ?>
                    </td>
                <?php endif; ?>

                <?php if(in_array('destination', $columns) == true): ?>
                    <td>
                        <?= $detail->destination->name ?>
                    </td>
                <?php endif; ?>

                <?php if(in_array('invoice_date', $columns) == true): ?>
                    <td>
                        <?php $invoice_date = $trip->dates->invoice_date; ?>
                        <?= ($invoice_date == "0000-00-00")? 'n/a' :Carbon::createFromFormat('Y-m-d',$invoice_date)->toDateString() ?>
                    </td>
                <?php endif; ?>

                <?php if(in_array('tanker', $columns) == true): ?>
                    <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".$trip->tanker->tanker_number."</td>";} ?>
                <?php endif; ?>

                <?php if(in_array('product', $columns) == true): ?>
                    <td> <?= $detail->product->name; ?> </td>
                <?php endif; ?>

                <?php if(in_array('dis_qty', $columns) == true): ?>
                    <td>
                        <?= $dis_quantity ?>
                    </td>
                <?php endif; ?>

                <?php if(in_array('rec_qty', $columns) == true): ?>
                    <td>
                        <?= $rec_quantity ?>
                    </td>
                <?php endif; ?>

                <?php if(in_array('shortage_qty', $columns) == true): ?>
                    <td>
                        <?= $shortage_quantity ?>
                    </td>
                <?php endif; ?>

            <?php if(in_array('frt_shrt_qty_cmp', $columns) == true): ?>
                <td>
                    <?= rupee_format($freight_on_shortage_quantity_cmp) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('frt_shrt_qty_cst', $columns) == true): ?>
                <td>
                    <?= rupee_format($freight_on_shortage_quantity_cst) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('frt_unit_cmp', $columns) == true): ?>
                <td>
                    <?= rupee_format($company_freight_unit) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('total_frt_cmp', $columns) == true): ?>
                <td>
                    <?= rupee_format($total_freight_cmp) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('frt_amount_cmp', $columns) == true): ?>
                <td>
                    <?= rupee_format($freight_amount_cmp) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('company', $columns) == true): ?>
                <!--company-->
                <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">". $trip->company->name."</td>";} ?>
            <?php endif; ?>

            <?php if(in_array('shortage_rate', $columns) == true): ?>
                <td>
                    <?= rupee_format($shortage_rate) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('shortage_amount', $columns) == true): ?>
                <td>
                    <?= rupee_format($shortage_amount) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('payable_before_tax', $columns) == true): ?>
                <td>
                    <?= rupee_format($payable_before_tax) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('wht', $columns) == true): ?>
                <td>
                    <div class="dr_cr_status"><?= $detail->get_dr_cr_status('company_wht'); ?></div>
                    <?= $wht."%: ".rupee_format($wht_amount) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('net_payable', $columns) == true): ?>
                <td>
                    <div class="dr_cr_status"><?= $detail->get_dr_cr_status('contractor_freight'); ?></div>
                    <?= rupee_format($net_payable) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('contractor_net_freight', $columns) == true): ?>
                <td>
                    <?= rupee_format($contractor_net_freight) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('company_commission', $columns) == true): ?>
                <td>
                    <div class="dr_cr_status"><?= $detail->get_dr_cr_status('company_commission'); ?></div>
                    <?= $company_commission."%: ".rupee_format($company_commission_amount) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('contractor_commission', $columns) == true): ?>
                <td>
                    <div class="dr_cr_status"><?= $detail->get_dr_cr_status('contractor_commission'); ?></div>
                    <?= $contractor_commission."%: ".rupee_format($contractor_commission_amount) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('contractor', $columns) == true): ?>
                <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">". $trip->contractor->name."</td>";} ?>
            <?php endif; ?>

            <?php if(in_array('fr_unit_cst', $columns) == true): ?>
                <td>
                    <?= rupee_format($customer_freight_unit) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('total_fr_cst', $columns) == true): ?>
                <td>
                    <?= rupee_format($total_freight_cst) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('fr_amount_cst', $columns) == true): ?>
                <td>
                    <?= rupee_format($freight_amount_cst) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('customer_fr', $columns) == true): ?>
                <td>
                    <div class="dr_cr_status"><?= $detail->get_dr_cr_status('customer_freight'); ?></div>
                    <?= rupee_format($customer_freight_amount) ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('customer', $columns) == true): ?>
                <!--customer-->
                <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">". $trip->customer->name."</td>";} ?>
            <?php endif; ?>

            <?php if(in_array('service_charges', $columns) == true): ?>
                <td>
                    <div class="dr_cr_status"><?= $detail->get_dr_cr_status('contractor_service_charges'); ?></div>
                    <?= (rupee_format($service_charges)); ?>
                </td>
            <?php endif; ?>

            <?php if(in_array('billed', $columns) == true): ?>
                <td style="<?= (($detail->bill->id != 0)?'background-color:green; color:white; font-weight:bold;':'color:red;') ?>">
                    <?= (($detail->bill->id != 0)?'billed':'not billed') ?>
                </td>
            <?php endif; ?>

            </tr>
        <?php endforeach ?>
    <?php endforeach; ?>
    </tbody>
    <tfoot>
    <tr style="color: white; background-color: #444444">
        <?= ((in_array('id', $columns) == true)?"<th>Id</th>":"") ?>
        <?= ((in_array('trip_type', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('trip_date', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('source', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('destination', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('invoice_date', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('tanker', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('product', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('dis_qty', $columns) == true)?"<th>".$total_dis_qty." </th>":"") ?>
        <?= ((in_array('rec_qty', $columns) == true)?"<th>".$total_rec_qty." </th>":"") ?>
        <?= ((in_array('shortage_qty', $columns) == true)?"<th>".$total_shortage_qty." </th>":"") ?>
        <?= ((in_array('frt_shrt_qty_cmp', $columns) == true)?"<th>".$total_freight_on_shrt_qty_cmp." </th>":"") ?>
        <?= ((in_array('frt_shrt_qty_cst', $columns) == true)?"<th>".$total_freight_on_shrt_qty_cst." </th>":"") ?>
        <?= ((in_array('frt_unit_cmp', $columns) == true)?"<th></th>":"") ?>
        <?= ((in_array('total_frt_cmp', $columns) == true)?"<th>".$grand_total_frieght_cmp." </th>":"") ?>
        <?= ((in_array('frt_amount_cmp', $columns) == true)?"<th>".$total_freight_amount_cmp."</th>":"") ?>
        <?= ((in_array('company', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('shortage_rate', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('shortage_amount', $columns) == true)?"<th>".$total_shortage_amount." </th>":"") ?>
        <?= ((in_array('payable_before_tax', $columns) == true)?"<th>".$total_payable_before_tax." </th>":"") ?>
        <?= ((in_array('wht', $columns) == true)?"<th>".$total_wht." </th>":"") ?>
        <?= ((in_array('net_payable', $columns) == true)?"<th>".$total_net_payable." </th>":"") ?>
        <?= ((in_array('contractor_net_freight', $columns) == true)?"<th>".$total_contractor_net_freight." </th>":"") ?>
        <?= ((in_array('company_commission', $columns) == true)?"<th>".$total_company_commission." </th>":"") ?>
        <?= ((in_array('contractor_commission', $columns) == true)?"<th>".$total_contractor_commission." </th>":"") ?>
        <?= ((in_array('contractor', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('fr_unit_cst', $columns) == true)?"<th> </th>":"") ?>
        <?= ((in_array('total_fr_cst', $columns) == true)?"<th>".$total_freight_cst." </th>":"") ?>
        <?= ((in_array('fr_amount_cst', $columns) == true)?"<th>".$total_freight_amount_cst." </th>":"") ?>
        <?= ((in_array('customer_fr', $columns) == true)?"<th>".$total_customer_freight." </th>":"") ?>
        <?= ((in_array('customer', $columns) == true)?"<th></th>":"") ?>
        <?= ((in_array('service_charges', $columns) == true)?"<th> ".$total_service_charges."</th>":"") ?>
        <?= ((in_array('billed', $columns) == true)?"<th> </th>":"") ?>
    </tr>
    </tfoot>
    </table>
    </div>
    </div>

    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </body>
</html>
