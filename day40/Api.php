<?php
   defined('BASEPATH') OR exit('No direct script access allowed');

   require APPPATH . 'controllers/Rest.php';
   class Api extends Rest {

       function __construct($config = 'rest') {
           parent::__construct($config);
           date_default_timezone_set('Asia/Jakarta');
           $this->load->database();

           if (isset($_SERVER['HTTP_ORIGIN'])) {
            header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
            header('Access-Control-Allow-Credentials: true');
            header('Access-Control-Max-Age: 86400');    // cache for 1 day
      	    }

      	    if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
      	        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
      	            header("Access-Control-Allow-Methods: GET, POST, PUT, OPTIONS");

      	        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
      	            header("Access-Control-Allow-Headers:        {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
      	        exit(0);
      	    }
       }
       function todolist_get() {
          $data = $this->db->order_by('id_todo','DESC')->get('listtodo')->result();
          if($data or $data == []){
            $this->response(array("data" => $data,'status'=>'success',), 200);
          }else{
            $this->response(array('status' => 'fail', 502));
          }

       }
       function todolistadd_post(){
         $insert = $this->db->insert('listtodo', $this->post());
         $id = $this->db->insert_id();
         if ($insert) {
             $response = array(
                 'data' => $this->post(),
                 'id' => $id,
                 'status' => 'success'
                 );
             $this->response($response, 200);
         } else {
             $this->response(array('status' => 'fail', 502));
         }
       }
       function todolistedit_put($id){
         $this->db->where('id_todo', $id);
         $update = $this->db->update('listtodo', $this->put());
         if ($update) {
             $response = array(
                 'data' => $this->put(),
                 'status' => 'success'
                 );
             $this->response($response, 200);
         } else {
             $this->response(array('status' => 'fail', 502));
         }
       }
       function todolistdel_delete($id){
         $this->db->where('id_todo', $id);
         $delete = $this->db->delete('listtodo');
         if ($delete) {
             $response = array('status' => 'success');
             $this->response($response, 200);
         } else {
             $this->response(array('status' => 'fail', 502));
         }
       }
   }
   ?>
