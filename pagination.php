<?php
include_once('include.php');
$perPage = '';
$page = '';
$output = '';

if (isset($_POST["page"])) {
    $page = $_POST["page"];
} else {
    $page = 1;
}
if (isset($_POST['limit'])) {
    $perPage = $_POST['limit'];
    $text = 'Rows: ' . $_POST["limit"];
} else {
    $perPage = 5;
    $text = 'Number of rows';
}
$sql = "select * from course";
$records = mysqli_query($conn, $sql);
$totalRecords = mysqli_num_rows($records);
$totalPage = ceil($totalRecords / $perPage);
$rowLimit = ceil($totalRecords / 5) * 5;


if (isset($_POST["query"])) {
    $sql = "select c.course_name,c.course_description,
    d.department_name, p.professor_name
    from course c
    join department d on c.department_id=d.department_id
    join professor p on c.professor_id=p.professor_id
    where replace(c.course_name,' ', '') like '%" . str_replace(" ", "%", $_POST["query"]) . "%'
    or replace(c.course_description,' ', '') like '%" . str_replace(" ", "%", $_POST["query"]) . "%'
    or replace(d.department_name,' ', '') like '%" . str_replace(" ", "%", $_POST["query"]) . "%'
    or replace(p.professor_name,' ', '') like '%" . str_replace(" ", "%", $_POST["query"]) . "%'
    order by c.course_id asc";
    $records = mysqli_query($conn, $sql);
    $totalRecords = mysqli_num_rows($records);
    $totalPage = ceil($totalRecords / $perPage);
    $rowLimit = ceil($totalRecords / 5) * 5;
} else {
    $sql = "select c.course_name,c.course_description,
    d.department_name, p.professor_name
    from course c
    join department d on c.department_id=d.department_id
    join professor p on c.professor_id=p.professor_id
    order by c.course_id asc";
}
if ($page < 1) {
    $page++;
} elseif ($page > $totalPage) {
    $page--;
}
$start = ($page - 1) * $perPage; // To select range from database
$sql .= " limit $start, $perPage";
$result = mysqli_query($conn, $sql);
$output .= "
<div class='dropdown'>
        <button class='dropbtn'>$text</button>
        <div class='dropdown-content'>";
for ($j = 5; $j <= $rowLimit; $j += 5) {
    $output .= "
        <a class='per_page' id='$j'>$j</a>";
}
$output .= " </div> </div> 
<table class='content-table'>
        <thread> 
        <tr>
          <th>Course Name</th>
          <th>Course Description</th>
          <th>Department Name</th>
          <th>Professor Name</th>
        </tr>
        </thread>
        <tbody> 
";
if ($totalRecords > 0) {
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_array($result)) {

            $output .= '
     <tr>
        <td>' . $row['course_name'] . '</td>
        <td>' . $row['course_description'] . '</td>
        <td>' . $row['department_name'] . '</td>
        <td>' . $row['professor_name'] . '</td>
     </tr>
    ';
        }
        $output .= '</tbody></table>';
        $output .= '<div class="pagination">';
        $new = $page - 1;
        $output .= "<a class='prev' id='$new'><i class='fas fa-angle-left'></i></a>";
        for ($i = 1; $i <= $totalPage; $i++) {

            if ($i == $page) {
                $active = "active";
            } else {
                $active = "";
            }
            $output .= "
        <a class ='num $active' id='$i'>$i</a>";
        }
        $new = $page + 1;
        $output .= "<a class='next' id='$new'><i class='fas fa-angle-right'></i></a>";
        $output .= "</div>";
    }
}
echo $output;
