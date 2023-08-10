<?php
require('menu.inc.php');
$sql = "SELECT * FROM `retailcenter`";
$res = mysqli_query($conn, $sql);
?>
<main id="main" class="main">
    <div class="pagetitle">
        <h1>Retail Centers</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="dashboard.php">Admin</a></li>
                <li class="breadcrumb-item">Retail Centers</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <div class="row">

                            <div class="col">
                                <h5 class="card-title">Retail Centers</h5>
                                <p>Add, Remove and Edit Retail Center</p>
                            </div>
                            <div class="col text-end">
                                <a href="manage_categories.php" type="button" class="btn btn-sm btn-primary mt-3">+ Add Retail Center</a>
                            </div>
                        </div>

                        <!-- Table with stripped rows -->
                        <table class="table datatable">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Retail Center ID</th>
                                    <th scope="col">Retail Center Name</th>
                                    <th scope="col">City ID</th>
                                    <th scope="col">Agent ID</th>
                                    <th scope="col">Address</th>
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
                                    <td><?php echo $rows['center_id']; ?></td>
                                    <td><?php echo $rows['center_name']; ?></td>
                                    <td><?php echo $rows['city_id']; ?></td>
                                    <td><?php echo $rows['user_id']; ?></td>
                                    <td><?php echo $rows['center_address']; ?></td>
                                    <td><?php echo '<a href="#">Delete</a>'; ?></td>

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