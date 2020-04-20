<%-- 
    Document   : index
    Created on : Mar 31, 2019, 3:05:53 PM
    Author     : admi-n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width , initial-scale=1">
        <title>Home Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/glyphicon.css">
        <link rel="stylesheet" type="text/css" href="css/panel.css">
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="main_js.js"></script>
        <link rel="stylesheet" type="text/css" href="style.css">
        <style type="text/css">
            label
            {
                font-weight: bold;
            }
        </style>
        <script type="text/javascript">
            /*function m()
            {
                var x = ' <%=(String)session.getAttribute("X")%> ';
                if (x)
                {
                    alert("wrong id password");
                }

            }*/

        </script>

    </head>
    <body>
        <%
            
            
            String ff = (String) session.getAttribute("fValidationMsg");
            if (ff == null) {
                ff = " ";
            }
            String ss = (String) session.getAttribute("sValidationMsg");
            if (ss == null) {
                ss = "   ";
            }
            String pp = (String) session.getAttribute("pValidationMsg");
            if (pp == null) {
                pp = "   ";
            }
        %>
        <!--Navigation-->
        <nav  class="navbar navbar-expand-sm sticky-top navbar-light bg-light" style="padding: 0px; margin: 0px;">
            <a class="navbar-brand" href="#"><img src="img/gtoup.png" class="img-responsive img-thumbnail" style="width: 200px;"></a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="myMenu">
                <ul class="navbar-nav ml-auto"> 
                    <li class="nav-item"><a href="index.html" class="nav-link active">Home</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">Contact</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">Settings</a></li>
                    <li class="nav-item"><a href="#about" class="nav-link">About Us</a></li>
                    <button class="btn btn-success" data-target="#signupModal" data-toggle="modal"><span class="glyphicon glyphicon-user"></span>Sign Up</button>

                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span>
                        Login
                    </button>

                </ul>
            </div>
        </nav>

        <!-- SignUp Modal -->
        <div class="modal" id="signupModal" tabindex="-1" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Sign Up As:</h4>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link" href="#staffreg" data-toggle="tab">Staff</a></li>
                            <li class="nav-item"><a class="nav-link" href="#parentreg" data-toggle="tab">Parent</a></li>
                            <li class="nav-item"><a class="nav-link" href="#studentreg" data-toggle="tab">Student</a></li>	
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane" id="staffreg">
                                <form action="allSignupControl.jsp" method="post">
                                    <br>
                                    <div class="form-group">
                                        <label>First Name:</label>
                                        <input type="text" name="firstName" placeholder="Enter First Name" class="form-control">
                                        <input type="hidden" value="faculty" name="hid">
                                    </div>
                                    <div class="form-group">
                                        <label>Last Name:</label>
                                        <input type="text" name="lastName" placeholder="Enter Last Name" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Faculty Id:</label>
                                        <input type="text" name="facultyId" placeholder="Enter Roll Number" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Designation:</label>
                                        <select name="designation" class="form-control" id="exampleFormControlSelect1">
                                            <option value="desig">Designation</option>
                                            <option value="Principal">Principal</option>
                                            <option value="HOD">HOD</option>
                                            <option value="Registrar">Registrar</option>
                                            <option value="Faculty">Faculty</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Branch:</label>
                                        <select name="branch" class="form-control" id="exampleFormControlSelect1">
                                            <option value="CSE">CSE</option>
                                            <option value="ME">ME</option>
                                            <option value="CE">CE</option>
                                            <option value="IT">IT</option>
                                            <option value="ECE">ECE</option>
                                            <option value="EX">EX</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Number:</label>
                                        <input type="number" name="phoneNo" placeholder="Enter Phone Number" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Email Id:</label>
                                        <input type="email" name="emailId" placeholder="Enter Email Id" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input type="password" name="password" placeholder="Enter Password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Re-Enter Password:</label>
                                        <input type="password" name="repassword" placeholder="Re-Enter Password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" name="signup" value="Sign Up" style="width: 100%; background-color: #008080;  font-size: 18px; cursor: pointer; color: white;">
                                    </div>

                                </form>
                            </div>
                            <div class="tab-pane" id="parentreg">
                                <form action="allSignupControl.jsp" method="post">
                                    <br>
                                    <div class="form-group">
                                        <label>First Name:</label>
                                        <input type="text" name="firstName" placeholder="Enter First Name" class="form-control">
                                        <input type="hidden" name="hid" value="parent">
                                    </div> 
                                    <div class="form-group">
                                        <label>Last Name:</label>
                                        <input type="text" name="lastName" placeholder="Enter Last Name" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Student Roll No:</label>
                                        <input type="text" name="rollNo" placeholder="Enter Roll Number" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Number:</label>
                                        <input type="number" name="phoneNo" placeholder="Enter Phone Number" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Email Id:</label>
                                        <input type="email" name="emailId" placeholder="Enter Email Id" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Address:</label>
                                        <textarea name="address" placeholder="Enter Address" rows="10" cols="20" class="form-control"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input type="password" name="password" placeholder="Enter Password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Re-Enter Password:</label>
                                        <input type="password" name="repassword" placeholder="Re-Enter Password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" name="signup" value="Sign Up" style="width: 100%; background-color: #008080;  font-size: 18px; cursor: pointer; color: white;">
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane" id="studentreg">
                                <form action="allSignupControl.jsp" method="post">
                                    <br>
                                    <div class="form-group">
                                        <label>First Name:</label>
                                        <input type="text" name="firstName" placeholder="Enter First Name" class="form-control">
                                        <input type="hidden" name="hid" value="student">
                                    </div>
                                    <div class="form-group">
                                        <label>Last Name:</label>
                                        <input type="text" name="lastName" placeholder="Enter Last Name" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Roll No:</label>
                                        <input type="text" name="rollNo" placeholder="Enter Roll Number" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Branch:</label>
                                        <select name="branch" class="form-control" id="exampleFormControlSelect1">
                                            <option value="CSE">CSE</option>
                                            <option value="ME">ME</option>
                                            <option value="CE">CE</option>
                                            <option value="IT">IT</option>
                                            <option value="ECE">ECE</option>
                                            <option value="EX">EX</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Year:</label>
                                        <input type="text" name="year" placeholder="Enter Year" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Semester:</label>
                                        <input type="text" name="semester" placeholder="Enter Semester" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Number:</label>
                                        <input type="number" name="phoneNo" placeholder="Enter Phone Number" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Email Id:</label>
                                        <input type="email" name="emailId" placeholder="Enter Email Id" class="form-control">
                                    </div>

                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input type="password" name="password" placeholder="Enter Password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Re-Enter Password:</label>
                                        <input type="password" name="repassword" placeholder="Re-Enter Password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" name="signup" value="Sign Up" style="width: 100%; background-color: #008080;  font-size: 18px; cursor: pointer; color: white;">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Login Modal -->
        <!-- Login Modal -->

        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Login As:</h4>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>	
                    <div class="modal-body">
                        <ul class="nav nav-tabs">

                            <li class="nav-item"><a class="nav-link" href="#parentlog" data-toggle="tab">Parent</a></li>
                            <li class="nav-item"><a class="nav-link" href="#studentlog" data-toggle="tab">Student</a></li>	
                            <li class="nav-item"><a class="nav-link" href="#stafflog" data-toggle="tab">Staff</a></li>

                        </ul>   
                        <div class="tab-content">


                            <div class="tab-pane" id="parentlog">	        
                                <form action="allLoginControl.jsp" method="post" onsubmit="return parentLoginValidation()">
                                    <br>
                                    <div class="form-group">

                                        <label><span class="glyphicon glyphicon-user"></span>User Id:</label>
                                        <input type="text" name="parentId" placeholder="Enter User Id" class="form-control" id="parentId">
                                        <input type="hidden" value="parentlogin" name="login"/>
                                    </div>
                                    <div class="form-group">
                                        <label><span class="glyphicon glyphicon-lock"></span>Password:</label>
                                        <input type="password" name="parentPass" placeholder="**********" class="form-control" id="parentPass">
                                    </div>
                                    <p style="font-size: 10px; color: red; " id="parentValidationMsg"><%=pp%></p><br>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">
                                            LogIn
                                        </button>
                                    </div>
                                </form>
                            </div>


                            <div class="tab-pane" id="studentlog">	        
                                <form action="allLoginControl.jsp" method="post" onsubmit="return studentLoginValidation()">
                                    <br>
                                    <div class="form-group">

                                        <label><span class="glyphicon glyphicon-user"></span>User Id:</label>
                                        <input type="text" name="studentId" placeholder="Enter User Id" class="form-control" id="studentId">
                                        <input type="hidden" value="stulogin" name="login"/>
                                    </div>
                                    <div class="form-group">
                                        <label><span class="glyphicon glyphicon-lock"></span>Password:</label>
                                        <input type="password" name="studentPass" placeholder="**********" class="form-control" id="studentPass">
                                    </div>
                                    <p style="font-size: 10px; color: red; " id="studentValidationMsg"><%=ss%></p><br>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">
                                            LogIn
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane" id="stafflog">	        
                                <form action="allLoginControl.jsp" method="post" onsubmit="return staffLoginValidation()">
                                    <br>
                                    <div class="form-group">
                                        <label><span class="glyphicon glyphicon-user"></span>User Id:</label>
                                        <input type="text" name="facultyId" placeholder="Enter User Id" class="form-control" id="facultyId">
                                        <input type="hidden" name="login" value="flogin" >
                                    </div>
                                    <div class="form-group">
                                        <label><span class="glyphicon glyphicon-lock"></span>Password:</label>
                                        <input type="password" name="facultyPass" placeholder="**********" class="form-control" id="facultyPass">
                                    </div>
                                    <p style="font-size: 10px; color: red; " id="staffValidationMsg"><%=ff%></p><br>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">
                                            LogIn
                                        </button>
                                    </div>
                                </form>
                            </div>

                        </div>		
                    </div>
                </div>
            </div>
        </div>


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

        <!--Image Silder-->
        <div class="container">
            <div id="slides" class="carousel slide shadow p-3 mb-5 bg-white rounded" data-ride="carousel"> 
                <ul class="carousel-indicators">
                    <li data-target="#slides" data-slide-to="0" class="active"></li>
                    <li data-target="#slides" data-slide-to="1" ></li>
                    <li data-target="#slides" data-slide-to="2" ></li>
                    <li data-target="#slides" data-slide-to="3" ></li>
                </ul>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/green.jpg">
                    </div>
                    <div class="carousel-item">
                        <img src="img/blue.jpg">
                    </div>
                    <div class="carousel-item">
                        <img src="img/pink.jpg">
                    </div>
                    <div class="carousel-item">
                        <img src="img/lnct.jpg">
                    </div>
                </div>
            </div>
        </div>
        <br>
        <hr>
        <br>
        <!--Information-->
        <div class="container">	
            <div class="row">	
                <div class="col-sm-8" style="text-align:justify;">
                    <img src="img/green.jpg" class="img-responsive img-thumbnail" width="250" align="left" vspace="5" hspace="5">
                    <p>
                        <%=ff%>Motivation is basically motivating the employees to work in
                        favour of their workplace to increase productivity of both
                        employees and organisation. Effective grievance handling can be
                        a motivational tool to boost the productivity of both, the
                        employees and the work place. Because increasing rate of
                        grievance can decrease the motivation and productivity of	
                        employees, it affects the productivity of workplace directly.
                    </p>
                    <div class="jumbotron">
                        <div class="row">
                            <div class="col-sm-12" style="text-align: justify;">
                                <div id="about">
                                    <h2>About the Grievance Cell:</h2>
                                    <p>
                                        The proposed system “Design and Implementation of Online Grievances Register and Tracking System” also referred as “Grievance cell” is a software product for each and every type of educational institute. It will help the students, their parents and staff to register their complaints online and resolve them. This application aims at providing a platform to register grievances anytime from anywhere. The paper contains different modules like student module, parent module, faculty module etc. The grievances are divided in different categories. There will be an online tracking system for each grievance to know the current status of the complaint. The problem solving will be done in a hierarchical manner. If the grievance is not solved by the first level then it will be automatically redirected to upper next level in a particular time limit. The aim of the product is to solve the grievance with minimal difficulty.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4" style="text-align:justify;">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Latest News</h3>
                        </div>
                        <marquee direction="up">
                            <div class="panel-body">
                                Motivation is basically motivating the employees to work in
                                favour of their workplace to increase productivity of both
                                employees and organisation.
                            </div>
                            <div class="panel-body">
                                Motivation is basically motivating the employees to work in
                                favour of their workplace to increase productivity of both
                                employees and organisation.
                            </div>
                            <div class="panel-body">
                                Motivation is basically motivating the employees to work in
                                favour of their workplace to increase productivity of both
                                employees and organisation.
                            </div>
                            <div class="panel-body">
                                Motivation is basically motivating the employees to work in
                                favour of their workplace to increase productivity of both
                                employees and organisation.
                            </div>
                            <div class="panel-body">
                                Motivation is basically motivating the employees to work in
                                favour of their workplace to increase productivity of both
                                employees and organisation.
                            </div>
                        </marquee>
                    </div>
                </div>
            </div>
                        
        </div>	

                        
                        <jsp:include page="footer.jsp"/>


    </body>
</html>