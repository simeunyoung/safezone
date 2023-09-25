<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>whou</title>

    <!-- Custom fonts for this template-->
    
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/safezone/admin/admin">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">SafeZone Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- 
            <li class="nav-item active">
                <a class="nav-link" href="/safezone/cs/admin">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>AdminPage</span></a>
                    
            </li> -->
            
            
            
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                CS
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/safezone/admin/inquiry" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <span>문의</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/whou/cs/faq" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>설치/고장</span>
                </a>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/whou/cs/faq" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>커뮤니티</span>
                </a>
            </li>
            
            <hr class="sidebar-divider">
			<!-- Heading -->
            <div class="sidebar-heading">
                admin
            </div>
            <li class="nav-item">
                <a class="nav-link" href="/safezone/admin/adminList">
                    <span>관리자 리스트</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/safezone/admin/adminJoin">
                    <span>관리자 계정 추가</span></a>
            </li>
<!-- 
            Divider
            <hr class="sidebar-divider">

            Heading
            <div class="sidebar-heading">
                AI
            </div>

            <li class="nav-item">
                <a class="nav-link collapsed" href="/whou/assistant/ai" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <span>ChatBot</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/whou/assistant/aiList">
                    <span>ChatBotList</span></a>
            </li>
            Divider
            <hr class="sidebar-divider d-none d-md-block">
                     Divider
           

            Heading
            <div class="sidebar-heading">
                Search
            </div>
            <li class="nav-item">
                <a class="nav-link" href="/whou/cs/searchDetail">
                    <span>SearchDetail</span></a>
            </li> -->            
            
                       
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <div class="input-group-append">
		                        <a href="/safezone/main">메인화면</a> <!-- 로고를 넣자 -->
								<i class="fas fa-search fa-sm"></i>
                            </div>
                        </div>
                    </form>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">CS</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                문의</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<a href="/whou/cs/noticeWriteForm">관리</a>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                설치/고장</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<a href="/whou/cs/faqWriteForm">관리</a>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            	커뮤니티
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<a href="/whou/assistant/aiList">관리</a>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                    
                    
                    
                    <%-- <h3>Search Top 5</h3>
                    <input type="button" value="오늘" class="dateSel btn btn-secondary" data-name="today" />
                    <input type="button" value="일주일" class="dateSel btn btn-secondary" data-name="week" />
                    <input type="button" value="한달" class="dateSel btn btn-secondary" data-name="month" />
                    <form action="/whou/cs/admin" method="post">
                    	<c:if test="${endDate == null}">
                    		<input type="date" name="startDate" value="${now}" id="startDate"/>
                    	</c:if>
                    	<c:if test="${endDate != null }">
                    		<input type="date" name="startDate" value="${startDate}" id="startDate"/>
                    	</c:if>
                    		<input type="date" name="endDate" value="${endDate}" id="endDate" required="required"/>
                    		<input type="hidden" name="jobDateSelect" value="notNull"/>
                    		<input type="submit" class="btn btn-secondary" value="조회"/>
                    	</form><br/>
					<div class="col-xl-4 col-lg-5" style="width:300px; float:left;">
						<div class="card shadow mb-4" >
							<!-- Card Header - Dropdown -->
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">직업</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie pt-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
									<canvas id="job-chart" width="300" height="300" style="display: block; height: 216px; width: 382px;" class="chartjs-render-monitor"></canvas>
								</div>
								<hr>
								<c:if test="${empty searchJobList}"> list null처리
									조회된 직업 데이터가 없습니다.
								</c:if>
							</div>
						</div>
					</div>--%>
					
					<!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">ADMIN</h1>
                    </div>
                    
					<div class="col-xl-4 col-lg-5" style="width:100%; float:left;">
						<div class="card shadow mb-4" >
							<!-- Card Header - Dropdown -->
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">관리자 계정 리스트</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie pt-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
									<canvas id="key-chart" width="300" height="300" style="display: block; height: 216px; width: 382px;" class="chartjs-render-monitor"></canvas>
								</div>
							<hr>
							<c:if test="${empty searchKeyList}">
								조회된 검색어 데이터가 없습니다.                    
							</c:if>
							</div>
						</div>
					</div>
					
					
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>

</body>

</html>