<?php
require('menu.inc.php');

if(isset($_GET['id']) && $_GET['id'] != ''){    
  $cityid = get_safe_value($conn,$_GET['id']);
  $delete_sql = "DELETE FROM `cities` where city_id = '$cityid'";
  mysqli_query($conn,$delete_sql);    
}


$sql = "SELECT * FROM `cities`";
$res =  mysqli_query($conn, $sql);
?>
<main id="main" class="main">
  <div class="pagetitle">
    <h1>Cities</h1>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Admin</a></li>
        <li class="breadcrumb-item">Cities</li>
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
                <h5 class="card-title">Cities</h5>
                <p>Add, Remove and Edit City</p>
              </div>
              <div class="col text-end">
                <a href="manage_cities.php" type="button" class="btn btn-sm btn-primary mt-3">+ Add City</a>
              </div>
            </div>

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
                  <td><?php echo "<a href='?id=" . $rows['city_id'] . "'>Delete</a>"; ?></td>
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