<?php
require('menu.inc.php');
$msg = '';
if(isset($_GET['id']) && $_GET['id'] != ''){    
    $cityid = get_safe_value($conn,$_GET['id']);
    $delete_sql = "DELETE FROM `cities` where city_id = '$cityid'";
    mysqli_query($conn,$delete_sql);    
}
if (isset($_POST['save_city_btn'])) {
    $city_name = get_safe_value($conn, $_POST['city_name']);
    $insert_sql = "INSERT INTO `cities` (`city`) VALUES ('$city_name')";
    
    if (mysqli_query($conn,$insert_sql) === TRUE) {
        $msg = '
            <div class="alert alert-success d-flex align-items-center alert-dismissible fade show" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                <div>New record created successfully</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>`';            
    }    
}

$sql = "SELECT * FROM `cities`";
$res =  mysqli_query($conn, $sql);

?>
<main id="main" class="main">
    <div class="pagetitle">
        <h1>Manage Cities</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="dashboard.php">Admin</a></li>
                <li class="breadcrumb-item"><a href="city_master.php">Cities</a></li>
                <li class="breadcrumb-item active">Manage Cities</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Manage Cities</h5>
                        <!-- Browser Default Validation -->
                        <form class="row g-3" method="post">
                            <div class="col-md-6">
                                <label for="cityName" class="form-label">City Name</label>
                                <input type="text" class="form-control" id="city_name" name="city_name" required>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-primary" type="submit" name="save_city_btn">Save</button>
                            </div>
                        </form>
                        <!-- End Browser Default Validation -->
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <?php echo $msg; ?>
            </div>
        </div>
    </section>
    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">All Cities</h5>
                        <!-- Table with stripped rows -->
                        <table class="table datatable">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">City ID</th>
                                    <th scope="col">City Name</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $srno = 1;
                                while ($rows = mysqli_fetch_assoc($res)) {
                                    echo "<tr>";
                                ?>
                                    <td><?php echo $srno; ?></td>
                                    <td><?php echo $rows['city_id']; ?></td>
                                    <td><?php echo $rows['city']; ?></td>
                                    <td><?php echo '<a href="?id='.$rows['city_id'].'">Delete</a>'; ?></td>

                                <?php
                                    $srno++;
                                    echo "</tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                        <!-- End Table with stripped rows -->
                    </div>
                </div>
            </div>
        </div>
    </section>
</main><!-- End #main -->
<?php require('footer.inc.php'); ?>