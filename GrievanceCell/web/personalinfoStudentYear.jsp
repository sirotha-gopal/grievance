<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width , initial-scale=1">
	<title>Demo Project</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/glyphicon.css">
	<link rel="stylesheet" type="text/css" href="css/panel.css">
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="style.css">
	<style type="text/css">
		label
		{
			font-weight: bold;
		}
		.section:hover
		{
			background-color: gray;
		}

		.td_css
		{
			font-size:12px;
			font-weight:bold;
			color: #808080;
		}

		.row h3 a
		{
			text-decoration:none;
			color: inherit;
		} 

		.row h3 a span
		{
			font-size: 20px;
		} 

		.inner-addon
		{
			position: relative;
		}

		.inner-addon .glyphicon
		{
			position:absolute;
			padding:20px;
		}

		.right-addon .glyphicon
		{
			right:0px;
		}

		.right-addon input
		{
			padding-right:45px;
		}

	</style>
</head>
<body>
    <%
        String year=(String)session.getAttribute("Year");
    %>
<!--Navigation-->
<nav class="navbar navbar-expand-sm sticky-top navbar-light bg-light" style="padding: 0px; margin: 0px;">
	<a class="navbar-brand" href="#"><img src="img/gtoup.png" class="img-responsive img-thumbnail" style="width: 200px;"></a>
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myMenu">
		<span class="navbar-toggler-icon"></span>
	</button>
</nav>


<!--Grievance Heading-->
<div class="jumbotron" style="padding: 0px; margin: 0px;" >
	<div class="container">
		<div class="row"> 
			<div class="col-sm-12" style="padding-top: 20px; text-align: center;">
				<h1>GRIEVANCE CELL</h1>
			</div>
		</div>
	</div>
</div>
<br>
<br>


<div class="container">
	<div class="row">
		<h3 style="padding-left: 200px;"><a href="personalinfoStudent.jsp"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;Year</a></h3>		
	</div>
</div>
<hr>

<div class="container">
	<div style="padding-left: 200px;">
		<p style="padding-top:0px; font-size: 16px; color:#808080;">Changes to your year will be reflected across your Account.</p>
	</div>
	<div class="row" style="padding-left: 200px;">
		<form>
			<div class="form-group inner-addon right-addon">
				
                            <a href="#" style="text-decoration:none; color: inherit;"><i><span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#edit"></span></i></a>

                            <input type="text" class="form-control input-lg" readonly="readonly" value="<%=year%>" style="padding:35px; width: 600px; background-color:white;">

			</div>
		</form>		

	</div>
</div>

<!--Edit Modal-->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
					<div class="modal-header">
							<h4 class="modal-title">Edit:</h4>
							<button class="close" data-dismiss="modal">&times;</button>
					</div>	
			        <div class="modal-body">
			        		
                                    <form action="Updater.jsp" method="post">
					        			<br>
					        			<div class="form-group">
					        				<label>Year:</label>
					        				<input type="text" name="year" placeholder="Enter Year" class="form-control">
                                                                                <input type="hidden" name="update" value="year" class="form-control">
					        			</div>
					        			<div class="form-group">
					        				<button type="button" class="btn btn-secondary" data-dismiss="modal">
					        					Cancel
					        				</button>
					        				<button type="submit" class="btn btn-primary">
					        					Update
					        				</button>
					        			</div>
					        		</form>		
			        </div>
			    </div>
			  </div>
			</div>



</body>
</html>