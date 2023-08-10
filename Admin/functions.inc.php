<?php
    function pr($input){
        echo "<pre>";
        print_r($input);
        echo "</pre>";
    }
    function prx($input){
        echo "<pre>";
        print_r($input);
        echo "</pre>";
        die();
    }
    function redirect($url) {
        header('Location: '.$url);
        die();
    }
    function get_safe_value($connection,$input){ 
        if($input != ''){
            return mysqli_real_escape_string($connection,$input);
        }
    }