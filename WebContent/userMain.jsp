<%@page contentType="text/html;charset=utf-8" %>
<%@ page import="com.dropbox.client2.session.*" %>
<%@ page import= "com.dropbox.client2.DropboxAPI" %>

<%
String name=(String)session.getAttribute("loginid");
if(name == null)
	response.sendRedirect("/login.jsp");
%>
<%
DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");
if(mdb!=null){
%>
<%--
<jsp:include page="/dropbox/updatefile.jsp"  />
--%>
<%
}
%>
<script language="JavaScript" src="/js/script.js"></script>

<div class="container">
    <div class="row">
        
      <div class="span4">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              
              <li class="active"><a href="#">Docking Cloud</a></li>
              <li class="nav-header">My cloud</li>
              
              <li class="nav-header">All my file</li>
              <li><a href="#">Recent</a></li>
              <li><a href="#">Documents</a></li>
              <li><a href="#">Photos</a></li>
              <li><a href="#">Music</a></li>
              <li><a href="#">Videos</a></li>
              <li class="nav-header">Shared</li>
              
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
     </div>
     <div class="span6">
        
          <div class="widget">
						
					<div class="widget-header">
						<i class="icon-star"></i>
						<h3>Storage Stats</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
						
						<div class="stats">
							
							<div class="stat">
								<span class="stat-value">1,024</span>									
								Total storage (GB)
							</div> <!-- /stat -->
							
							<div class="stat">
								<span class="stat-value">100</span>									
								Use storage (KB)
							</div> <!-- /stat -->
							
							<div class="stat">
								<span class="stat-value">9.77%</span>									
								Use storage percent
							</div> <!-- /stat -->
							
						</div> <!-- /stats -->
				
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->	
				
				<div class="widget widget-table action-table">
						
					<div class="widget-header">
						<i class="icon-th-list"></i>
						<h3>cloud storage file Table</h3>
						<a class="btn" href="#">Move </a>
					 	<button class="btn" onClick="OnCheck()">폴더 만들기</button>
					 	
					</div> <!-- /widget-header -->
					
					
					
					<div class="widget-content">
						
						<table class="table table-striped table-bordered">
							<thead>				
								<tr>
									<th>cloud</th>
									<th>file name</th>
									<th class="td-actions">down road</th>
								</tr>
							</thead>
							<tbody>
							
								<%
								if(mdb!=null){
								%>
								<jsp:include page="/dropbox/main_dropbox.jsp"  />
								<%
								}
								%>
								
								
								<tr>
									<td>box.net</td>
									<td>sample file0</td>
									<td class="td-actions">
										<a href="javascript:;" class="btn btn-small btn-warning">
											<i class="btn-icon-only icon-ok"></i>										
										</a>
										
										<a href="javascript:;" class="btn btn-small">
											<i class="btn-icon-only icon-remove"></i>										
										</a>
									</td>
								</tr>
								<tr>
									<td>box.net</td>
									<td>sample file1</td>
									<td class="td-actions">
										<a href="javascript:;" class="btn btn-small btn-warning">
											<i class="btn-icon-only icon-ok"></i>										
										</a>
										
										<a href="javascript:;" class="btn btn-small">
											<i class="btn-icon-only icon-remove"></i>										
										</a>
									</td>
								</tr>
								
								</tbody>
							</table>
						
					</div> <!-- /widget-content -->
				<div class="widget-header">
							<form action="/dropbox/dropbox_uploadfile.jsp" enctype="multipart/form-data" method="post">
							 	 <input type="file" name="upfile" >
								 <input type="submit" value="Upload">
							</form>
								 
					</div> <!-- /widget-header -->
				</div> <!-- /widget -->
        </div><!--/span-->
   </div>
</div>



