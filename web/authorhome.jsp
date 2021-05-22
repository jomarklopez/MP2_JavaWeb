<%@page import="model.Reviewer"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="authorhomeStyle.css" />
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
                  <p><i class="fas fa-user-edit"></i> Profile</p>
                  <p><i class="fas fa-user-lock"></i> <a name="changePass" onclick="window.location='ChangeServlet'" >Change Password</a></p>
                  <p><i class="fas fa-sign-out-alt"></i> <a name="signOut" onclick="window.location='LogoutServlet'" > Sign Out</p>
                </div>
            </div>
        </div>
        <div class="background"></div>
        <div class="content">
            <div class="content-header">
                <p class="content-title">My Reviewers: </p>
                <button id='mdlBtn' class='btn' type='submit' name="login">
                    <i class="fas fa-upload"></i>
                    Upload Reviewer
                </button>
                <div class="alert alert-success">
                    <strong>
                        <%
                            if(request.getAttribute("SuccessMessage") != null) {
                                request.getAttribute("SuccessMessage");
                            }
                        %>
                    </strong>
                </div>
            </div>
            <div class="reviewer-wrapper">
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
                                        <p class="reviewer-author">by <c:out value="${username}"/> </p>
                                        <p class="reviewer-descriptionLabel">Description: </p>
                                        <p class="reviewer-description">De<c:out value="${reviewer.getDescription()}"/></p>
                                    </div>
                                </div>
                            </td>
                        </c:forEach>
                    </tr>
                </table>
            </div>
        </div>
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <form method="post" action="upload" enctype="multipart/form-data">
                    <div class="input-wrapper">
                        Title: 
                        <input class="form-input"type="text" name="title" size="10" required />
                    </div>
                    <div class="input-wrapper">
                        Subject: 
                        <input class="form-input"type="text" name="subject" size="10" required />
                    </div>
                    <div class="input-wrapper">
                        Language: 
                        <input class="form-input"type="text" name="language" size="10" required />
                    </div>
                    <div class="input-wrapper">
                        Description: 
                        <textarea id="desc-textArea" name="description" rows="10" cols="70"></textarea>
                    </div>
                    <div class="input-wrapper fileupload-btns">
                        <div>
                        Upload Preview Image:<br>
                        <input type="file" name="file_image" size="10" required/></div>
                        <div>
                        Upload PDF:<br>
                        <input type="file" name="file_data" size="10" required/></div>
                    </div>
                    <div class="form-actions">
                        <input class="btn" type="submit" value="Upload">
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
        
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("mdlBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on the button, open the modal
        btn.onclick = function() {
          modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
          modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }
    </script>
</html>