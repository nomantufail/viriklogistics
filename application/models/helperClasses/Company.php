<?php
/**
 * Created by PhpStorm.
 * User: Zeeshan Tufail
 * Date: 10/27/14
 * Time: 5:43 AM
 */


class Company{

    public $id;

    //this array will contain trip_related_details objects
    public $name;

    public $commission_1;

    public $wht;

    public $ci;

    function __construct($id, $name, $commission, $wht){
        //$this->ci =& get_instance();

        $this->id = $id;
        $this->name = $name;
        $this->commission_1 = $commission;
        $this->wht = $wht;

    }


}
