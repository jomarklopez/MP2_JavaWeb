<%@page import="nl.captcha.Captcha" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Review.io</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setHeader("Expires", "0"); //Proxies
            
            if(session.getAttribute("username") == null && session.getAttribute("role") == null)
            {
                response.sendRedirect("error_session.jsp");
            } 
        %>
        <div class="header">
            <div class="filler"></div>
            <h1 class="header-title">Review.io</h1>
            <div class="menu">
                <div class="title" onclick="f()"><i class="fas fa-user"></i><div class="text"> Account </div><bar class="fa fa-bars"></bar>
                  <div class="arrow"></div>
                </div>
                <div class="dropdown">
                  <p><i class="fas fa-user-lock"></i> <a name="changePass" class='myBtn' >Change Password</a></p>
                  <p><i class="fas fa-sign-out-alt"></i> <a name="signOut" onclick="window.location='LogoutServlet'" > Sign Out</a></p>
                </div>
            </div>
        </div>
        <div class="background"></div>
        <div class="content">
            <div class="content-header">
                <p class="content-title">Search: </p>
                <div class="search-wrap">
                    <div style="display:flex; flex-direction:column;">
                    <form class="search" action="SearchReviewer" method="post" autocomplete="off" class="form">
                        <input name="searchQuery" type="text" class="searchTerm" placeholder="Search for a topic" required>
                        <button type="submit" class="searchButton">
                          <i class="fa fa-search"></i>
                        </button>
                    </div>
                        <select class="select-language" name="languageSelect">
                            <option value="" disabled selected>Select a language</option>
                            <option value="filipino">Filipino</option>
                            <option value="english">English</span>
                            <option value="cebuano">Cebuano</span>
                            <option value="kapampangan">Kapampangan</option>
                            <option value="pangasinan">Pangasinan</option>
                        </select>
                    </form>
                </div>
            </div>
            <div class="reviewer-wrapper">
                <%
                    if(session.getAttribute("SuccessMessage") != null) {
                        out.print("<div class=\"alert\">"+ session.getAttribute("SuccessMessage") +"</div>");
                        session.removeAttribute("SuccessMessage");
                    }
                %>
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <table>
                    <tr>
                        <c:forEach items="${userReviewers}" var="reviewer" varStatus="loop">
                            <c:if test="${not loop.first and loop.index % 4 == 0}">
                                </tr>
                                <tr>
                            </c:if>
                            <td>
                                <div class="reviewer-card">
                                    <img src="data:image/jpg;base64,<c:out value="${reviewer.getBase64Image()}"/>" width="240" height="300"/>
                                    <div class="card-header">
                                        <p class="reviewer-title"><c:out value="${reviewer.getTitle()}"/></p>
                                        <p class="reviewer-author">by <c:out value="${reviewer.getAuthor()}"/> </p>
                                        <p class="reviewer-author"><c:out value="${reviewer.getLanguage()}"/> </p>
                                        <p class="reviewer-descriptionLabel">Description: </p>
                                        <p class="reviewer-description"><c:out value="${reviewer.getDescription()}"/> </p>
                                    </div>
                                    <form action="downloadreviewer" method="get">
                                        <input type="hidden" name="reviewer_title" value="${reviewer.getTitle()}">
                                        <input type="hidden" name="reviewer_author" value="${reviewer.getAuthor()}">
                                        <button type="submit" class="btn" formtarget="_blank"><i class="fas fa-download"></i></button>
                                    </form>
                                </div>
                            </td>
                        </c:forEach>
                    </tr>
                </table>
            </div>
        </div>
        <div id="changepasswordModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <form id="changepassForm" method="post" action="changepassword">
                    <div class="input-wrapper">
                        New password
                        <input class="form-input" type="password" id="newpass" name="newpass" size="10" required />
                    </div>
                    <div class="input-wrapper">
                        Confirm new password
                        <input class="form-input" type="password" id="confirmpass"  name="confirmpass" size="10" required />
                    </div>
                    <div class="form-actions">
                        <input class="btn" onclick="validatePassword()" type="button" value="Submit">
                        <input class="btn" type="reset" value="Clear" />
                    </div>
                </form>
            </div>
        </div>
    </body>
    
    <script>
        function validatePassword() {
            var changepassForm = document.getElementById("changepassForm");
            const password = document.getElementById("newpass").value;
            const password2 = document.getElementById("confirmpass").value;
            
            if (password !== password2) {
                alert('Password do not match. Confirm your password again');
            } else {
                changepassForm.submit();
            }
        }
        function f() {
            document.getElementsByClassName('dropdown')[0].classList.toggle('down');
            if (document.getElementsByClassName('dropdown')[0].classList.contains('down')) {
              document.getElementsByClassName('arrow')[0].classList.toggle('gone');
              setTimeout(function() {
                document.getElementsByClassName('dropdown')[0].style.overflow = 'visible'
              }, 500)
            } else {
              setTimeout(function() {
                document.getElementsByClassName('arrow')[0].classList.toggle('gone');
              }, 500)
              document.getElementsByClassName('dropdown')[0].style.overflow = 'hidden'
            }
        }
        
        // Get the modal
        var modal = document.getElementsByClassName("modal");

        // Get the button that opens the modal
        var btn = document.getElementsByClassName("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close");

        // When the user clicks the button, open the modal 
        btn[0].onclick = function() {
            modal[0].style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span[0].onclick = function() {
            modal[0].style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal[0]) {
                 modal[0].style.display = "none";
             }
        }
    </script>
    <style>
        html,body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        body {
            background-color: #FFFFFF;
        }


        .header {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            height: 13.5vw;
            width: 100%;
            background-color: #FFFFFF;
            text-align: center;
            position: relative;
            z-index: 10;
            box-shadow: rgb(50 50 93 / 25%) 0px 13px 27px -5px, rgb(0 0 0 / 30%) 0px 8px 16px -8px;
            font-family: 'Roboto', sans-serif;
        }

        .alert {
            background-color: #4ABDAC;
            border-radius: 4px;
            padding: 13px;
            color: white;
            font-family: 'Roboto', sans-serif;
            font-weight: 500;
        }

        .header-title {
            font-family: 'Roboto', sans-serif;
            font-size: 5.5vw;
            margin: 0;
            cursor: default;
            font-weight: 100;    
            align-self: center;
        }

        .background {
            position:absolute;
            width:100%;
            height: 50vh;
            background-color: #4ABDAC;
        }

        .btn {
            border-radius: 4px;
            background-color: #FFC534;
            border: none;
            color: #FFFFFF;
            text-align: center;
            font-size: 20px;
            padding: 10px;
            width: 100%;
            height: 50px;
            cursor: pointer;
            margin: 0px;
        }

        .btn span {
            cursor: pointer;
            display: inline-block;
            position: relative;
            transition: 0.5s;
        }

        .btn span:after {
            content: '\00bb';
            position: absolute;
            opacity: 0;
            top: 0;
            right: -20px;
            transition: 0.5s;
        }

        .btn:hover span {
            padding-right: 25px;
        }

        .btn:hover span:after {
            opacity: 1;
            right: 0;
        }

        .menu {
            width: 15vw;
            height: 4vw;
            padding: 10px;
            cursor: pointer;
            justify-self: end;
            margin-top: 15px;
            margin-right: 15px;
        }

        .menu i {
            float: left;
        }
        
        .menu bar {
            float: right;
        }

        .title {
            display: flex;
            justify-content: space-between;
            font-family: 'Roboto', sans-serif;
            width: 100%;
            height: 3.25vw;
            box-sizing: border-box;
            background: #FC4A1A;
            padding: 0.5vw;
            border-radius: 4px;
            position: relative;
            color: #FFFFFF;
            font-size: 2vw;
        }


        .dropdown {
            width: 100%;
            background: #fff;
            border-radius: 4px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            color: #505050;
            max-height: 0;
            overflow: hidden;
            transition: all 0.3s;
            margin-top: 24px;
        }

        .down {
            max-height: 150px;
        }

        .arrow {
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-bottom: 10px solid #fff;
            position: absolute;
            right: 20px;
            bottom: -24px;
            display: none;
        }

        .arrow.gone {
            display: block;
        }

        p {
            font-family: 'Roboto', sans-serif;
            padding: 15px 14px;
            margin: 0;
        }

        .menu p:hover {
            color: white;
            background: coral;
            -webkit-transform: scale(1.02);
            box-shadow: 0 0 30px -10px #000;
        }

        .content {
            position: relative;
            min-height: 500px;
            width: 75vw;
            background-color: white;
            margin: 0 auto;
            margin-top: 20px;
            border-radius: 12px;
            padding: 10px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
        }

        .content-title {
            font-family: 'Roboto', sans-serif;
            color: #4ABDAC;
            font-weight: 400;
        }


        .content-header {
            display: flex;
            flex-direction: row;
        }

        .content-header p {
            font-size: 5vh;
        }

        .search {
            width: 100%;
            position: relative;
            display: flex;
        }

        .searchTerm {
            width: 100%;
            border: 0px solid black;
            border-right: none;
            padding: 5px;
            height: 20px;
            border-radius: 5px 0 0 5px;
            outline: none;
            font-family: 'Roboto', sans-serif;
            box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 1px 1px 0px 1px;
            font-weight: 300;
        }

        .searchButton {
            width: 40px;
            height: 30px;
            border: 0px solid black;
            border-left: none;
            background: white;
            text-align: center;
            color: #0000004f;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-size: 20px;
            box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 1px 1px 0px 1px;
        }

        .search-wrap {
            width: 40%;
            align-self: center;
        }

        .select-language {
            width: 100%;
            padding: 5px;
            align-self: center;
            border: 0px solid black;
            border-radius: 5px;
            box-shadow: rgb(60 64 67 / 30%) 0px 1px 2px 0px, rgb(60 64 67 / 15%) 0px 1px 3px 1px;
            height: 30px;
        }

        optgroup {  
            font-family: 'Roboto', sans-serif;
            font-weight: 300;
        }


        .reviewer-wrapper {
            display: flex;
            overflow-y: auto;
        }

        .reviewer-wrapper table {
            border-spacing: 15px;
        } 

        .reviewer-card {
            display: flex;
            flex-direction: column;
            border-radius: 10px;
            padding: 10px;
            box-shadow: rgb(50 50 93 / 25%) 0px 2px 5px -1px, rgb(0 0 0 / 30%) 0px 1px 3px -1px;
        }

        .reviewer-card p {
            padding: 0
        }

        .reviewer-title {
            font-weight: 400;
            text-align: center;
            font-size: 1.5rem;
        }

        .reviewer-author {
            text-align: center;
            font-weight: 100;
        }

        .reviewer-descriptionLabel {
            font-weight: 400;
            margin-top: 10px;
        }

        .reviewer-description {
            font-weight: 100;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            width: 14em;
        }

        .reviewer-card .card-header {
            margin: 10px 0;
        }

        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 100; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

          /* Modal Content/Box */
        .modal-content {
            display: flex;
            flex-direction: column;
            font-family: 'Roboto', sans-serif;
            font-weight: 100;
            border-radius: 12px;
            background-color: #fefefe;
            padding: 20px;
            border: 1px solid #888;
            position: absolute;
            left: 50%;
            top: 50%;
            -webkit-transform: translateX(-50%) translateY(-50%);
            transform: translateX(-50%) translateY(-50%);
        }

        /* The Close Button */
        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            align-self: flex-end;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-content textarea {
            resize: none;
            width: 100%;
            font-family: 'Roboto', sans-serif;
            font-weight: 500;
        }

        .modal-content input {
            font-family: 'Roboto', sans-serif;
            font-weight: 500;
        }

        .modal-content .form-actions{
            text-align: end;
        }


        .fileupload-btns {
            display: flex;
            flex-direction: row;
        }

        .form-input {
            font-family: 'Roboto', sans-serif;
            width: 100%;
            padding: 5px 0;
            font-size: 16px;
            color: #000;
            border: none;
            border-bottom: 1px solid #000;
            outline: none;
            background: transparent;
        }

        .input-wrapper {
            margin-bottom: 20px;
        }
        
        .text{
            font-size: 1.75vw;
        }
        
        .form-actions .btn {
            border-radius: 4px;
            background-color: #FFC534;
            border: none;
            color: #FFFFFF;
            text-align: center;
            font-size: 20px;
            padding: 10px;
            width: 200px;
            height: 50px;
            cursor: pointer;
            margin: 5px;
        }

        @media (max-width: 768px) {
            
            .search {
                width: 100%;
                position: relative;
            }
            
            .content {
                position: relative;
                min-height: 500px;
                width: 90vw;
                background-color: white;
                margin: 0 auto;
                margin-top: 20px;
                border-radius: 12px;
                padding: 10px;
                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            }
            
            .header {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                height: 16.5vw;
                width: 100%;
                background-color: #FFFFFF;
                text-align: center;
                position: relative;
                z-index: 10;
                box-shadow: rgb(50 50 93 / 25%) 0px 13px 27px -5px, rgb(0 0 0 / 30%) 0px 8px 16px -8px;
                font-family: 'Roboto', sans-serif;
            }
            
            .filler {
                display:none;
            }
            
            .select-language {
                width: 100%;
                padding: 5px;
                align-self: center;
                border: 0px solid black;
                border-radius: 5px;
                box-shadow: rgb(60 64 67 / 30%) 0px 1px 2px 0px, rgb(60 64 67 / 15%) 0px 1px 3px 1px;
                height: 30px;
            }
            
            .menu {
                align-self: center;
                width: 35vw;
                height: 8vw;
                cursor: pointer;
                justify-self: end;
            }
            
            .title {
                align-items: center;
                display: flex;
                justify-content: space-between;
                font-family: 'Roboto', sans-serif;
                width: 100%;
                height: 100%;
                box-sizing: border-box;
                background: #FC4A1A;
                padding: 0.5vw;
                border-radius: 4px;
                position: relative;
                color: #FFFFFF;
                font-size: 2vw;
            }
            
            .modal-content {
                background-color: #fefefe;
                margin: 0 auto; 
                position: relative;
                top: 50%;
                transform: translateY(-50%);
                padding: 20px;
                border: 1px solid #888;
                max-width: 75%; 
            }

            .card {
                margin: 10px 20px;
                width: calc(100% - 40px);
            }
            
            .content-header p{
                display: none;
            }
            
            .menu i{
                margin: 0 auto;
                font-size: 6.5vw;
            }
            
            .menu bar {
                display: none;
            }
            
            .search-wrap {
                width: 100%;
                align-self: center;
            }
            
            .text{
                display:none;
            }
        }
        </style>
        
</html>