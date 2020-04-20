function studentLoginValidation()
            {   
                alert("hello");
                
                if(document.getElementById("studentId").value=="" && document.getElementById("studentPass").value=="" )
                {
                document.getElementById("stuValidationMsg").innerHTML="please enter the roll no. and password...!!";
                document.getElementById("studentId").focus();
                return false;
                }
                if(document.getElementById("studentId").value=="")
                {
               alert("hello");
                document.getElementById("stuValidationMsg").innerHTML="please enter the roll no. !";
                document.getElementById("studentId").focus();
                return false;
                }
                if(document.getElementById("studentPass").value=="")
                {
                    alert("hello");
                document.getElementById("stuValidationMsg").innerHTML="please enter the password...!!";
                document.getElementById("studentPass").focus();
                return false;
                }
                
            }

function staffLoginValidation()
            {   
                if(document.getElementById("facultyId").value=="" && document.getElementById("facultyPass").value=="" )
                {
                document.getElementById("staffValidationMsg").innerHTML="please enter the roll no. and password...!!";
                document.getElementById("facultyId").focus();
                return false;
                }
                if(document.getElementById("facultyId").value=="")
                {
                document.getElementById("staffValidationMsg").innerHTML="please enter the roll no. !";
                document.getElementById("facultyId").focus();
                return false;
                }
                if(document.getElementById("facultyPass").value=="")
                {
                document.getElementById("staffValidationMsg").innerHTML="please enter the password...!!";
                document.getElementById("facultyPass").focus();
                return false;
                }
                
            }

function parentLoginValidation()
            {   
                
                
                if(document.getElementById("parentId").value=="" && document.getElementById("parentPass").value=="" )
                {
                document.getElementById("parentValidationMsg").innerHTML="please enter the roll no. and password...!!";
                document.getElementById("parentId").focus();
                return false;
                }
                if(document.getElementById("parentId").value=="")
                {
                document.getElementById("parentValidationMsg").innerHTML="please enter the roll no. !";
                document.getElementById("parentId").focus();
                return false;
                }
                if(document.getElementById("parentPass").value=="")
                {
                document.getElementById("parentValidationMsg").innerHTML="please enter the password...!!";
                document.getElementById("parentPass").focus();
                return false;
                }
                
            }

function demoValidation()
            {   
                alert("hello");
                
                if(document.getElementById("demoId").value=="" && document.getElementById("demoPas").value=="" )
                {
                document.getElementById("demoMsg").innerHTML="please enter the roll no. and password...!!";
                document.getElementById("demoId").focus();
                return false;
                }
                if(document.getElementById("demoId").value=="")
                
                {
                document.getElementById("demoMsg").innerHTML="please enter the roll no. !";
                document.getElementById("demoId").focus();
                return false;
                }
                if(document.getElementById("demoPass").value=="")
                {
                document.getElementById("demoMsg").innerHTML="please enter the password...!!";
                document.getElementById("demoPass").focus();
                return false;
                }
                
            }