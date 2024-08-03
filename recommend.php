<!-- recommend.php -->
<?php
include 'db.php';

// Retrieve user input
$budgetRange = $_POST['budget'];
$preference = $_POST['preference'];

// Extract lower and upper bounds of budget range
list($minBudget, $maxBudget) = explode('-', $budgetRange);
// Debugging output
echo "Min Budget: $minBudget, Max Budget: $maxBudget";

// Prepare SQL statement
// Prepare SQL statement
$sql = "SELECT * FROM packages WHERE budget >= $minBudget AND budget <= $maxBudget AND preference = '$preference'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<div class='package'>";
        echo "<div class='package-details'>";
        echo "<p style='font-size: 18px; text-decoration: underline;'><strong>Package details</strong></p>";
        echo "<p><strong>Location:</strong> " . $row["location"] . "</p>";
        echo "<p><strong>Price:</strong> " . $row["price"] . "</p>";
        echo "<p><strong>Preference:</strong> " . $row["preference"] . "</p>";
        echo "<p><strong>Description:</strong> " . $row["description"] . "</p>";
        echo "<p><strong>Type:</strong> " . $row["type"] . "</p>";
        echo "<p><strong>Features:</strong> " . $row["features"] . "</p>";
        echo "<p><strong>Duration:</strong> " . $row["Duration"] . "</p>";
        echo "<p><strong>Best Time:</strong> " . $row["best time"] . "</p>";
        echo "<img src='" . $row["image_url"] . "' alt='Package Image'>";
        echo "</div></div>";
    }
} else {
    echo "No packages found matching your criteria.";
}
$conn->close();
?>
