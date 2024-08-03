<?php
// Function to sanitize user input
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["signup"])) {
    $username = test_input($_POST["signup-username"]);
    $email = test_input($_POST["signup-email"]);
    $password = test_input($_POST["signup-password"]);

    // Register user in the database
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    $sql = "INSERT INTO travel (username, email, password) VALUES ('$username', '$email', '$hashedPassword')";

    if ($conn->query($sql) === TRUE) {
        echo "Registration successful!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Signup Page</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" href="signup.css"> <!-- Assuming styles.css contains your signup form styles -->
</head>
<body>
<nav>
        <a href="index.php">Home</a>
    </nav>
<div class="box-form">
    <div class="left">
    

    <img src="pik/Travel-agency-logo-design-template-on-transparent-background-PNG.png" class="logo" width="70px">
        <div class="overlay">
        <h1>SAFARI</h1>
        <p>Where will your next adventure take you? Find out with us.</p>
        <span>
            <p>Join us today!</p>
        </span>
        </div>
    </div>
    
    
    <div class="right">
        <h5>Signup</h5>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <!-- Change the action to match your second code -->
        <p>Already have an account? <a href="login.php">Login here</a></p> <!-- Update the text for login link -->
        <div class="inputs">
            <input type="text" name="signup-username" placeholder="Username"> <!-- Change the name attribute to match your second code -->
            <br>
            <input type="email" name="signup-email" placeholder="Email"> <!-- Change the name attribute to match your second code -->
            <br>
            <input type="password" name="signup-password" placeholder="Password"> <!-- Change the name attribute to match your second code -->
        </div>
            
            <br><br>
            
        <div class="remember-me--forget-password">
            <!-- You might not need remember me checkbox in signup form -->
        </div>
            
            <br>
            <button type="submit">Signup</button>
    </div>
    
</div>
</body>
</html>

