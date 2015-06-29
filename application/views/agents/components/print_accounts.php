<html><head>    <title>Accounts</title>    <link href="<?= css()?>bootstrap.min.css" rel="stylesheet"></head><body><style>    table{        font-size: 11px;    }    .multiple_entites{       border-bottom: 1px dashed lightgray;    }</style><div id="page-wrapper" style="min-height: 700px;">    <div class="container-fluid">        <div class="row">            <div class="col-lg-12">                <section class="col-md-12">                    <h3 class="">                       Customer Accounts: <?= $profile->name; ?><small></small>                    </h3>                </section>            </div>        </div>        <div class="row">            <div class="col-lg-12">                <div class="panel-body">                    <div id="myTabContent" class="tab-content" style="min-height: 500px;">                        <div class="tab-pane fade in active" id="customers">                            <div class="table-responsive">                                <table class="table table-bordered table-hover table-striped accounts-table sortable" style="">                                <thead style="border-top: 4px solid lightgray;">                                    <tr>                                        <?= ((in_array('id', $columns) == true)?"<th>Id</th>":"") ?>                                        <?= ((in_array('trip_date', $columns) == true)?"<th>Trip Date</th>":"") ?>                                        <?= ((in_array('product', $columns) == true)?"<th>Product</th>":"") ?>                                        <?= ((in_array('route', $columns) == true)?"<th>Route</th>":"") ?>                                        <?= ((in_array('company', $columns) == true)?"<th>Company</th>":"") ?>                                        <?= ((in_array('contractor', $columns) == true)?"<th style='width: 7%;'>Contractor</th>":"") ?>                                        <?= ((in_array('customer_freight_unit', $columns) == true)?"<th style=''>Freight/Unit (cst)</th>":"") ?>                                        <?= ((in_array('total_freight_for_customer', $columns) == true)?"<th style=''>Total Freight (cst)</th>":"") ?>                                        <?= ((in_array('customer_net_freight', $columns) == true)?"<th style=''>Customer Freight</th>":"") ?>                                        <?= ((in_array('customer_freight_paid', $columns) == true)?"<th style=''>Paid (cst)</th>":"") ?>                                        <?= ((in_array('customer_freight_remaining', $columns) == true)?"<th style=''>Remaining (cst)</th>":"") ?>                                    </tr>                                    </thead>                                    <tbody>                                    <?php                                    $grand_total_freight_for_company = 0;                                    $total_wht = 0;                                    $total_company_commission_amount = 0;                                    $total_paid_to_company = 0;                                    $total_company_remaining = 0;                                    $total_contractor_freight_amount = 0;                                    $total_paid_to_contractor = 0;                                    $total_contractor_remaining = 0;                                    $total_contractor_commission =0;                                    $grand_total_freight_for_customer = 0;                                    $total_customer_freight_amount =0;                                    $total_paid_to_customer =0;                                    $total_customer_remaining =0;                                    ?>                                    <?php $parent_count = 0; ?>                                    <?php  foreach($accounts as $trip): ?>                                        <?php                                        $count = 0;                                        $num_trip_product_details = sizeof($trip->trip_related_details);                                        ?>                                        <?php foreach($trip->trip_related_details as $detail): ?>                                            <?php                                            $count++;                                            $parent_count++;                                            ?>                                            <tr style="border-top: <?= ($count == 1)?'3':'0'; ?>px solid lightblue;">                                                <!--first column-->                                                <?php if(in_array('id', $columns) == true): ?>                                                    <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".$trip->trip_id."</td>";} ?>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('trip_date', $columns) == true): ?>                                                    <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".Carbon::createFromFormat('Y-m-d',$trip->dates->entry_date)->toFormattedDateString()."</td>";} ?>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('product', $columns) == true): ?>                                                    <td> <?= $detail->product->name; ?> </td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('route', $columns) == true): ?>                                                    <td><?= $detail->source->name." To ".$detail->destination->name; ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('company', $columns) == true): ?>                                                    <td><?= $trip->company->name; ?></td>                                                <?php endif; ?>                                                <?php                                                $customer_freight_amount = round($detail->get_customer_freight_amount($trip->customer->freight), 3);                                                $paid_to_customer = round($detail->get_paid_to_customer(),3);                                                $customer_remaining = round(($customer_freight_amount - $paid_to_customer), 3);                                                $total_freight_for_customer = $detail->get_total_freight_for_customer();                                                $grand_total_freight_for_customer += $total_freight_for_customer;                                                $total_customer_freight_amount += $customer_freight_amount;                                                $total_paid_to_customer += $paid_to_customer;                                                $total_customer_remaining += $customer_remaining;                                                ?>                                                <!--first column-->                                                <?php if(in_array('contractor', $columns) == true): ?>                                                    <td><?= $trip->contractor->name; ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('customer_freight_unit', $columns) == true): ?>                                                    <td><?= $detail->customer_freight_unit; ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('total_freight_for_customer', $columns) == true): ?>                                                    <td><?= $detail->get_total_freight_for_customer(); ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('customer_net_freight', $columns) == true): ?>                                                    <td><?= $trip->customer->freight."% = ".$this->helper_model->money($customer_freight_amount); ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('customer_freight_paid', $columns) == true): ?>                                                    <td class="<?= (($customer_remaining != 0)?'unpaid':'paid') ?>">                                                        <?= $paid_to_customer; ?>                                                    </td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('customer_freight_remaining', $columns) == true): ?>                                                    <td><?= $this->helper_model->money($customer_remaining); ?></td>                                                <?php endif; ?>                                            </tr>                                        <?php endforeach ?>                                    <?php endforeach; ?>                                    </tbody>                                    <tfoot>                                    <tr>                                        <?= ((in_array('id', $columns) == true)?"<th>Totals</th>":"") ?>                                        <?= ((in_array('trip_date', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('product', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('route', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('company', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('contractor', $columns) == true)?"<th style=''></th>":"") ?>                                        <?= ((in_array('customer_freight_unit', $columns) == true)?"<th style=''></th>":"") ?>                                        <?= ((in_array('total_freight_for_customer', $columns) == true)?"<th style=''>".$this->helper_model->money($grand_total_freight_for_customer)."</th>":"") ?>                                        <?= ((in_array('customer_net_freight', $columns) == true)?"<th style=''>".$this->helper_model->money($total_customer_freight_amount)."</th>":"") ?>                                        <?= ((in_array('customer_freight_paid', $columns) == true)?"<th style=''>".$this->helper_model->money($total_paid_to_customer)."</th>":"") ?>                                        <?= ((in_array('customer_freight_remaining', $columns) == true)?"<th style=''>".$this->helper_model->money($total_customer_remaining)."</th>":"") ?>                                    </tr>                                    </tfoot>                                </table>                            </div>                        </div>                    </div>                </div>            </div>        </div>    </div></div></body></html>