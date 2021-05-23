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
        <link rel="stylesheet" href="studenthomeStyle.css" />
    </head>
    <body>
        <div class="header">
            <div></div>
            <h1 class="header-title">Review.io</h1>
            <div class="menu">
                <div class="title" onclick="f()"><i class="fas fa-user"></i> Account <span style="float:right;" class="fa fa-bars"></span>
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
                    <form class="search" action="SearchReviewer" method="post" autocomplete="off" class="form">
                        <input name="searchQuery" type="text" class="searchTerm" placeholder="Search for a topic" required>
                        <button type="submit" class="searchButton">
                          <i class="fa fa-search"></i>
                        </button>
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
                                        <button type="submit" class="btn" id="editBtn" formtarget="_blank"><i class="fas fa-download"></i></button>
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
        
        document.querySelector('.select-wrapper').addEventListener('click', function() {
            this.querySelector('.select').classList.toggle('open');
        })
        
        for (const option of document.querySelectorAll(".option")) {
            option.addEventListener('click', function() {
                if (!this.classList.contains('selected')) {
                    this.parentNode.querySelector('.option.selected').classList.remove('selected');
                    this.classList.add('selected');
                    this.closest('.select').querySelector('.select__trigger span').textContent = this.textContent;
                }
            })
        }
        window.addEventListener('click', function(e) {
            const select = document.querySelector('.select')
            if (!select.contains(e.target)) {
                select.classList.remove('open');
            }
        });
    </script>
</html>