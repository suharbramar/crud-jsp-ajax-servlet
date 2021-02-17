<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="js/scripts.js"></script>
<link href="css/styles.css" rel="stylesheet" />
<script>
 $(document).ready(function(){
  var table = $('#dataTable').DataTable({
	        "ajax": {
	            url: 'GetCustomer',  
	            type: 'GET',
	            dataSrc: ""
	        },
	        aoColumns: [
	            { mData: 'customerId' },
	            { mData: 'customerName'},
	            { mRender: function (data, type, row) {
	                          return '<button type="button" class="btn btn-success" id="edit_btn"><i class="fa fa-edit"></i></button> '+
	                          '<button type="button" class="btn btn-danger" id="del_btn"><i class="fa fa-trash-alt"></i></button> ';
	                        }
	            },
	         
	        ], 

	        autofill: true, 
	        select: true,
	        responsive: true,
	        buttons: true,
	        length: 10,

	    });
  
  $('#dataTable').on( 'click', '#edit_btn', function () {
      var data = table.row( $(this).parents('tr') ).data();
  } );
  
  <%-- $('#addBtn').click(function(){
	  
	  <%
	     request.getRequestDispatcher("/WEB-INF/views/RegisterFrm.jsp").forward(request, response);
	  %>
   
  }); --%>
  
 /*   $(document).ready(function(){
	    $('#addBtn').click(function() {
	      $(this).addClass('active').siblings('a').removeClass('active');
	      $('section:nth-of-type('+$(this).data('rel')+')').stop().fadeIn(0, 'linear').siblings('section').stop().fadeOut(0, 'linear'); 
	    });
	    
	});
 */

	
	 /* jQuery.ajax({
		 type: 'GET',
		    headers : {
					Accept : "application/json; charset=utf-8",
					"Content-Type" : "application/json; charset=utf-8"
				},
		    url: 'CustomerFrm',
		    "dataSrc": "",
		    "mDataProp":""
		}).done( function(data) {
		    $('#dataTable').DataTable( {
		        "aaData": data,
		        "aoColumns": [
		            { "mData": "customerId" },
		            { "mData": "customerName" },
		        ]
		    })
		});   */
	
 /* jQuery.ajax({
	type: 'GET',
    headers : {
			Accept : "application/json; charset=utf-8",
			"Content-Type" : "application/json; charset=utf-8"
		},
    url: 'CustomerFrm',
    success : function(result){
    var customers = JSON.parse(result);
   /*  var tmp = '';
    
     for(var i = 0; i < customers.length; i++) {
		tmp += '<tr>';
		tmp += '<td>' + customers[i].customerId + '</td>';
		tmp += '<td>' + customers[i].customerName + '</td>';
		tmp +=  '<td> <button type="button" class="btn btn-primary"><i class="fa fa-eye"></i></button> ' +
                '<button type="button" class="btn btn-success"><i class="fa fa-edit"></i></button> '+
        '<button type="button" class="btn btn-danger"><i class="fa fa-trash-alt"></i></button> '+
		 '</td>';
		tmp += '</tr>';
		
    	
	} */
  //  $('#detailCustomer').html(tmp); 
   
    
/*     }
});   */

}); 
 
 
</script>
<body class="sb-nav-fixed">
  <jsp:include page="./navbar.jsp"></jsp:include>
  <jsp:include page="./sidebar.jsp"></jsp:include>
  	 <div id="layoutSidenav_content_upd">
         <div class="container-fluid">
          <div class="mt-4">
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/CustomerFrm">Customers</a></li>
                            <li class="breadcrumb-item active">List</li>
                        </ol>
         </div>
           <div class="mb-4">
              <a type="button" id="addBtn" class="btn btn-primary" href="<%=request.getContextPath()%>/RegisterFrm">Add Customer</a>
           </div>
           
            <div class="card mb-4">
                            <div class="card-header">
                            <p id = "para"></p>  
                            <i class="fas fa-table mr-1"></i>
                                 List
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
									              <th>Account Id</th>
									              <th>Account Name</th>
									              <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                  <th>Account Id</th>
									              <th>Account Name</th>
									              <th>Actions</th> 
                                            </tr>
                                        </tfoot>
                                        <tbody></tbody>
                                     
                                        <%-- <tbody id="detailCustomer">
                                          <c:set var = "method" scope = "session" value = "${Method}"/>
											<c:choose> 
											  <c:when test="${method == 'POST'}">
											    <tr>
									            <td>${CustomerId}</td>
									            <td>${CustomerName}</td>
									            <td>
									              <button type="button" class="btn btn-primary"><i class="fa fa-eye"></i></button>
									              <button type="button" class="btn btn-success"><i class="fa fa-edit"></i></button>
									              <button type="button" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
								               </td>
									       		</tr>
											  </c:when>
											<c:otherwise>
											     <c:forEach items="${ListCustomer}" var="customer">
											        <tr>
											            <td>${customer.customerId}</td>
											            <td>${customer.customerName}</td>
											            <td>
											              <button type="button" class="btn btn-primary"><i class="fa fa-eye"></i></button>
											              <button type="button" class="btn btn-success"><i class="fa fa-edit"></i></button>
											              <button type="button" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
								              			 </td>
											        </tr>
										   		 </c:forEach>
			 								 </c:otherwise>
											</c:choose>
                                        </tbody> --%>
                                    </table>
                                </div>
                            </div>
                        </div>
                        </div>
  	 </div>
</body>