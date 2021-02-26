<!DOCTYPE html>

<html>
    <head>
        <title>Libra Web App</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jura:wght@300&display=swap" rel="stylesheet">     
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <header>
            <div class="libra-container">
                <div class='star libra-star-1'></div>
                <div class='star libra-star-2'></div>
                <div class='star libra-star-3'></div>
                <div class='star libra-star-4'></div>
                <div class='star libra-star-5'></div>
                <div class='star libra-star-6'></div>
                <div class='star libra-star-7'></div>
                <div class="line libra-line-1"></div>
                <div class="line libra-line-2"></div>
                <div class="line libra-line-3"></div>
                <div class="line libra-line-4"></div>
                <div class="line libra-line-5"></div>
                <div class="line libra-line-6"></div>
                <div class="line libra-line-7"></div>
            </div>
            <h2>Project: LIBRA</h2>
        </header>
        <div class="login-container">
            <form action="LoginServlet" method="post" autocomplete="off" class="form">
                <div class='control block-cube block-input'>
                    <input name='username' placeholder='Username' type='text'>
                    <div class='bg-top'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='bg-right'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='bg'>
                        <div class='bg-inner'></div>
                    </div>
                </div>
                <div class='control block-cube block-input'>
                    <input name='password' placeholder='Password' type='password'>
                    <div class='bg-top'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='bg-right'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='bg'>
                        <div class='bg-inner'></div>
                    </div>
                </div>
                <button class='btn block-cube block-cube-hover' type='submit' name="role" value="admin">
                    <div class='bg-top'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='bg-right'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='bg'>
                        <div class='bg-inner'></div>
                    </div>
                    <div class='text'>
                      Log In
                    </div>
                </button>
            </form>
        </div>
        <div class='stars'></div>
        <div class='stars2'></div>
</html>