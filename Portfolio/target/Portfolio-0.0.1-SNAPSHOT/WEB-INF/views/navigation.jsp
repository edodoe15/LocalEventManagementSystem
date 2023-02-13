<!-- Navigation -->
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
                aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a class="navbar-brand">Event Application</a>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">

                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value="/" />">Home</a>
                </li>

                <!-- Only USER can access these urls -->
                <security:authorize access="hasRole('USER')">

                </security:authorize>

                <!-- Only ADMIN can access these urls -->
                <security:authorize access="hasRole('ADMIN')">
                     <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/users" />">Users</a>
                    </li>
                </security:authorize>

              <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dogadaj" />">Events</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/kategorija" />">Category</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/lokacija" />">Location</a>
                </li>

                <!-- Link will be visible if user is not authenticated -->
                <security:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/login" />">Login</a>
                    </li>
                </security:authorize>

                <!-- Link will be visible if user is authenticated -->
                <security:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/logout" />">Logout</a>
                    </li>
                </security:authorize>
            </ul>
        </div>
    </nav>
</header>