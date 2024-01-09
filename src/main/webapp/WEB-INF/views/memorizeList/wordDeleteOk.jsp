<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute( "flag" );

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('삭제 완료!');" );
		// 현재 페이지를 이전 페이지로 대체 : reload도 되는듯,,
        out.println("window.location.replace(document.referrer);");
	} else {
		out.println( "alert('삭제 실패,,');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>
