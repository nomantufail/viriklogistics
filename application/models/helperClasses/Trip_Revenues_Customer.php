<?php/** * Created by PhpStorm. * User: Zeeshan Tufail * Date: 10/27/14 * Time: 5:43 AM */class Trip_Revenue_Customer {    public $trip_id;    public $trip_date;    public $tanker_number;    public $total_freight;    public $total_freights;    public $net_freight;    public $net_freights;    public $customer_commission;    public $paid_to_customer;    public $total_paid_to_customer;    public $customer_remaining;    public $total_customer_remaining;    public $ci;    function __construct($trip_details){        $this->ci =& get_instance();        //assigning default values;        $this->total_freight = 0;        $this->net_freight = 0;        $this->paid = 0;        $this->total_customer_remaining = 0;        $this->total_paid_to_customer = 0;        $this->set_data($trip_details);    }    private function  set_data($trip_details){        $this->trip_id = $trip_details->trip_id;        //setting trip_date        $this->trip_date = $trip_details->entry_date;        //setting tanker_number        $this->tanker_number = $trip_details->tanker_number;        $this->total_freight = $trip_details->total_freight;        $this->net_freight = $trip_details->total_freight - ($trip_details->contractor_commission*$trip_details->total_freight/100);        $this->customer_commission = 100-$trip_details->contractor_commission;        $counter = 0;        foreach($trip_details->trip_related_details as $trip_detail){            $counter++;            $total_freights = $trip_detail->freight_unit * $trip_detail->product_quantity;            $paid_to_customer = 0;            $payments = $this->ci->accounts_model->customer_payments($trip_detail->trip_details_id, $trip_details->customerId);            foreach($payments as $payment){                $paid_to_customer = $paid_to_customer + $payment->amount;                $this->total_paid_to_customer += $payment->amount;            }            $customer_freights = ($total_freights * $this->customer_commission/100);            $customer_remaining = round(($customer_freights - $paid_to_customer) *1000)/1000;            $this->total_customer_remaining += $customer_remaining;            $class = ($counter == sizeof($trip_details->trip_related_details))?"":'multiple_entites';            $this->total_freight += $trip_detail->freight_unit * $trip_detail->product_quantity;            $this->total_freights = $this->total_freights."<div class=$class>".($trip_detail->freight_unit * $trip_detail->product_quantity)."</div>";            $this->paid_to_customer = $this->paid_to_customer."<div class=$class>".$paid_to_customer."</div>";            $this->net_freights = $this->net_freights."<div class=$class>".$this->customer_commission."% = ".$customer_freights."</div>";            $this->customer_remaining = $this->customer_remaining."<div class=$class>".$customer_remaining."</div>";        }        $payments = $this->ci->accounts_model->customer_payments($trip_details->trip_id, $trip_details->customerId);        foreach($payments as $payment){            $this->paid += $payment->amount;        }        $this->remaining = $this->net_freight - $this->paid;    }}