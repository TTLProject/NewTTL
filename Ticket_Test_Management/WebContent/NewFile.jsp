<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ConnectionSteps"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="userbean.Userbean"%>




<html lang="en">
<head>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
%>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="images/favicon.png">

    <title>Ticket&Test Management</title>

    <!--Core CSS -->
    <link href="bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/style1.css" rel="stylesheet">
    <link href="css/style1-responsive.css" rel="stylesheet" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
@import
	url('http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css')
	;

@import
	url('https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800')
	;
@import
url('scss/style.css')
</style>

<script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
<style>
span.item {
	display: block;
	height: 5px;
	text-align: center;
	width: 80px;
	font-size: 11pt;
}
</style>

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
    #abc {
width:100%;
height:100%;
opacity:.95;
top:0;
left:0;
display:none;
position:fixed;
background-color:#313131;
overflow:auto
}
img#close {
position:absolute;
right:-14px;
top:-14px;
cursor:pointer
}
div#popupContact {
position:absolute;
left:50%;
top:17%;
margin-left:-202px;
font-family:'Raleway',sans-serif
}
form {
max-width:300px;
min-width:250px;
padding:10px 50px;
border:2px solid gray;
border-radius:10px;
font-family:raleway;
background-color:#fff


}
    </style>
    <script>
function downloadCSV(csv, filename) {
    var csvFile;
    var downloadLink;

    // CSV file
    csvFile = new Blob([csv], {type: "text/csv"});

    // Download link
    downloadLink = document.createElement("a");

    // File name
    downloadLink.download = filename;

    // Create a link to the file
    downloadLink.href = window.URL.createObjectURL(csvFile);

    // Hide download link
    downloadLink.style.display = "none";

    // Add the link to DOM
    document.body.appendChild(downloadLink);

    // Click download link
    downloadLink.click();
}
function exportTableToCSV(filename) {
    var csv = [];
    var rows = document.querySelectorAll("table tr");
    
    for (var i = 0; i < rows.length; i++) {
        var row = [], cols = rows[i].querySelectorAll("td, th");
        
        for (var j = 0; j < cols.length; j++) 
            row.push(cols[j].innerText);
        
        csv.push(row.join(","));        
    }

    // Download CSV file
    downloadCSV(csv.join("\n"), filename);
}
</script>
</head>

<body>
<%
		Userbean user = (Userbean) session.getAttribute("session1");
	%>
<section id="container" >
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">

   <a href="EmployeeIndex.jsp" class="logo">
        <h4 style="color:white;"><b><i>Ticket&Test Management</i></b></h4>
    </a>
	
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
	
</div>
<!--logo end-->

<!-- <h5 align="right"><a style="color:white;" href="Logout.jsp"><i class="fa fa-key"></i><b> Log Out</b></a></h5> -->
<div class="top-nav clearfix">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
       
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            
                <%try {
                	ConnectionSteps steps = new ConnectionSteps();
                	Connection conn=steps.connection();
                	
        PreparedStatement pstmt = conn.prepareStatement("select * from registrationtable where username=?");
        pstmt.setString(1,user.getUsername());
        ResultSet rs = pstmt.executeQuery();
       
        while ( rs.next()) { %>
 
                  
        
                           <img width='50' height='50' src=DisplayPhotoServlet?id=<%=rs.getString("username")%> style="width: 50px">     
                <span class="username"><%=user.getUsername() %></span>
                <b class="caret"></b>
            </a>
            
        <% }

        
    }
    catch(Exception ex) {
ex.printStackTrace();
    } %>            
            
            <ul class="dropdown-menu extended logout">
                <!-- <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li> -->
                <li><a href="Logout.jsp"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
        </li>
        <!-- user login dropdown end -->
        
    </ul>
    <!--search & user info end-->
</div>

</header>
<!--header end-->
<aside>
			<div id="sidebar" class="nav-collapse">
				<!-- sidebar menu start-->
				<div class="leftside-navigation">
					<ul class="sidebar-menu" id="nav-accordion">
						<li><a class="active" href="EditEmployeeProfile.jsp"> <i
								class="fa fa-pencil"></i> <span>EditProfile</span>
						</a></li>
						<li class="sub-menu"><a href="javascript:;"> <i
								class="fa fa-laptop"></i> <span>Ticket Management</span>
						</a>
							<ul class="sub">
								<li><a href="AddEmployeeTicket.jsp">Add Ticket</a></li>
								<li><a href="EditEmployeeTicket.jsp">Edit Ticket</a></li>
								<li><a href="ViewEmployeeTicket.jsp">View Ticket</a></li>
							</ul></li>


							<%
                String desig=user.getDesignation();
				if((desig.equals("qualityanalyst"))) {
					%>
					  <li class="sub-menu">
	                    <a href="javascript:;">
	                        <i class="fa fa-check-square-o"></i>
	                        <span>Test Management</span>
	                    </a>
	                    <ul class="sub">
	                        <li><a href="TestReport.jsp">Prepare TestReport</a></li>
	                        <li><a href="TestData.jsp">Prepare TestData </a></li>
	                        <li><a href="BugReport.jsp">Prepare BugReport</a></li>
	                        <li><a href="ViewTestReport.jsp">ViewTestReport</a></li>
							 <li><a href="ModifyTestReport.jsp">ModifyTestReport</a></li>
							
	                    </ul>
	                </li>
				<% }
				
                %>

						<li><a href="EmployeeNotifications.jsp"> <i
								class="fa fa-bell-o"></i> <span>Notifications </span>
						</a></li>




					</ul>
				</div>
				<!-- sidebar menu end-->
			</div>
		</aside>
<!--sidebar end-->
    <!--main content start-->
 <section id="main-content">
        <section class="wrapper">
        <!-- page start-->
        <div id="alert_message" align="center"></div>
                                   <button type="submit" onclick="return myFunction()" 
															form="deleteform">DeleteRows</button>
														<script>
							function myFunction() {
								
								var r=confirm("Confirm Submission");
								if(r==true){
                                return true;
								}
								else{
									return false;
								}
							}
						</script>
      
	<button id="popup" onclick="div_show()">DeleteColumn</button>	
<div id="abc">
<!-- Popup Div Starts Here -->
<div id="popupContact">
<!-- Contact Us Form -->
<form action="empTDServlet" id="form" method="post" name="form">
<img id="close" src="images/3.png" onclick ="div_hide()">
<h4>Enter column Name</h4>

<input id="name" name="testdata" type="text">
<br><br>
&emsp;&emsp;&emsp;&emsp;<input type="submit" value="submit">
</form>
</div>
<!-- Popup Div Ends Here -->
</div>
<!-- Display Popup Button -->
	
				
<button id="popup" onclick="div_show1()">AddColumn</button>


<div id="abc1">
<!-- Popup Div Starts Here -->
<div id="popupContact">
<!-- Contact Us Form -->
<form action="TestDataDeleteColumn.jsp" id="form" method="post" name="form">
<img id="close" src="images/3.png" onclick ="div_hide1()">
<h4>Select column Name</h4>

<select required="required" style="width:200px; overflow:hidden" name="column">
<option value="">Select</option>
<%
						ConnectionSteps steps = new ConnectionSteps();
						Connection conn=steps.connection();
					PreparedStatement pstmt2 = conn.prepareStatement("select * from testdata1 order by id");
					ResultSet rs2=pstmt2.executeQuery();
					while(rs2.next()){
			
						%>
						<option value=<%=rs2.getString("columnname") %>><%=rs2.getString("columnname") %></option>
						<%} %>

</select>
<br><br>
&emsp;&emsp;&emsp;&emsp;<input type="submit" value="submit">
</form>
</div>
<!-- Popup Div Ends Here -->
</div>
<!-- Display Popup Button -->
	
				
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<button onclick="exportTableToCSV('file.csv')">Download Csv</button>

				<br> <br>  

<div id="table">
  

<table id="my_table" border="2" cellpadding="0" cellspacing="0"
					contenteditable="true">
					<thead>
						<tr contenteditable="true" width="30%">
						
							<th>Select</th>

							<th>Type of Testing</th>
							<th style="display:none;" >Type of Testing</th>
							<%
						
					PreparedStatement pstmt = conn.prepareStatement("select * from testdata1 order by id");
					ResultSet rs=pstmt.executeQuery();
					int count=0;
					ArrayList al = new ArrayList();
					while(rs.next()){
				count++;
						%>
						<th><%=rs.getString("heading") %></th>
						<%
						
						al.add(rs.getString("heading"));
						
						} %>
						</tr>
					</thead>
<form action="TestDataDeleteRows.jsp" method="post" id="deleteform">
<form action="UpdateTestDataServlet1" method="post" id="update">
					<tbody>
					
					<% PreparedStatement pstmt1 = conn.prepareStatement("select * from testdata");
										 ResultSet rs1 =pstmt1.executeQuery();
										 while(rs1.next()){ %>
						<tr width="30%">
							<td contenteditable="false"><input type="checkbox" name="check" value="<%=rs1.getString("id")%>"></td>
							<%if(rs1.getString("typeoftesting")==null){%>
							<td contenteditable="false" >
							<select class="update2" data-id=<%=rs1.getString("id")%>
									data-column="typeoftesting" >
							<option	value="000">Select</option>
									<option value="Positive">Positive</option>
									<option value="Negative">Negative</option>
									</select></td>
									<%}else if(rs1.getString("typeoftesting").equals("Positive")){ %>
									
									<td contenteditable="false" >
							<select class="update2" data-id=<%=rs1.getString("id")%>
									data-column="typeoftesting" >
									<option value="Positive">Positive</option>
									<option value="Negative">Negative</option>
									</select></td>
									<%}else if(rs1.getString("typeoftesting").equals("Negative")){ %>
									
									<td contenteditable="false" >
							<select class="update2" data-id=<%=rs1.getString("id")%>
									data-column="typeoftesting" >
									<option value="Negative">Negative</option>
									<option value="Positive">Positive</option>
									
									</select></td>
									
									<%} %>
									
									<%if(rs1.getString("typeoftesting")==null){ %>
									<td style="display:none;" ></td>
									<%}else{ %>
									<td style="display:none;" ><%=rs1.getString("typeoftesting")%></td>
									<%
										}
									 Iterator itr=al.iterator(); 
									for(int i=0;i<count;i++){ 
								while(itr.hasNext()){
								 String in = (String)itr.next();
								
							if(rs1.getString(in)==null){
									%>
									
									<td contenteditable="true" name="content[]"  class="content"></td>
									<input type="hidden" name="id[]" class="id" value=<%=rs1.getString("id")%> >
									<input type="hidden" name="column[]"  value=<%=in %> >
									<% }else{%>
									<td contenteditable="true" name="content[]"  class="content" ><%=rs1.getString(in)%></td>
									<input type="hidden" name="id[]" class="id" value=<%=rs1.getString("id")%> >
									<input type="hidden" name="column[]"  value=<%=in %> >
									<%}}}
									
									%>
									
									</tr>
									<%} %>
  
						
						
						  <input type="hidden" name="count[]" value=<%=count %>>

					</tbody>  
		</form></form>
				</table>
		
</div>
 <br>
 <button type="submit" id="save">Submit</button>
				<button id="add">AddRow</button> &emsp;&emsp;&emsp;
				



        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<!--right sidebar start-->
<div class="right-sidebar">
<div class="search-row">
    <input type="text" placeholder="Search" class="form-control">
</div>
<div class="right-stat-bar">
<ul class="right-side-accordion">
<li class="widget-collapsible">
    <a href="#" class="head widget-head red-bg active clearfix">
        <span class="pull-left">work progress (5)</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="prog-row side-mini-stat clearfix">
                <div class="side-graph-info">
                    <h4>Target sell</h4>
                    <p>
                        25%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="target-sell">
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="side-graph-info">
                    <h4>product delivery</h4>
                    <p>
                        55%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="p-delivery">
                        <div class="sparkline" data-type="bar" data-resize="true" data-height="30" data-width="90%" data-bar-color="#39b7ab" data-bar-width="5" data-data="[200,135,667,333,526,996,564,123,890,564,455]">
                        </div>
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="side-graph-info payment-info">
                    <h4>payment collection</h4>
                    <p>
                        25%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="p-collection">
						<span class="pc-epie-chart" data-percent="45">
						<span class="percent"></span>
						</span>
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="side-graph-info">
                    <h4>delivery pending</h4>
                    <p>
                        44%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="d-pending">
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="col-md-12">
                    <h4>total progress</h4>
                    <p>
                        50%, Deadline 12 june 13
                    </p>
                    <div class="progress progress-xs mtop10">
                        <div style="width: 50%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="20" role="progressbar" class="progress-bar progress-bar-info">
                            <span class="sr-only">50% Complete</span>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</li>
<li class="widget-collapsible">
    <a href="#" class="head widget-head terques-bg active clearfix">
        <span class="pull-left">contact online (5)</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1_small.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Jonathan Smith</a></h4>
                    <p>
                        Work for fun
                    </p>
                </div>
                <div class="user-status text-danger">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Anjelina Joe</a></h4>
                    <p>
                        Available
                    </p>
                </div>
                <div class="user-status text-success">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/chat-avatar2.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">John Doe</a></h4>
                    <p>
                        Away from Desk
                    </p>
                </div>
                <div class="user-status text-warning">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1_small.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Mark Henry</a></h4>
                    <p>
                        working
                    </p>
                </div>
                <div class="user-status text-info">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Shila Jones</a></h4>
                    <p>
                        Work for fun
                    </p>
                </div>
                <div class="user-status text-danger">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <p class="text-center">
                <a href="#" class="view-btn">View all Contacts</a>
            </p>
        </li>
    </ul>
</li>
<li class="widget-collapsible">
    <a href="#" class="head widget-head purple-bg active">
        <span class="pull-left"> recent activity (3)</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="prog-row">
                <div class="user-thumb rsn-activity">
                    <i class="fa fa-clock-o"></i>
                </div>
                <div class="rsn-details ">
                    <p class="text-muted">
                        just now
                    </p>
                    <p>
                        <a href="#">Jim Doe </a>Purchased new equipments for zonal office setup
                    </p>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb rsn-activity">
                    <i class="fa fa-clock-o"></i>
                </div>
                <div class="rsn-details ">
                    <p class="text-muted">
                        2 min ago
                    </p>
                    <p>
                        <a href="#">Jane Doe </a>Purchased new equipments for zonal office setup
                    </p>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb rsn-activity">
                    <i class="fa fa-clock-o"></i>
                </div>
                <div class="rsn-details ">
                    <p class="text-muted">
                        1 day ago
                    </p>
                    <p>
                        <a href="#">Jim Doe </a>Purchased new equipments for zonal office setup
                    </p>
                </div>
            </div>
        </li>
    </ul>
</li>
<li class="widget-collapsible">
    <a href="#" class="head widget-head yellow-bg active">
        <span class="pull-left"> shipment status</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="col-md-12">
                <div class="prog-row">
                    <p>
                        Full sleeve baby wear (SL: 17665)
                    </p>
                    <div class="progress progress-xs mtop10">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                            <span class="sr-only">40% Complete</span>
                        </div>
                    </div>
                </div>
                <div class="prog-row">
                    <p>
                        Full sleeve baby wear (SL: 17665)
                    </p>
                    <div class="progress progress-xs mtop10">
                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                            <span class="sr-only">70% Completed</span>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</li>
</ul>
</div>
</div>
<!--right sidebar end-->

</section>

<!-- Placed js at the end of the document so the pages load faster -->

<!--Core js-->
<script src="js/jquery.js"></script>
<script src="bs3/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--Easy Pie Chart-->
<script src="js/easypiechart/jquery.easypiechart.js"></script>
<!--Sparkline Chart-->
<script src="js/sparkline/jquery.sparkline.js"></script>
<!--jQuery Flot Chart-->
<script src="js/flot-chart/jquery.flot.js"></script>
<script src="js/flot-chart/jquery.flot.tooltip.min.js"></script>
<script src="js/flot-chart/jquery.flot.resize.js"></script>
<script src="js/flot-chart/jquery.flot.pie.resize.js"></script>


<!--common script init for all pages-->
<script src="js/scripts.js"></script>

<script>
function check_empty() {
	if (document.getElementById('name').value == "" || document.getElementById('email').value == "" || document.getElementById('msg').value == "") {
	alert("Fill All Fields !");
	} else {
	document.getElementById('form').submit();
	alert("Form Submitted Successfully...");
	}
	}
	//Function To Display Popup
	function div_show() {
	document.getElementById('abc').style.display = "block";
	}
	//Function to Hide Popup
	function div_hide(){
	document.getElementById('abc').style.display = "none";
	}
	
	function div_show1() {
	document.getElementById('abc1').style.display = "block";
	}
	//Function to Hide Popup
	function div_hide1(){
	document.getElementById('abc1').style.display = "none";
	}
</script>



</body>
</html>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		
			$('#add').click(function(){
		  $.ajax({
					   url:"TestDataAddRow.jsp",
					   method:"POST",
					   data:{},
					   success:function(data){
						   
					  	$("#table").load("NewFile.jsp #table");
					   }
					  });
					 });
					 

					 
					 
					 
});
	
			
			
</script>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		document.getElementById('abc1').style.display = "none";
		document.getElementById('abc').style.display = "none";
$('#save').click(function(){
			 
			  var content = [];
			  var id = $('input[name="id[]"]').map(function () {
    return this.value; // $(this).val()
}).get();
			  var testing=[]
	  var column = $('input[name="column[]"]').map(function () {
    return this.value; // $(this).val()
}).get();
		 $('.content').each(function(){
				  content.push($(this).text());
			  });
		/*  $('.id').each(function(){
				  id.push($(this).val());
			  });	
		 $('.column').each(function(){
				  column.push($(this).val());
			  }); */
		$('.testing').each(function(){
				  testing.push($(this).text());
			  });
		 $.ajax({
				   url:"UpdateTestDataServlet1",
				   method:"POST",
				   data:{id:id, value:content, column_name:column, testing:testing},
				   success:function(data){
							location.reload();					   
				  
				   }
				  });
			  setInterval(function(){
				     $('#alert_message').html('');
				    }, 5000);
				 });
		
		
		
		function update_data1(id, column_name, value) {
					$.ajax({
						url : "UpdateTestDataServlet",
						method : "POST",
						data : {
							id : id,
							column_name : column_name,
							value : value
						},
						success : function(data) {
							//$("#btn").load("EditExecutiveTicket.jsp #btn");
							

						}
					});

				}
		$(document).on('change', '.update2', function() {
					var tr = $(this).closest("tr");
					var id = $(this).data("id");
					var column_name = $(this).data("column");

					var value = tr.find('.update2').val();
					update_data1(id, column_name, value);
				});
	});			
</script>
