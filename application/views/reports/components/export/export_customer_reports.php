<?php$file = exporting_file_name("customer_reports").".xls";header("Content-type: application/vnd.ms-excel");header("Content-Disposition: attachment; filename=$file");?><html><head>    <title>Customer Reports</title>    <link href="<?= css()?>bootstrap.min.css" rel="stylesheet"></head><body><style>    table{        font-size: 12px;    }</style><div id="page-wrapper" style="min-height: 700px;">    <div class="container-fluid">        <table class="table">            <tr style="color: green;">                <td colspan=>                    <b>Date:</b> <?= $from_date ?> / <?= $to_date ?>                </td>                <td colspan="3">                    <b>Customer:</b> <?= ucwords($customer) ?>                </td>                <td colspan=>                    <b>Contractor:</b> <?= ucwords($contractor) ?>                </td>                <td colspan=>                    <b>Tanker:</b> <?= $tanker ?>                </td>            </tr>        </table>        <?php        if(sizeof($reports) < 1){            echo "<span style='color: red;margin-left: 5px;'>No results found</span>";        }else{            ?>                <table class="table table-bordered report_table sortable" border="1">                    <thead>                    <tr>                        <?= ((in_array('date', $columns) == true)?"<th style='text-align:left;'>Date</th>":"") ?>                        <?= ((in_array('tanker', $columns) == true)?"<th style='text-align:left;'>Tanker</th>":"") ?>                        <?= ((in_array('route', $columns) == true)?"<th style='text-align: center;'>Route</th>":"") ?>                        <?= ((in_array('product', $columns) == true)?"<th style='text-align:left;'>Product</th>":"") ?>                        <?= ((in_array('quantity', $columns) == true)?"<th style='text-align:left;'>Quantity</th>":"") ?>                        <?= ((in_array('stn', $columns) == true)?"<th style='text-align:left;'>STN</th>":"") ?>                        <?= ((in_array('freight_unit', $columns) == true)?"<th style='text-align:left;'>Freight/Unit</th>":"") ?>                        <?= ((in_array('total_freight', $columns) == true)?"<th style='text-align:left;'>Total Freight</th>":"") ?>                        <?= ((in_array('commission', $columns) == true)?"<th style='text-align:left;'>Commission</th>":"") ?>                        <?= ((in_array('net_freight', $columns) == true)?"<th style='text-align:left;'>Net Freight</th>":"") ?>                        <?php /*((in_array('paid', $columns) == true)?"<th style='text-align:left;'>Paid</th>":"")*/ ?>                        <?php /*((in_array('remaining', $columns) == true)?"<th style='text-align:left;'>Remaining</th>":"")*/ ?>                    </tr>                    </thead>                    <tbody>                    <?php                    $total_freight = 0;                    $total_commission = 0;                    $total_paid = 0;                    foreach($reports as $report){                        $total_freight = $total_freight+$report->total_freight;                        $total_commission = $total_commission + ($report->total_contractor_freight);                        $total_paid+=$report->total_paid_to_customer;                        $trip_date = $this->carbon->createFromFormat('Y-m-d',$report->trip_date)->toFormattedDateString();                        ?>                        <tr style="border-bottom: 2px solid darkgray;">                            <?= ((in_array('date', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$trip_date</td>":"") ?>                            <?= ((in_array('tanker', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->tanker_number</td>":"") ?>                            <?= ((in_array('route', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->route</td>":"") ?>                            <?= ((in_array('product', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->product</td>":"") ?>                            <?= ((in_array('quantity', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->product_quantity</td>":"") ?>                            <?= ((in_array('stn', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->stn</td>":"") ?>                            <?= ((in_array('freight_unit', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->freight_unit</td>":"") ?>                            <?= ((in_array('total_freight', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->total_freight</td>":"") ?>                            <?= ((in_array('commission', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->contractor_freights</td>":"") ?>                            <?= ((in_array('net_freight', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->customer_freights</td>":"") ?>                            <?php /*((in_array('paid', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->paid_to_customer</td>":"")*/ ?>                            <?php /*((in_array('remaining', $columns) == true)?"<td style='vertical-align: middle; text-align:left; text-align: left;'>$report->customer_remaining</td>":"")*/ ?>                        </tr>                    <?php                    }                    ?>                    </tbody>                    <tfoot>                    <tr>                        <?php                        $net_freight = $this->helper_model->money(($total_freight-$total_commission));                        $total_remaining = $this->helper_model->money(($total_freight - $total_commission - $total_paid));                        $total_freight = $this->helper_model->money($total_freight);                        $total_commission = $this->helper_model->money($total_commission);                        $total_paid = $this->helper_model->money($total_paid);                        ?>                        <?= ((in_array('date', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'>Totals</th>":"") ?>                        <?= ((in_array('tanker', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'></th>":"") ?>                        <?= ((in_array('route', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'></th>":"") ?>                        <?= ((in_array('product', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'></th>":"") ?>                        <?= ((in_array('quantity', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'></th>":"") ?>                        <?= ((in_array('stn', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'></th>":"") ?>                        <?= ((in_array('freight_unit', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'></th>":"") ?>                        <?= ((in_array('total_freight', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'>$total_freight</th>":"") ?>                        <?= ((in_array('commission', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'>$total_commission</th>":"") ?>                        <?= ((in_array('net_freight', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'>$net_freight</th>":"") ?>                        <?php /*((in_array('paid', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'>$total_paid</th>":"")*/ ?>                        <?php /*((in_array('remaining', $columns) == true)?"<th style='vertical-align: middle; text-align:left;'>$total_remaining</th>":"")*/ ?>                    </tr>                    </tfoot>                </table>        <?php        }        ?>        <script src="<?= js()?>sorttable.js"></script>    </div></div><script src="<?= js()?>sorttable.js"></script></body></html>