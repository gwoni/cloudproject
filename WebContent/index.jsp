<%@page contentType="text/html;charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*,javax.sql.*"%>

<jsp:include page="header.jsp"  />

<div class="container">
		
      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
        <p>
        	당신을 위한 새로운 서비스가 준비가 되어 있습니다.<br/>
        	기존에 쓰던 클라우드 서비스를 묶어보세요.
        </p>
        <p><a href="#" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
        <img src="img/mainimg.jpg" width="900" height="414" alt="메인화면" />
      </div>

      <!-- Example row of columns -->
      <div class="row">
        <div class="span4">
          <h2>Cloud Herb</h2>
          <p>하나 계정을 통해서 타 클라우드를 합칠수 있습니다. 지금까지 분산된 클라우드 컨텐츠를 모두 합쳐보십시오 </p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
        </div>
        <div class="span4">
          <h2>편리한 사용</h2>
          <p>간단한 로그인과정을 통해 클라우드를 통합할수 시있습니다. 지금 한번 시도해 보십시오.</p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
       </div>
        <div class="span4">
          <h2>광범위한 공유</h2>
          <p>나의 클라우드 간의 공유 뿐만 아니라 친구 또는 동료의 클라우드 간 공유도 가능합니다. </p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
        </div>
      </div>  

  <jsp:include page="footer.jsp"  />