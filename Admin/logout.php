<?php
    session_start();
    unset($_SESSION['ADMIN_LOGIN']);
    unset($_SESSION['ADMIN_USERNAME']);
    unset($_SESSION['ROLE']);
    header('location:login.php');
    die();
?>