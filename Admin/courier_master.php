<?php 
  require('menu.inc.php');
  $sql = "SELECT * FROM `couriercompanies`";
  $res = mysqli_query($conn,$sql);
?>
<main id="main" class="main">
    <div class="pagetitle">
      <h1>Courier Companies</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard.php">Admin</a></li>
          <li class="breadcrumb-item">Courier Companies</li>          
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Courier Companies</h5>
              <p>Add, Remove and Edit Courier Company</p>

              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Courier Company ID</th>
                    <th scope="col">Courier Company Name</th>
                    <th scope="col">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                    $srno = 1;
                    while($rows = mysqli_fetch_assoc($res)){
                      echo "<tr>";
                  ?>
                  <td><?php echo $srno; ?></td>
                  <td><?php echo $rows['courier_company_id']; ?></td>
                  <td><?php echo $rows['courier_company_name']; ?></td>
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