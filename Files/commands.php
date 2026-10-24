<?php
$output = '';
$cmd_input = '';

if (isset($_POST['cmd'])) {
    // Get user input
    $cmd_input = $_POST['cmd'];

    // Basic sanitization: only allow alphanumeric, space, dash, underscore
    if (preg_match('/^[a-zA-Z0-9_\- ]+$/', $cmd_input)) {
        // Execute command
        $output = shell_exec($cmd_input);
    } else {
        $output = "Invalid characters in command!";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Server Command Output</title>
</head>
<body>
    <h1>Run a Command</h1>
    <form method="post">
        <input type="text" name="cmd" value="<?php echo htmlspecialchars($cmd_input); ?>" style="width:300px;">
        <input type="submit" value="Run">
    </form>

    <?php if ($output !== ''): ?>
        <h2>Output:</h2>
        <pre><?php echo htmlspecialchars($output); ?></pre>
    <?php endif; ?>
</body>
</html>

