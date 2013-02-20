<%@page contentType="text/html;charset=utf-8" %>

<jsp:include page="header.jsp" flush="false" />

<div class="container">
	<table>
		<tr>
			<td>
				<div>
					<form method="post" action="connect_box.jsp">
						<input type="submit" value="submit"> 
					</form>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div>
					<form method="post" action="connect_dropbox.jsp">
						<input type="submit" value="submit"> 
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>

<jsp:include page="footer.jsp" flush="false" />