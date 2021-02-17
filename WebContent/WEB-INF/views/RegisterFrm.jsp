<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<link href="css/styles.css" rel="stylesheet" />


<body class="sb-nav-fixed">

<jsp:include page="./navbar.jsp"></jsp:include>
<jsp:include page="./sidebar.jsp"></jsp:include>

 <div id="layoutSidenav_content_upd">
 <div class="container-fluid">
    <div class="mt-4">
               <ol class="breadcrumb mb-4">
                   <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/CustomerFrm">Customers</a></li>
                   <li class="breadcrumb-item active">Add</li>
               </ol>
    </div>
  
   <div class="card mb-4">
     <div class="card-header">
         <p id = "para"></p>  
         <i class="fas fa-user mr-1"></i>
          Customer Form
      </div>
    <div class="card-body">                        
   <form class="form-group" action="<%=request.getContextPath()%>/CustomerFrm" method="POST">
      <div class="form-group" class="mb-3">
	       <label for="AccountId">Account ID</label>
		   <input type="number" class="form-control" id="accountId" name="AccountId" placeholder="Account ID" required></input>
	  </div>
	  <div class="form-group" class="mb-3">
	       <label for="CustomerName">Customer Name</label>
		   <input type="text" class="form-control" id="customerName" name="CustomerName" placeholder="Customer Name" required></input>
	  </div>
	 <%--  <div>
		<span>${msg}</span>
	  </div> --%>
	  <div class="form-group">
	   <div class="text-center pt-3"> 
	       <input type="submit" value="Submit" class="btn btn-primary" />
	   </div>
	  </div>   
	</form> 
	  </div>
	  </div>
 </div>
 </div>
 
<script>
  function showAlert(){
	  
	  alert("success"); 
	  RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/CustomerFrm.jsp");
	  dispatcher.forward(request, response); 
	  
	  alert("move"); 
	  
  } 
 
 
</script>

<c:set var = "method" scope = "session" value = "${Method}"/>
<c:set var = "msg" scope = "session" value = "${Msg}"/> 
<c:set var = "stat" scope = "session" value = "${Stat}"/> 

<c:choose>
<c:when test="${(method == 'POST') && (stat == '1')}">
  <script>
    showAlert();
  </script>
</c:when>
</c:choose>
</body>

<!--
    <script> 
	
        // membuat objek elemen
        var hasil = document.getElementById("hasil-output");

        // menampilkan output ke elemen hasil
        hasil.innerHTML = "<p>Aku suka Javascript</p>";
    </script>

-->
<!-- </body> -->
</html> 