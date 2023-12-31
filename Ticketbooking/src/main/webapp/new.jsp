<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@ page import="java.sql.*" %>
    <%@ taglib uri="/WEB-INF/tag.tld" prefix="pstl" %>
<!DOCTYPE html>
<html>

<head>
<title>Ticket Reservation</title>



<meta name="viewport" content="width=device-width, intial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>

<body>

	<br>
	<br>

	<form>
		<br>
		<h1 style="font-weight: bold; text-decoration-color: bisque;">Ticket
			Reservation</h1>
		<br> <br>

		<div class="container text-center">
			<div class="row align-items-center">


				<div class="col">
					<label>From Station: <select id="from"
						style="width: 200px; height: 25px;">
						<pstl:ticket col="from_station" password="pavan123" table="train" driver="org.postgresql.Driver" dburl="jdbc:postgresql://localhost:5432/postgres" username="postgres"/>

					</select></label>
				</div>

				<div class="col">
					<label>To Station: <select id="to"
						style="width: 200px; height: 25px;">
							<pstl:ticket col="to_station" password="pavan123" table="train" driver="org.postgresql.Driver" dburl="jdbc:postgresql://localhost:5432/postgres" username="postgres"/>

					</select></label>
				</div>
			</div>
		</div>

		<br> <br>
		<div class="container text-center">
			<div class="row align-items-center">


				<div class="col">
					<label>Train: <select id="train"
						style="height: 30px; width: 200px;">
							<pstl:ticket col="train_name" val="train_number" password="pavan123" table="train" driver="org.postgresql.Driver" dburl="jdbc:postgresql://localhost:5432/postgres" username="postgres"/>
</select></label>
				</div>
			</div>
		</div>

		<br> <br>
		<div class="container text-center">
			<div class="row align-items-center">

				<div class="col">
					<label for="clas">Class:</label> <select id="clas">
						<option value="general">General</option>
						<option value="sleeper">Sleeper</option>
						<option value="1tier">1 Tier AC</option>
						<option value="2tier">2 Tier AC</option>
					</select>
				</div>


				<div class="col">
					<label for="date">Date:</label> <input type="date" id="date">
				</div>

				<br> <br>
				<div class="container">
					<h3>Passenger Details</h3>
				</div>
<div>
		<label>Name :<input type="text" id="name">&nbsp&nbsp&nbsp&nbsp&nbsp</label>
		<label>Gender :<input type="text" id="gender">&nbsp&nbsp&nbsp&nbsp&nbsp</label>
		<label>Age :<input type="text" id="age">&nbsp&nbsp&nbsp&nbsp&nbsp</label><br><br>
		<button id="add" onclick="addRow(event)">Add</button></div></div>

		<table id="table" border="1">
			<thead>
				<tr>
					<th>Name</th>
					<th>Gender</th>
					<th>Age</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody id="tbody">
			</tbody>
		</table><br><br></div>
					
			
				<button onclick="booook()">Sumitt</button>
	</form>
	<style>
h1 {
	text-align: center;
}

body {
	font-size: 100%;
}

#submitBtn {
	height: 25px;
	width: 10%;
}

#rest {
	height: 25px;
	width: 10%;
}

#cancel {
	height: 25px;
	width: 10%;
}



body {
	font-family: "Times New Roman";
	background-image: url("https://static.toiimg.com/photo/63380704.cms");
	background-size: cover;
	background-position: center;
	height: 120vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

form {
	width: 1200px;
	height: 900px;
	padding: 20px;
	background-color: rgba(240, 255, 255, 0.8);
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 1.0);
}
#table{
	width:1000px;
	
}
</style>

	<script>
	var pass="";
let count=1;
	var data="";
        function addRow() {
        	const name=document.getElementById("name").value;
        	const gender=document.getElementById("gender").value;
        	const age=document.getElementById("age").value;
		  
		  
}
        
        var xhr=new XMLHttpRequest();
        xhr.open('GET','http://localhost:9010/Ticketbooking/StServlet',true);
        xhr.onreadystatechange=function(){
        	if(xhr.readyState===4 && xhr.status===200){
        		var resp=JSON.parse(xhr.responseText);
        		console.log(resp);
        		
        		meth(resp);
        	}	
        	
        }
        xhr.send();
       /* function meth(data){
			
			
        	var from=document.getElementById("from");
        	data.forEach(function (da){
        		var option=document.createElement("option");
        		option.textContent=da.from;
        		from.appendChild(option);
        	})
        	var to=document.getElementById("to");
        	data.forEach(function (da){
        		var option=document.createElement("option");
        		option.textContent=da.to;
        		to.appendChild(option);
        	})
        	var train=document.getElementById("train");
        	data.forEach(function (da){
        		
        		var option=document.createElement("option");
        		option.textContent=da.train;
        		train.appendChild(option);
        	})
        }*/
        
        
        function addRow(event) {
			
			event.preventDefault();
			var t = document.getElementById("table");
			var tb = document.getElementById("tbody");
			var tr = document.createElement("tr");
			var td1 = document.createElement("td");
			var td2 = document.createElement("td");
			var td3 = document.createElement("td");
			var td4 = document.createElement("td");
			const n = document.getElementById("name").value;
			const g = document.getElementById("gender").value;
			const a = document.getElementById("age").value;
			td1.textContent = (n);
			td2.textContent = (g);
			td3.textContent = (a);
			tr.appendChild(td1);
			tr.appendChild(td2);
			tr.appendChild(td3);

			var btn = document.createElement("button");
			btn.textContent = "remove";
			
			btn.addEventListener('click', function () {
				var t = this.parentNode.parentNode;
				t.innerHTML = "";
			});
			td4.appendChild(btn);
			tr.appendChild(td4);
			tb.appendChild(tr);
			t.append(tb);

			pass += "&name=" + n + "&gender=" + g + "&age=" + a;
		
		document.getElementById("name").value="";
		document.getElementById("gender").value="";
		document.getElementById("age").value="";
		}
        
        function booook(){
        	
        	var from=document.getElementById('from').value;
        	var to=document.getElementById('to').value;
        	var train=document.getElementById('train').value;
        	var clas=document.getElementById('clas').value;
        	var date=document.getElementById('date').value;
        	var tdata = "from=" + from + "&to=" + to + "&train=" + train + "&cls=" + cls + "&date=" + dt;
        	var xh=new XMLHttpRequest();
        	xh.open('GET','Booking?'+tdata+pass,true);
        	xh.onreadystatechange=function(){
        		
        		if(xh.readyState===4){
        			var res=xh.responseText;
        			document.body.innerHTML=res;
        			
        	}
        	};
        	xh.send();
        }
        
        
    </script>


	</div>
</body>

</html>