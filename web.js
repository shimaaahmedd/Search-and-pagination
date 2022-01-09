$(document).ready(function () {
  function loadData(page, limit, query) {
    $.ajax({
      url: "pagination.php",
      method: "POST",
      data: { page: page, limit: limit, query: query },
      success: function (data) {
        $("#data").html(data);
      },
    });
  }
  loadData();
  var limit;
  var query;
  var page;
  $(document).on("click", ".per_page", function () {
    limit = $(this).attr("id");
    loadData("", limit, query);
  });
  $(document).on("click", ".num", function () {
    page = $(this).attr("id");
    query = $("#search-txt").val();
    loadData(page, limit, query);
  });
  $(document).on("click", ".prev", function () {
    page = $(this).attr("id");
    loadData(page, limit, query);
  });
  $(document).on("click", ".next", function () {
    page = $(this).attr("id");
    loadData(page, limit, query);
  });
  $("#search-txt").keyup(function () {
    query = $("#search-txt").val();
    loadData(1, limit, query);
  });
});
