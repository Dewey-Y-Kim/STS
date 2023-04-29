<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<style>
	.HolyGrail {
  display: flex;
  min-height: 100vh;
  flex-direction: column;
}

.HolyGrail-body {
  display: flex;
  flex: 1;
  
}
	.HolyGrail-content {
  flex: 1;
  background: green;
}

.HolyGrail-nav, .HolyGrail-ads {
  /* 12em은 열의 너비입니다. */
  flex: 0 0 12em;
background: yellow;
}
.header {
	background: lightblue;
}
.HolyGrail-nav {
  /* 좌측에 네비게이션을 놓습니다. */
  order: -1;
 background: blue; 
}
*{
	border: 1px blue solid;
}
	</style>
</head>
<body class="HolyGrail">
  <header class="header">Header</header>
  <div class="HolyGrail-body">
    <main class="HolyGrail-content">Main</main>
    <nav class="HolyGrail-nav">Nav</nav>
    <aside class="HolyGrail-ads">ASide</aside>
  </div>
  <footer class="Footer">Footer</footer>
</body>
</html>
