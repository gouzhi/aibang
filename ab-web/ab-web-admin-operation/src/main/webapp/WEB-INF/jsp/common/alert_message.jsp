<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${!empty message}"> 
  <script type="text/javascript">
   alert("${message}");
   </script>
</c:if> 
   