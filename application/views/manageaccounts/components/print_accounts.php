<html><head>    <title>Accounts</title>    <link href="<?= css()?>bootstrap.min.css" rel="stylesheet"></head><body><style>    table{        font-size: <?= $font_size ?>;    }    table td, th{        padding: 5px;    }    .multiple_entites{       border-bottom: 1px dashed lightgray;    }</style><div id="page-wrapper" style="min-height: 700px;">    <div class="container-fluid">        <div class="row">            <div class="col-lg-12">                <section class="col-md-12" style="text-align: center;">                    <h3 class="">                       Trips Details                    </h3>                </section>            </div>        </div>        <div class="row">            <div class="col-lg-12">                <div class="panel-body">                    <div id="myTabContent" class="tab-content" style="min-height: 500px;">                        <div class="tab-pane fade in active" id="customers">                            <div class="table-responsive">                                <table class="table-bordered table-hover table-striped accounts-table sortable" style="">                                <thead style="border-top: 4px solid lightgray;">                                    <tr>                                        <?= ((in_array('id', $columns) == true)?"<th>Id</th>":"") ?>                                        <?= ((in_array('trip_type', $columns) == true)?"<th>Trip Type</th>":"") ?>                                        <?= ((in_array('trip_date', $columns) == true)?"<th>Trip Date</th>":"") ?>                                        <?= ((in_array('tanker', $columns) == true)?"<th>Tanker</th>":"") ?>                                        <?= ((in_array('product', $columns) == true)?"<th>Product</th>":"") ?>                                        <?= ((in_array('product_quantity', $columns) == true)?"<th>Product Quantity</th>":"") ?>                                        <?= ((in_array('route', $columns) == true)?"<th>Route</th>":"") ?>                                        <?= ((in_array('stn', $columns) == true)?"<th>Stn-Number</th>":"") ?>                                        <?= ((in_array('company', $columns) == true)?"<th>Company</th>":"") ?>                                        <?= ((in_array('company_freight_unit', $columns) == true)?"<th style='width: 5%;'>Freight/Unit (cmp)</th>":"") ?>                                        <?= ((in_array('total_freight_for_company', $columns) == true)?"<th style='width: 7%;'>Total Freight (cmp)</th>":"") ?>                                        <?= ((in_array('wht', $columns) == true)?"<th>W.H.T</th>":"") ?>                                        <?= ((in_array('company_commission', $columns) == true)?"<th style='width: 7%;'>Company's Commission</th>":"") ?>                                        <?= ((in_array('company_commission_paid', $columns) == true)?"<th style='width: 5%;'>Paid (cmp)</th>":"") ?>                                        <?= ((in_array('company_commission_remaining', $columns) == true)?"<th style='width: 5%;'>Remaining (cmp)</th>":"") ?>                                        <?= ((in_array('contractor', $columns) == true)?"<th>Contractor</th>":"") ?>                                        <?= ((in_array('contractor_freight', $columns) == true)?"<th style='width: 7%;'>Contractor's Freight</th>":"") ?>                                        <?= ((in_array('contractor_net_freight', $columns) == true)?"<th style='width: 7%;'>Contractor Net Freight</th>":"") ?>                                        <?= ((in_array('contractor_freight_paid', $columns) == true)?"<th style='width: 5%;'>Paid (cnt)</th>":"") ?>                                        <?= ((in_array('contractor_freight_remaining', $columns) == true)?"<th style='width: 5%;'>Remaining (cnt)</th>":"") ?>                                        <?= ((in_array('contractor_commission', $columns) == true)?"<th style='width: 5%;'>Contractor Commission</th>":"") ?>                                        <?= ((in_array('customer', $columns) == true)?"<th style='width: 5%;'>Customer</th>":"") ?>                                        <?= ((in_array('customer_freight_unit', $columns) == true)?"<th style='width: 5%;'>Freight/Unit (cst)</th>":"") ?>                                        <?= ((in_array('total_freight_for_customer', $columns) == true)?"<th style='width: 5%;'>Total Freight (cst)</th>":"") ?>                                        <?= ((in_array('customer_net_freight', $columns) == true)?"<th style='width: 5%;'>Customer Freight</th>":"") ?>                                        <?= ((in_array('contractor_service_charges', $columns) == true)?"<th style='width: 5%;'>Service Charges</th>":"") ?>                                        <?= ((in_array('billed', $columns) == true)?"<th style='width: 5%;'> Billed</th>":"") ?>                                    </tr>                                    </thead>                                    <tbody>                                    <?php                                    $grand_total_freight_for_company = 0;                                    $total_wht = 0;                                    $total_company_commission_amount = 0;                                    $total_paid_to_company = 0;                                    $total_company_remaining = 0;                                    $total_contractor_freight_amount = 0;                                    $total_contractor_net_freight_amount = 0;                                    $total_paid_to_contractor = 0;                                    $total_contractor_remaining = 0;                                    $total_contractor_commission =0;                                    $grand_total_freight_for_customer = 0;                                    $total_customer_freight_amount =0;                                    $total_paid_to_customer =0;                                    $total_customer_remaining =0;                                    $total_service_charges = 0;                                    $total_product_quantity = 0;                                    ?>                                    <?php $parent_count = 0; ?>                                    <?php  foreach($accounts as $trip): ?>                                        <?php                                        $count = 0;                                        $num_trip_product_details = sizeof($trip->trip_related_details);                                        ?>                                        <?php foreach($trip->trip_related_details as $detail): ?>                                            <?php                                            $count++;                                            $parent_count++;                                            ?>                                            <tr style="border-top: <?= ($count == 1)?'3':'0'; ?>px solid lightblue;">                                                <!--first column-->                                                <?php if(in_array('id', $columns) == true): ?>                                                    <?php                                                    $style = '';                                                    if($trip->is_complete() == true)                                                    {                                                        $style = "background-color: lightgreen; color:black;";                                                    }                                                    ?>                                                    <?php if($count == 1){echo "<td style='".$style."' rowspan=".($num_trip_product_details).">".$trip->trip_id."</td>";} ?>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('trip_type', $columns) == true): ?>                                                    <?php                                                    $trip_type = 'undefined';                                                    switch($trip->type)                                                    {                                                        case 1:                                                            $trip_type = 'Self / Mail';                                                            break;                                                        case 2:                                                            $trip_type = 'General';                                                            break;                                                        case 3:                                                            $trip_type = 'Local Company';                                                            break;                                                        case 4:                                                            $trip_type = 'Local Self';                                                            break;                                                        case 5:                                                            $trip_type = 'General Local';                                                            break;                                                        case 6:                                                            $trip_type = 'Secondary Local';                                                            break;                                                        default:                                                            $trip_type = 'undefined';                                                            break;                                                    }                                                    ?>                                                    <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".($trip_type)."</td>";} ?>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('trip_date', $columns) == true): ?>                                                    <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".Carbon::createFromFormat('Y-m-d',$trip->dates->entry_date)->toFormattedDateString()."</td>";} ?>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('tanker', $columns) == true): ?>                                                    <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".$trip->tanker->tanker_number."</td>";} ?>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('product', $columns) == true): ?>                                                    <td> <?= $detail->product->name; ?> </td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('product_quantity', $columns) == true): ?>                                                    <?php                                                    $total_product_quantity += $detail->product_quantity;                                                    ?>                                                    <td> <?= $detail->product_quantity; ?> </td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('route', $columns) == true): ?>                                                    <td><?= $detail->source->name." To ".$detail->destination->name; ?></td>                                                <?php endif; ?>                                                <?php if(in_array('stn', $columns) == true): ?>                                                    <td><?= $detail->stn_number; ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('company', $columns) == true): ?>                                                    <td><?= $trip->company->name; ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('company_freight_unit', $columns) == true): ?>                                                    <td><?= round($detail->company_freight_unit, 4); ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('total_freight_for_company', $columns) == true): ?>                                                    <td>                                                        <?php                                                        $total_freight_for_company = round($detail->get_total_freight_for_company(), 3);                                                        $grand_total_freight_for_company += $total_freight_for_company;                                                        echo $this->helper_model->money($total_freight_for_company);                                                        ?>                                                    </td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('wht', $columns) == true): ?>                                                    <td>                                                        <?php                                                        $wht = $trip->company->wht;                                                        $wht_amount = round($detail->get_wht_amount($trip->company->wht), 3);                                                        $total_wht += $wht_amount;                                                        ?>                                                        <?= $wht."% = ".$this->helper_model->money($wht_amount); ?>                                                    </td>                                                <?php endif; ?>                                                <!--additional computation-->                                                <?php                                                $company_commission_amount = round($detail->get_company_commission_amount($trip->company->commission_1), 3);                                                $paid_to_company = round($detail->get_paid_to_company(), 3);                                                $company_remaining = round(($company_commission_amount - $paid_to_company), 3);                                                $total_company_commission_amount += $company_commission_amount;                                                $total_paid_to_company += $paid_to_company;                                                $total_company_remaining += $company_remaining;                                                ?>                                                <!--first column-->                                                <?php if(in_array('company_commission', $columns) == true): ?>                                                    <td><?= $trip->company->commission_1."% = ".$this->helper_model->money($company_commission_amount); ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('company_commission_paid', $columns) == true): ?>                                                    <td class="<?= (($company_remaining != 0)?'unpaid':'paid') ?>">                                                        <?= $this->helper_model->money($paid_to_company); ?>                                                    </td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('company_commission_remaining', $columns) == true): ?>                                                    <td><?= $this->helper_model->money($company_remaining); ?></td>                                                <?php endif; ?>                                                <!--additional computation-->                                                <?php                                                $contractor_freight_amount = round($detail->get_contractor_freight_amount_according_to_company($trip->get_contractor_freight_according_to_company()),3);                                                $contractor_net_freight_amount = $contractor_freight_amount - $company_commission_amount;                                                $paid_to_contractor = round($detail->get_paid_to_contractor(),3);                                                $contractor_remaining = round(($contractor_freight_amount - $paid_to_contractor),4);                                                $contractor_commission = $trip->contractor->commission_1 - $trip->company->wht - $trip->company->commission_1;                                                $contractor_commission_amount = $detail->get_contractor_commission_amount($contractor_commission);                                                $total_contractor_freight_amount += $contractor_freight_amount;                                                $total_contractor_net_freight_amount += $contractor_net_freight_amount;                                                $total_paid_to_contractor += $paid_to_contractor;                                                $total_contractor_remaining += $contractor_remaining;                                                $total_contractor_commission += $contractor_commission_amount;                                                ?>                                                <!--first column-->                                                <?php if(in_array('contractor', $columns) == true): ?>                                                    <?php if($count == 1){echo "<td rowspan=".($num_trip_product_details).">".$trip->contractor->name."</td>";} ?>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('contractor_freight', $columns) == true): ?>                                                    <td><?= $trip->get_contractor_freight_according_to_company()."% = ".$this->helper_model->money($contractor_freight_amount); ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('contractor_net_freight', $columns) == true): ?>                                                    <td><?= ($trip->get_contractor_freight_according_to_company() - $trip->company->commission_1)."% = ".$this->helper_model->money($contractor_net_freight_amount); ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('contractor_freight_paid', $columns) == true): ?>                                                    <td class="<?= (($contractor_remaining != 0)?'unpaid':'paid') ?>">                                                            <?= $this->helper_model->money($paid_to_contractor); ?>                                                    </td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('contractor_freight_remaining', $columns) == true): ?>                                                    <td><?= $this->helper_model->money($contractor_remaining); ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('contractor_commission', $columns) == true): ?>                                                    <td class="<?= (($detail->is_contractor_commission_paid($trip->customer->freight) == true)?'paid':'unpaid') ?>"><?= $trip->contractor->commission_1."% = ".$this->helper_model->money($contractor_commission_amount); ?></td>                                                <?php endif; ?>                                                <?php                                                $customer_freight_amount = round($detail->get_customer_freight_amount($trip->customer->freight), 3);                                                $paid_to_customer = round($detail->get_paid_to_customer(),3);                                                $customer_remaining = round(($customer_freight_amount - $paid_to_customer), 3);                                                $total_freight_for_customer = $detail->get_total_freight_for_customer();                                                $grand_total_freight_for_customer += $total_freight_for_customer;                                                $total_customer_freight_amount += $customer_freight_amount;                                                $total_paid_to_customer += $paid_to_customer;                                                $total_customer_remaining += $customer_remaining;                                                ?>                                                <!--first column-->                                                <?php if(in_array('customer', $columns) == true): ?>                                                    <td><?= $trip->customer->name; ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('customer_freight_unit', $columns) == true): ?>                                                    <td><?= round($detail->customer_freight_unit, 4); ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('total_freight_for_customer', $columns) == true): ?>                                                    <td><?= $this->helper_model->money($total_freight_for_customer); ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php if(in_array('customer_net_freight', $columns) == true): ?>                                                    <td><?= $trip->customer->freight."% = ".$this->helper_model->money($customer_freight_amount); ?></td>                                                <?php endif; ?>                                                <!--first column-->                                                <?php                                                $service_charges = round($detail->contractor_benefits(), 4);                                                $total_service_charges += $service_charges;                                                ?>                                                <?php if(in_array('contractor_service_charges', $columns) == true): ?>                                                    <td><?= $this->helper_model->money($service_charges, 3); ?></td>                                                <?php endif; ?>                                                <?php if(in_array('billed', $columns) == true): ?>                                                    <td style="<?= (($detail->bill->id != 0)?'background-color:green; color:white; font-weight:bold;':'color:red;') ?>">                                                        <?= (($detail->bill->id != 0)?'billed':'not billed') ?>                                                    </td>                                                <?php endif; ?>                                            </tr>                                        <?php endforeach ?>                                    <?php endforeach; ?>                                    </tbody>                                    <tfoot>                                    <tr>                                        <?= ((in_array('id', $columns) == true)?"<th>Totals</th>":"") ?>                                        <?= ((in_array('trip_type', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('trip_date', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('tanker', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('product', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('product_quantity', $columns) == true)?"<th>". $this->helper_model->money($total_product_quantity)."</th>":"") ?>                                        <?= ((in_array('route', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('stn', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('company', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('company_freight_unit', $columns) == true)?"<th style='width: 5%;'></th>":"") ?>                                        <?= ((in_array('total_freight_for_company', $columns) == true)?"<th style='width: 7%;'>".$this->helper_model->money($grand_total_freight_for_company)."</th>":"") ?>                                        <?= ((in_array('wht', $columns) == true)?"<th>".$this->helper_model->money($total_wht)."</th>":"") ?>                                        <?= ((in_array('company_commission', $columns) == true)?"<th style='width: 7%;'>".$this->helper_model->money($total_company_commission_amount)."</th>":"") ?>                                        <?= ((in_array('company_commission_paid', $columns) == true)?"<th style='width: 5%;'>".$this->helper_model->money($total_paid_to_company)."</th>":"") ?>                                        <?= ((in_array('company_commission_remaining', $columns) == true)?"<th style='width: 5%;'>".$this->helper_model->money($total_company_remaining)."</th>":"") ?>                                        <?= ((in_array('contractor', $columns) == true)?"<th></th>":"") ?>                                        <?= ((in_array('contractor_freight', $columns) == true)?"<th style='width: 7%;'>".$this->helper_model->money($total_contractor_freight_amount)."</th>":"") ?>                                        <?= ((in_array('contractor_net_freight', $columns) == true)?"<th style='width: 7%;'>".$this->helper_model->money($total_contractor_net_freight_amount)."</th>":"") ?>                                        <?= ((in_array('contractor_freight_paid', $columns) == true)?"<th style='width: 5%;'>".$this->helper_model->money($total_paid_to_contractor)."</th>":"") ?>                                        <?= ((in_array('contractor_freight_remaining', $columns) == true)?"<th style='width: 5%;'>".$this->helper_model->money($total_contractor_remaining)."</th>":"") ?>                                        <?= ((in_array('contractor_commission', $columns) == true)?"<th style='width: 5%;'>".$this->helper_model->money($total_contractor_commission)."</th>":"") ?>                                        <?= ((in_array('customer', $columns) == true)?"<th style='width: 5%;'></th>":"") ?>                                        <?= ((in_array('customer_freight_unit', $columns) == true)?"<th style='width: 5%;'></th>":"") ?>                                        <?= ((in_array('total_freight_for_customer', $columns) == true)?"<th style='width: 5%;'>".$this->helper_model->money($grand_total_freight_for_customer)."</th>":"") ?>                                        <?= ((in_array('customer_net_freight', $columns) == true)?"<th style='width: 5%;'>".$this->helper_model->money($total_customer_freight_amount)."</th>":"") ?>                                        <?= ((in_array('contractor_service_charges', $columns) == true)?"<th style='width: 5%;'>".$this->helper_model->money($total_service_charges)."</th>":"") ?>                                        <?= ((in_array('billed', $columns) == true)?"<th style='width: 5%;'></th>":"") ?>                                    </tr>                                    </tfoot>                                </table>                            </div>                        </div>                    </div>                </div>            </div>        </div>    </div></div></body></html>