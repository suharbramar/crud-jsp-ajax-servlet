<aside>
          <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div> 
                            <a class="nav-link active" data-rel="1" href="<%=request.getContextPath()%>/Home">
                                <div class="sb-nav-link-icon"><li class="fas fa-tachometer-alt"></li></div>
                                Dashboard 
                            </a>
                            <div class="sb-sidenav-menu-heading">Customers</div>
                            <a class="nav-link" data-rel="2" href="<%=request.getContextPath()%>/CustomerFrm">
                                <div class="sb-nav-link-icon"><li class="fas fa-columns"></li></div>
                                List
                                <!-- <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div> -->
                            </a>
                             <a class="nav-link" data-rel="3" href="tables.html">
                                <div class="sb-nav-link-icon">
                                   <li class="fas fa-table">
                                  </li>
                                </div>
                                Tables  
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Admin
                    </div>
                </nav>
            </div>
        </div>
</aside>