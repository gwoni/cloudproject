<%@page contentType="text/html;charset=utf-8" %>

<jsp:include page="header.jsp" flush="false" />

<div class="container">
	<table>
		<tr>
			<td>
				<div>
					<form method="post" action="connect_box.jsp">
						<input class="btn btn-large btn-primary" type="submit" value="Box.net	연결"> 
					</form>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div>
					<form method="post" action="connect_dropbox.jsp">
						<input class="btn btn-large btn-primary" type="submit" value="Drop Box	연결"> 
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>

<jsp:include page="footer.jsp" flush="false" />