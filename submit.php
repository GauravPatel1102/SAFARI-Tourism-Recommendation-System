<?php
include 'db.php';

// Check if form fields are set
if(isset($_POST['age'], $_POST['phone_number'], $_POST['gender'], $_POST['preference'])) {
    // Get form data
    $age = $_POST['age'];
    $phone_number = $_POST['phone_number'];
    $gender = $_POST['gender'];
    $preference = $_POST['preference'];

    // Prepare SQL query
    $stmt = $conn->prepare("INSERT INTO user_details (age, phone_number, gender, preference) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("isss", $age, $phone_number, $gender, $preference);

    // Execute SQL query
    if ($stmt->execute()) {
        echo "Data inserted successfully.";
    } else {
        echo "Error: " . $conn->error;
    }

    // Close statement
    $stmt->close();
} 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details Form</title>
    <style>
        .container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9; /* Light gray background color */
    background-image: url('C:\Users\91701\OneDrive\Desktop\beach.jpg'); /* Add background image */
    background-size: cover;
    background-position: left;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle shadow effect */
}

label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold; /* Make labels bold for better readability */
}

input[type="number"],
input[type="tel"],
input[type="text"],
select {
    width: 100%;
    padding: 12px;
    margin-bottom: 15px; /* Increase margin-bottom for better spacing */
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 14px 28px; /* Increase padding for better button size */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease; /* Add smooth transition effect */
}

input[type="submit"]:hover {
    background-color: #45a049;
}

/* Add some styles for the heading */
h2 {
    margin-bottom: 20px;
    text-align: center;
    color: #333; /* Dark gray text color */
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Add a subtle text shadow */
}


    </style>
</head>
<body>
<nav>
        <a href="index.php">Home</a>
    </nav>
    <div class="container">
        <h2>User Details Form</h2>
        <form action="submit.php" method="post">
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required><br><br>

            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required><br><br>

            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select><br><br>

            <label for="preference">Preference:</label>
            <input type="text" id="preference" name="preference" required><br><br>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
