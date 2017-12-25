$(function(){
	$('#member-point').click(function(data){
//		alert("hi");
		$.getJSON({url:"/PCC/pointDetails.login",
				type:"GET",
				success:function(data){
					console.log(data);
					console.log(data[0]);
					//每次清空
					var div=$('#point-details');
					div.empty();
					//列印
					$.each(data,function(i,points){
						var dateString = points.gettingDate;
						var currentTime = new Date(parseInt(dateString ));
						var month = currentTime.getMonth() + 1;
						var day = currentTime.getDate();
						var year = currentTime.getFullYear();
						var date;
						if(day>9){		
							date =  year + "/" + month + "/" + day;
						}else{
							date =  year + "/" + month + "/" + "0" + day;
						}
						
						details(date,points.getWay ,points.getPoint);
					});
					
				}});
	});
});


function details(pDate,pTxt,pPoint){
	//<p><span class="personal-content">11/12</span>加入會員贈送 <span class="personal-content-right">+5000點</span></p>
	var div=document.getElementById('point-details');
	var p=document.createElement("p");
	//日期
	var spDate=document.createElement("span");
	var txtDate=document.createTextNode(pDate);
	spDate.setAttribute("class","personal-content");
	spDate.appendChild(txtDate);
	//點數
	var spPoint=document.createElement("span");
	var txtPoint=document.createTextNode(pPoint);
	spPoint.setAttribute("class","personal-content-right");
	spPoint.appendChild(txtPoint);
	spPoint.appendChild(document.createTextNode('點'));
	//組合
	p.appendChild(spDate);
	p.appendChild(document.createTextNode(pTxt));
	p.appendChild(spPoint);
	div.appendChild(p);
};