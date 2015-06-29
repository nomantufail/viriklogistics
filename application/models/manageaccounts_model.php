<?php

class ManageAccounts_model extends CI_Model {

    public function __construct(){
        parent::__construct();
    }


    public function dr_cr_statuses(&$accounts)
    {
        $trip_detail_ids = property_to_array('trip_detail_id', $accounts);

        $this->db->select('*');
        $this->db->where_in('trip_detail_id',$trip_detail_ids);
        $result = $this->db->get('dr_cr_status_for_manage_accounts_view')->result();
        return new Dr_Cr_Status_Manager($result);

    }

    public function search_white_oil($keys, $limit, $start){
        //applying keys....

        /*
         * ------------------------------
         * SEARCH BY TRIPS BILLING
         * ------------------------------
         * */
//        if($keys['bill_status'] == '1')
//        {
//            $this->db->select('trips_details.id');
//            $this->db->from('trips_details');
//            $this->db->join('bills','bills.id = trips_details.bill_id','left');
//            $this->db->where('trips_details.bill_id !=',0);
//            if($keys['billed_from'] != '')
//            {
//                $from = $keys['billed_from'];
//                $this->db->where('bills.billed_date_time >=',$from);
//            }
//            if($keys['billed_to'] != '')
//            {
//                $to = $keys['billed_to'];
//                $to = Carbon::createFromFormat('Y-m-d',$to)->addDay();
//                $to = $to->toDateString();
//                $this->db->where('bills.billed_date_time <', $to);
//            }
//            $raw_billed_details_ids = $this->db->get()->result();
//            $billed_trips_ids = array(0,);
//            foreach($raw_billed_details_ids as $record)
//            {
//                array_push($billed_trips_ids, $record->id);
//            }
//        }
//        /*--------------------------------------------*/
//
//        /*
//         * -------------------------------
//         *  Search By Account Titles
//         * -------------------------------
//         */
//        if($keys['account_title'] != '')
//        {
//            $this->db->select('trips_details.id as detail_id');
//            $this->db->from('voucher_entry');
//            $this->db->join('voucher_journal', 'voucher_journal.id = voucher_entry.journal_voucher_id','left');
//            $this->db->join('trip_detail_voucher_relation', 'trip_detail_voucher_relation.voucher_id = voucher_entry.journal_voucher_id','left');
//            $this->db->join('trips_details','trips_details.id = trip_detail_voucher_relation.trip_detail_id','left');
//            $this->db->where(array(
//                'voucher_journal.active'=>1,
//                'voucher_journal.transaction_column !='=>'',
//                'voucher_entry.account_title_id'=>$keys['account_title'],
//                'voucher_journal.person_tid'=>"users.1",
//                'trip_detail_voucher_relation.trip_detail_id !='=>0,
//            ));
//            if($keys['dr_cr'] != '')
//            {
//                if($keys['dr_cr'] == 1 || $keys['dr_cr'] == 2){
//                    $this->db->where('voucher_entry.dr_cr',1);
//                }else if($keys['dr_cr'] == 0 || $keys['dr_cr'] == 3){
//                    $this->db->where('voucher_entry.dr_cr',0);
//                }
//            }
//            $raw_detail_ids = $this->db->get()->result();
//            $detail_ids = array(0,);
//            foreach($raw_detail_ids as $record)
//            {
//                //var_dump($record);
//                array_push($detail_ids, $record->detail_id);
//            }
//
//        }
//
//        /*-------------------------------*/
//
//        /*
//         * ------------------------------
//         * OPEN AND CLOSED TRIPS
//         * -----------------------------
//         * */
//        if($keys['trip_status'] != '')
//        {
//            $this->db->select('trip_id');
//            $this->db->distinct();
//            $this->db->where('trips_details.stn_number','');
//            $result = $this->db->get('trips_details')->result();
//            $open_trips_ids = array();
//            foreach($result as $record)
//            {
//                array_push($open_trips_ids, $record->trip_id);
//            }
//        }
//        /*----------------------------------------*/
//
//        if($keys['bill_status'] != '')
//        {
//            if($keys['bill_status'] == 1)
//            {
//                $this->db->where_in('trips_details.id',$billed_trips_ids);
//            }
//            if($keys['bill_status'] == 0)
//            {
//                $this->db->where('trips_details.bill_id',0);
//            }
//        }
//        if($keys['trip_status'] != '')
//        {
//            if($keys['trip_status'] == 2){
//                $this->db->where_not_in('trips.id',$open_trips_ids);
//            }
//            if($keys['trip_status'] == 1)
//            {
//                $this->db->where_in('trips.id',$open_trips_ids);
//            }
//        }
//        if($keys['account_title'] != '')
//        {
//            if($keys['dr_cr'] == 1 || $keys['dr_cr'] == 0)
//            {
//                $this->db->where_in('trips_details.id',$detail_ids);
//            }else if($keys['dr_cr'] == 2 || $keys['dr_cr'] == 3){
//
//                $this->db->where_not_in('trips_details.id',$detail_ids);
//            }
//        }
//
//        if($keys['from'] != ''){
//            $this->db->where('trips.entryDate >=',$keys['from']);
//        }
//        if($keys['to'] != ''){
//            $this->db->where('trips.entryDate <=',$keys['to']);
//        }
//        if($keys['trip_id'] != ''){
//            $this->db->where('trips.id',$keys['trip_id']);
//        }
//        if($keys['trip_type'] != '' ){
//            $this->db->where_in('trips.type', $keys['trip_type']);
//        }
//
//        if($keys['trip_master_type'] != '' ){
//            if($keys['trip_master_type'] == 'primary'){
//                $where = "(trips.type = 2 OR trips.type = 4)";
//                $this->db->where($where);
//            }else if($keys['trip_master_type'] == 'secondary'){
//                $where = "(trips.type = 1 OR trips.type = 3)";
//                $this->db->where($where);
//            }else if($keys['trip_master_type'] == 'secondary_local'){
//                $where = "(trips.type = 6)";
//                $this->db->where($where);
//            }
//        }
//        if($keys['trip_master_types'] != '' ){
//            $trip_types = array();
//            foreach($keys['trip_master_types'] as $type)
//            {
//                switch($type)
//                {
//                    case "primary":
//                        array_push($trip_types,1);
//                        array_push($trip_types,2);
//                        array_push($trip_types,4);
//                        array_push($trip_types,5);
//                        break;
//                    case "secondary":
//                        array_push($trip_types,3);
//                        break;
//                    case "secondary_local":
//                        array_push($trip_types,6);
//                        break;
//                }
//            }
//            $this->db->where_in('trips.type',$trip_types);
//        }
//
//        if($keys['tanker'] != ''){
//            $this->db->where_in('trips.tanker_id',$keys['tanker']);
//        }
//        if($keys['entryDate'] != ''){
//            $this->db->where('trips.entryDate',$keys['entryDate']);
//        }
//        if($keys['product'] != ''){
//            $this->db->where_in('trips_details.product',$keys['product']);
//        }
//        if($keys['product_type'] != ''){
//            $this->db->where('products.type',$keys['product_type']);
//        }
//        if($keys['trips_routes'] != '')
//        {
//            $where = "(";
//            foreach($keys['trips_routes'] as $route)
//            {
//                $route_parts = explode('_',$route);
//                $where.="(trips_details.source = ".$route_parts[0]." AND trips_details.destination = ".$route_parts[1].") OR ";
//            }
//            $where.=")";
//            $where_parts = explode(') OR )',$where);
//            $where = $where_parts[0];
//            $where.="))";
//            $this->db->where($where);
//        }
//        else
//        {
//            if($keys['source'] != ''){
//                $this->db->where_in('trips_details.source',$keys['source']);
//            }
//            if($keys['destination'] != ''){
//                $this->db->where_in('trips_details.destination',$keys['destination']);
//            }
//        }
//        if($keys['company'] != '' ){
//            $this->db->where_in('trips.company_id', $keys['company']);
//        }
//        if($keys['cmp_freight_unit'] != ''){
//            $this->db->where('trips_details.company_freight_unit',$keys['cmp_freight_unit']);
//        }
//        if($keys['cst_freight_unit'] != ''){
//            $this->db->where('trips_details.freight_unit',$keys['cst_freight_unit']);
//        }
//        if($keys['wht'] != ''){
//            $this->db->where('trips.company_commission_2',$keys['wht']);
//        }
//        if($keys['company_commission'] != ''){
//            $this->db->where('trips.company_commission_1',$keys['company_commission']);
//        }
//        if($keys['company_commission_status'] == 'unpaid'){
//            $this->db->where('company_accounts.amount',null);
//        }
//        if($keys['company_commission_status'] == 'paid' ){
//            $this->db->where('company_accounts.amount !=', '');
//        }
//        if($keys['contractor'] != '' ){
//            $this->db->where_in('trips.contractor_id', $keys['contractor']);
//        }
//        if($keys['contractor_freight_status'] == 'unpaid' ){
//            $this->db->where('contractor_accounts.amount', null);
//        }
//        if($keys['contractor_freight_status'] == 'paid' ){
//            $this->db->where('contractor_accounts.amount !=', '');
//        }
//        if($keys['contractor_commission'] != '' ){
//            $this->db->where('trips.contractor_commission', $keys['contractor_commission']);
//        }
//        if($keys['contractor_commission_status'] == 'unpaid' ){
//            $this->db->where('customer_accounts.amount', null);
//        }
//        if($keys['contractor_commission_status'] == 'paid' ){
//            $this->db->where('customer_accounts.amount !=', '');
//        }
//        if($keys['customer'] != '' ){
//            $this->db->where_in('trips.customer_id', $keys['customer']);
//        }
//        if($keys['customer_freight_status'] == 'unpaid' ){
//            $this->db->where('customer_accounts.amount', null);
//        }
//        if($keys['customer_freight_status'] == 'paid' ){
//            $this->db->where('customer_accounts.amount !=', '');
//        }
//        if($keys['cst_freight_unit'] != ''){
//            $this->db->where('trips_details.freight_unit',$keys['cst_freight_unit']);
//        }
//        if($keys['sort'] == false)
//        {
//            $this->db->limit($limit, $start);
//        }
        ///////////////////////////////////////////////////////

        $this->db->select('*');
        $accounts = $this->db->get('manage_accounts_white_oil')->result();

        return $accounts;
    }

    public function count_searched_white_oil_accounts($keys)
    {
        $this->db->select("COUNT(trip_id) as num_rows");
        $result = $this->db->get("manage_accounts_white_oil")->result();
        return $result[0]->num_rows;
    }

    public function count_searched_trips_accounts($keys)
    {
        //applying keys....

        /*
         * ------------------------------
         * SEARCH BY TRIPS BILLING
         * ------------------------------
         * */
        if($keys['bill_status'] == '1')
        {
            $this->db->select('trips_details.id');
            $this->db->from('trips_details');
            $this->db->join('bills','bills.id = trips_details.bill_id','left');
            $this->db->where('trips_details.bill_id !=',0);
            if($keys['billed_from'] != '')
            {
                $from = $keys['billed_from'];
                $this->db->where('bills.billed_date_time >=',$from);
            }
            if($keys['billed_to'] != '')
            {
                $to = $keys['billed_to'];
                $to = Carbon::createFromFormat('Y-m-d',$to)->addDay();
                $to = $to->toDateString();
                $this->db->where('bills.billed_date_time <', $to);
            }
            $raw_billed_details_ids = $this->db->get()->result();
            $billed_trips_ids = array(0,);
            foreach($raw_billed_details_ids as $record)
            {
                array_push($billed_trips_ids, $record->id);
            }
        }
        /*--------------------------------------------*/

        /*
         * -------------------------------
         *  Search By Account Titles
         * -------------------------------
         */
        if($keys['account_title'] != '')
        {
            $this->db->select('trips_details.id as detail_id');
            $this->db->from('voucher_entry');
            $this->db->join('voucher_journal', 'voucher_journal.id = voucher_entry.journal_voucher_id','left');
            $this->db->join('trip_detail_voucher_relation', 'trip_detail_voucher_relation.voucher_id = voucher_entry.journal_voucher_id','left');
            $this->db->join('trips_details','trips_details.id = trip_detail_voucher_relation.trip_detail_id','left');
            $this->db->where(array(
                'voucher_journal.active'=>1,
                'voucher_journal.transaction_column !='=>'',
                'voucher_entry.account_title_id'=>$keys['account_title'],
                'voucher_journal.person_tid'=>"users.1",
                'trip_detail_voucher_relation.trip_detail_id !='=>0,
            ));
            if($keys['dr_cr'] != '')
            {
                if($keys['dr_cr'] == 1 || $keys['dr_cr'] == 2){
                    $this->db->where('voucher_entry.dr_cr',1);
                }else if($keys['dr_cr'] == 0 || $keys['dr_cr'] == 3){
                    $this->db->where('voucher_entry.dr_cr',0);
                }
            }
            $raw_detail_ids = $this->db->get()->result();
            $detail_ids = array(0,);
            foreach($raw_detail_ids as $record)
            {
                //var_dump($record);
                array_push($detail_ids, $record->detail_id);
            }

        }

        /*-------------------------------*/

        /*
         * ------------------------------
         * OPEN AND CLOSED TRIPS
         * -----------------------------
         * */
        if($keys['trip_status'] != '')
        {
            $this->db->select('trip_id');
            $this->db->distinct();
            $this->db->where('trips_details.stn_number','');
            $result = $this->db->get('trips_details')->result();
            $open_trips_ids = array();
            foreach($result as $record)
            {
                array_push($open_trips_ids, $record->trip_id);
            }
        }
        /*----------------------------------------*/

        if($keys['bill_status'] != '')
        {
            if($keys['bill_status'] == 1)
            {
                $this->db->where_in('trips_details.id',$billed_trips_ids);
            }
            if($keys['bill_status'] == 0)
            {
                $this->db->where('trips_details.bill_id',0);
            }
        }
        if($keys['trip_status'] != '')
        {
            if($keys['trip_status'] == 2){
                $this->db->where_not_in('trips.id',$open_trips_ids);
            }
            if($keys['trip_status'] == 1)
            {
                $this->db->where_in('trips.id',$open_trips_ids);
            }
        }
        if($keys['account_title'] != '')
        {
            if($keys['dr_cr'] == 1 || $keys['dr_cr'] == 0)
            {
                $this->db->where_in('trips_details.id',$detail_ids);
            }else if($keys['dr_cr'] == 2 || $keys['dr_cr'] == 3){

                $this->db->where_not_in('trips_details.id',$detail_ids);
            }
        }
        if($keys['from'] != ''){
            $this->db->where('trips.entryDate >=',$keys['from']);
        }
        if($keys['to'] != ''){
            $this->db->where('trips.entryDate <=',$keys['to']);
        }
        if($keys['trip_id'] != ''){
            $this->db->where('trips.id',$keys['trip_id']);
        }
        if($keys['trip_type'] != '' ){
            $this->db->where_in('trips.type', $keys['trip_type']);
        }

        if($keys['trip_master_type'] != '' ){
            if($keys['trip_master_type'] == 'primary'){
                $where = "(trips.type = 2 OR trips.type = 4)";
                $this->db->where($where);
            }else if($keys['trip_master_type'] == 'secondary'){
                $where = "(trips.type = 1 OR trips.type = 3)";
                $this->db->where($where);
            }else if($keys['trip_master_type'] == 'secondary_local'){
                $where = "(trips.type = 6)";
                $this->db->where($where);
            }
        }

        if($keys['trip_master_types'] != '' ){
            $trip_types = array();
            foreach($keys['trip_master_types'] as $type)
            {
                switch($type)
                {
                    case "primary":
                        array_push($trip_types,1);
                        array_push($trip_types,2);
                        array_push($trip_types,4);
                        array_push($trip_types,5);
                        break;
                    case "secondary":
                        array_push($trip_types,3);
                        break;
                    case "secondary_local":
                        array_push($trip_types,6);
                        break;
                }
            }
            $this->db->where_in('trips.type',$trip_types);
        }

        if($keys['tanker'] != ''){
            $this->db->where_in('trips.tanker_id',$keys['tanker']);
        }
        if($keys['entryDate'] != ''){
            $this->db->where('trips.entryDate',$keys['entryDate']);
        }
        if($keys['product'] != ''){
            $this->db->where_in('trips_details.product',$keys['product']);
        }
        if($keys['product_type'] != ''){
            $this->db->where('products.type',$keys['product_type']);
        }
        if($keys['trips_routes'] != '')
        {
            $where = "(";
            foreach($keys['trips_routes'] as $route)
            {
                $route_parts = explode('_',$route);
                $where.="(trips_details.source = ".$route_parts[0]." AND trips_details.destination = ".$route_parts[1].") OR ";
            }
            $where.=")";
            $where_parts = explode(') OR )',$where);
            $where = $where_parts[0];
            $where.="))";
            $this->db->where($where);
        }
        else
        {
            if($keys['source'] != ''){
                $this->db->where_in('trips_details.source',$keys['source']);
            }
            if($keys['destination'] != ''){
                $this->db->where_in('trips_details.destination',$keys['destination']);
            }
        }
        if($keys['company'] != '' ){
            $this->db->where_in('trips.company_id', $keys['company']);
        }
        if($keys['cmp_freight_unit'] != ''){
            $this->db->where('trips_details.company_freight_unit',$keys['cmp_freight_unit']);
        }
        if($keys['cst_freight_unit'] != ''){
            $this->db->where('trips_details.freight_unit',$keys['cst_freight_unit']);
        }
        if($keys['wht'] != ''){
            $this->db->where('trips.company_commission_2',$keys['wht']);
        }
        if($keys['company_commission'] != ''){
            $this->db->where('trips.company_commission_1',$keys['company_commission']);
        }
        if($keys['company_commission_status'] == 'unpaid'){
            $this->db->where('company_accounts.amount',null);
        }
        if($keys['company_commission_status'] == 'paid' ){
            $this->db->where('company_accounts.amount !=', '');
        }
        if($keys['contractor'] != '' ){
            $this->db->where_in('trips.contractor_id', $keys['contractor']);
        }
        if($keys['contractor_freight_status'] == 'unpaid' ){
            $this->db->where('contractor_accounts.amount', null);
        }
        if($keys['contractor_freight_status'] == 'paid' ){
            $this->db->where('contractor_accounts.amount !=', '');
        }
        if($keys['contractor_commission'] != '' ){
            $this->db->where('trips.contractor_commission', $keys['contractor_commission']);
        }
        if($keys['contractor_commission_status'] == 'unpaid' ){
            $this->db->where('customer_accounts.amount', null);
        }
        if($keys['contractor_commission_status'] == 'paid' ){
            $this->db->where('customer_accounts.amount !=', '');
        }
        if($keys['customer'] != '' ){
            $this->db->where_in('trips.customer_id', $keys['customer']);
        }
        if($keys['customer_freight_status'] == 'unpaid' ){
            $this->db->where('customer_accounts.amount', null);
        }
        if($keys['customer_freight_status'] == 'paid' ){
            $this->db->where('customer_accounts.amount !=', '');
        }
        if($keys['cst_freight_unit'] != ''){
            $this->db->where('trips_details.freight_unit',$keys['cst_freight_unit']);
        }
        ///////////////////////////////////////////////////////

        $this->db->select('trips_details.id as detail_id');
        //$this->db->limit($limit, $start);
        $this->db->distinct();
        $this->db->from('trips_details');
        $this->db->where('trips.active',1);
        //join starts..
        $this->db->join('trips', 'trips.id = trips_details.trip_id','left');

        //joining customers, contractors and companies
        $this->db->join('customers', 'customers.id = trips.customer_id','left');
        $this->db->join('carriage_contractors', 'carriage_contractors.id = trips.contractor_id','left');

        //joining cites and routes etc..
        $this->db->join('cities as source_cities', 'source_cities.id = trips_details.source','left');
        $this->db->join('cities as destination_cities', 'destination_cities.id = trips_details.destination','left');
        $this->db->join('products', 'products.id = trips_details.product','left');
        $this->db->order_by('trips.id','desc');

        /*--**********************joining ends*********************--*/

        $trips = $this->db->get()->result();

        return sizeof($trips);
    }


    public function fetch_trips_ids_by_trips_details_ids($details_ids)
    {
        $this->db->select('trips.id');
        $this->db->from("trips");
        $this->db->distinct();
        $this->db->join('trips_details','trips_details.trip_id = trips.id', 'left');
        $this->db->where('trips.active',1);
        $this->db->where_in('trips_details.id',$details_ids);
        $result = $this->db->get()->result();
        $trips_ids[0] = 0;
        foreach($result as $record){
            array_push($trips_ids, $record->id);
        }
        return $trips_ids;

    }

    public function save_voucher($account_holder = "users")
    {
        $trips_details_ids = $this->input->post('trips_details_ids');
        $trips_details_ids_array = explode('_',$trips_details_ids);
        $key = array_search('0', $trips_details_ids_array);
        unset($trips_details_ids_array[$key]);
        if(sizeof($trips_details_ids_array) == 0)
        {
            return false;
        }


        //now its time to insert this voucher in database...
        $journal_voucher_data = array(
            'voucher_date' =>$this->input->post('voucher_date'),
            'detail' => $this->input->post('voucher_details'),
            'person_tid' => $account_holder.".1",
            'transaction_column'=>$this->input->post('transaction_column'),
            'manage_account_type'=>(isset($_POST['manage_account_type']))?$_POST['manage_account_type']:'',
            'tanker_id'=>(isset($_POST['tankers']))?$_POST['tankers']:0,
        );
        $result = $this->db->insert('voucher_journal', $journal_voucher_data);
        $inserted_voucher_id = $this->db->insert_id();
        if($result == true){
            $voucher_entries = array();
            $entries_counter = $this->input->post('pannel_count');
            for($counter = 1; $counter < $entries_counter; $counter++){
                $entry['account_title_id'] = $this->input->post('tr_title_'.$counter);
                $entry['description'] = $this->input->post('description_'.$counter);
                $related_other_agent = ($this->input->post('agent_type_'.$counter) == 'other_agents')?$this->input->post('agent_id_'.$counter):0;
                $related_customer = ($this->input->post('agent_type_'.$counter) == 'customers')?$this->input->post('agent_id_'.$counter):0;
                $related_contractor = ($this->input->post('agent_type_'.$counter) == 'carriage_contractors')?$this->input->post('agent_id_'.$counter):0;
                $related_company = ($this->input->post('agent_type_'.$counter) == 'companies')?$this->input->post('agent_id_'.$counter):0;

                $entry['related_company'] = $related_company;
                $entry['related_other_agent'] = $related_other_agent;
                $entry['related_customer'] = $related_customer;
                $entry['related_contractor'] = $related_contractor;
                $entry['debit_amount'] = ($this->input->post('payment_type_'.$counter) == 0)?0.00:$this->input->post('amount_'.$counter);
                $entry['credit_amount'] = ($this->input->post('payment_type_'.$counter) == 1)?0.00:$this->input->post('amount_'.$counter);
                $entry['dr_cr'] = $this->input->post('payment_type_'.$counter);
                $entry['journal_voucher_id'] = $inserted_voucher_id;

                array_unshift($voucher_entries, $entry);
            }
            if($this->db->insert_batch('voucher_entry', $voucher_entries) == true){
                $trip_ids_voucher_ids = array();
                foreach($trips_details_ids_array as $id){
                    $record = array(
                        'trip_detail_id'=>$id,
                        'voucher_id'=>$inserted_voucher_id,
                    );
                    array_push($trip_ids_voucher_ids, $record);
                }
                $result = $this->db->insert_batch('trip_detail_voucher_relation', $trip_ids_voucher_ids);
                if($result == true){
                    return true;
                }
            }
        }
        return false;

    }

    public function save_custom_voucher($account_holder = "users")
    {
       // $trips_details_ids = $this->input->post('trips_details_ids');

        //now its time to insert this voucher in database...
        $journal_voucher_data = array(
            'voucher_date' =>$this->input->post('voucher_date'),
            'detail' => $this->input->post('voucher_details'),
            'person_tid' => $account_holder.".1",
            'tanker_id'=>$this->input->post('tankers'),
            'trip_id'=>$this->input->post('trip_id'),
        );
        $result = $this->db->insert('voucher_journal', $journal_voucher_data);
        $inserted_voucher_id = $this->db->insert_id();
        if($result == true){
            $voucher_entries = array();
            $entries_counter = $this->input->post('pannel_count');
            for($counter = 1; $counter < $entries_counter; $counter++){
                $entry['account_title_id'] = $this->input->post('tr_title_'.$counter);
                $entry['description'] = $this->input->post('description_'.$counter);
                $related_other_agent = ($this->input->post('agent_type_'.$counter) == 'other_agents')?$this->input->post('agent_id_'.$counter):0;
                $related_customer = ($this->input->post('agent_type_'.$counter) == 'customers')?$this->input->post('agent_id_'.$counter):0;
                $related_contractor = ($this->input->post('agent_type_'.$counter) == 'carriage_contractors')?$this->input->post('agent_id_'.$counter):0;
                $related_company = ($this->input->post('agent_type_'.$counter) == 'companies')?$this->input->post('agent_id_'.$counter):0;

                $entry['related_company'] = $related_company;
                $entry['related_other_agent'] = $related_other_agent;
                $entry['related_customer'] = $related_customer;
                $entry['related_contractor'] = $related_contractor;
                $entry['debit_amount'] = ($this->input->post('payment_type_'.$counter) == 0)?0.00:$this->input->post('amount_'.$counter);
                $entry['credit_amount'] = ($this->input->post('payment_type_'.$counter) == 1)?0.00:$this->input->post('amount_'.$counter);
                $entry['dr_cr'] = $this->input->post('payment_type_'.$counter);
                $entry['journal_voucher_id'] = $inserted_voucher_id;

                array_unshift($voucher_entries, $entry);
            }
            if($this->db->insert_batch('voucher_entry', $voucher_entries) == true){
                return true;
            }
        }
        return false;

    }

    public function bill_trips($detail_ids)
    {
        $this->db->trans_start();
        /*$now = Carbon::now();
        $now = $now->addHours(4);*/
        $bill = array(
            'billed_date_time'=>$this->input->post('bill_date'),
        );
        $this->db->insert('bills',$bill);
        $bill_id = $this->db->insert_id();
        $detail_data = array(
            'bill_id'=>$bill_id,
        );
        $this->db->where_in('trips_details.id',$detail_ids);
        $this->db->update('trips_details',$detail_data);
        $this->db->trans_complete();
        if($this->db->trans_status() == true)
        {
            return true;
        }
        return false;
    }

    public function un_bill_trips($detail_ids)
    {
        $data = array(
            'bill_id'=>0,
        );
        $this->db->where_in('trips_details.id',$detail_ids);
        if($this->db->update('trips_details',$data) == true)
        {
            return true;
        }
        return false;
    }

    public function apply_shortage_details($final_trips)
    {
        $shortage_voucher_ids = array();
        foreach($final_trips as $trip)
        {
            foreach($trip->trip_related_details as $detail)
            {
                if($detail->shortage_voucher_decnd != 0)
                {
                    array_push($shortage_voucher_ids, $detail->shortage_voucher_decnd);
                }
                else if($detail->shortage_voucher_dest != 0)
                {
                    array_push($shortage_voucher_ids, $detail->shortage_voucher_dest);
                }
            }
        }
        /* fetching shortage details by given voucher ids */
        $shortage_details = $this->accounts_model->fetch_shortage_details_by_given_voucher_ids($shortage_voucher_ids);

        /**** Setting Shortage Details ****/
        foreach($final_trips as &$trip)
        {
            foreach($trip->trip_related_details as &$detail)
            {
                foreach($shortage_details as $shortage_detail)
                {
                    if($detail->product_detail_id == $shortage_detail->trip_product_detail_id)
                    {
                        $detail->shortage_detail = $shortage_detail->shortage_detail;
                        $detail->shortage_rate = $shortage_detail->shortage_rate;
                        $detail->shortage_quantity = $shortage_detail->shortage_quantity;
                    }
                }
            }
        }

        return $final_trips;
    }


}
