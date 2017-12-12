// JavaScript source code
$(document).ready(function () {

    $("#Submit1").click(function () {
        

        var tr = $("<tr></tr>");
        var td = $("<td></td>");
        var text = "hello";
        $("resultTable").find("tbody").append(tr).append(td).append(text);
        //var imgs = td.append("<img/>").attr("src", "/PCC/images/productImages/烏骨雞.jpg");
        //var name = $("<td></td>").text("烏骨雞");
        //var price = $("<td></td>").text("456");
        //var cartButten = td.append("butten").attr('value',"加入購物車");

        //tr.append(imgs);
        //tr.append(name);
        //tr.append(price);
        //tr.append(cartButten);
        //$("#resultTable").find("tbody").append(tr);


    });


})
