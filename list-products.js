$(function () {
    $.ajax({
        url: "http://localhost:8080/products",
        type: "GET",
        dataType: "json"
    })
        .done(function (response) {
            var productsSelector = $("#products")
            $.each(response, function (index, value) {
                 
                var productRow = "<tr>";
                productRow += "<td>" + value.ProductId + " </td>";
                productRow += "<td><img id=\"R" + index + "\"></td>";
                productRow += "</tr>";
                
                productsSelector.append(productRow);
                $("#R" + index).attr({src: value.ImgPath, width: 200})
            });
        })
        .fail(function (xhr, status, errorThrown) {
            $("<tr>").text("Failed to retrieve products").appendTo(".prods");
        });
}); 