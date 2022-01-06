<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style>
		*{
			margin: 0; padding: 0;
		}
		html, body{
			width: 100%; height: 100%;
		}
		
		header{
			width: 100%; height: 15%;
			color: white; background-color: blue;
			text-align: center; 
			display: table;
		}header h1{
			display: table-cell;
			vertical-align: middle;
		}
		
		nav{
			width: 100%; height: 5%;
			color: white; background-color: purple;
			text-align: center; 
			display: table;
		}nav ul{
			display: table-cell;
			vertical-align: middle;
			list-style: none;
		}nav ul li{
			display: inline-block;
			margin: 0 20px;
		}nav ul li a{
			text-decoration: none;
			color: white; 
			font-weight: bold;			
		}nav ul li a:HOVER{
			color: red; 
			font-weight: bold;
		}
		
		section{
			width: 100%; height: 75%;
			color: black; background-color: lightgray; 
		}section h2{
			text-align: center;
			padding: 20px 0;
		}section p{
			padding-left: 20px;
			padding-bottom: 10px;
			font-weight: bold;
		}section ol{
			padding-left: 40px;
		}
		
		footer{
			width: 100%; height: 5%;
			color: white; background-color: blue;
			text-align: center; 
			display: table;
		}footer h3{
			display: table-cell;
			vertical-align: middle;
		}
		
	</style>
	<style>
		table{
			border: 3px solid black;
			margin: 0 auto;
		}tr,th,td{
			border: 1px solid black;
		}
		
		#m_s_table td{
			text-align: center;
		}#m_s_table tr{
			height: 30px;
		}
		#p_s_table td{
			text-align: center;
		}#p_s_table tr{
			height: 30px;
		}
		#o_s_table td{
			text-align: center;
		}#o_s_table tr{
			height: 30px;
		}#no{
			padding-left: 10%; 
		}
		input[readonly]{
			background-color: lightgray;
		}
		
	</style>
</head>
<body>
	<header>
		<h1>(과정평가형 정보처리 산업기사) 웹 쇼핑몰 관리 시스템 ver1.0</h1>
	</header>
</body>
</html>