<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute( "flag" );

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('단어 추가 완료!');" );
		out.println( "history.back();" );
	} else {
		out.println( "alert('단어 추가 실패,,');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>
