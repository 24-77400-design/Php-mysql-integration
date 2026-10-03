<?php
session_start();
require 'config/database.php';

if (isset($_SESSION['user_id'])) {
    header('Location: dashboard.php');
    exit;
}

$error = '';
$email = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = strtolower(trim($_POST['email'] ?? ''));
    $password = $_POST['password'] ?? '';

    if (!filter_var($email, FILTER_VALIDATE_EMAIL) || $password === '') {
        $error = 'Please enter your email and password.';
    } else {
        $s = $pdo->prepare('SELECT id, name, email, password, role FROM users WHERE LOWER(email) = ? LIMIT 1');
        $s->execute([$email]);
        $u = $s->fetch();

        if ($u && password_verify($password, $u['password'])) {
            session_regenerate_id(true);
            // One canonical session format, plus legacy user array for older built-in quiz pages.
            $_SESSION['user_id'] = (int)$u['id'];
            $_SESSION['user_name'] = $u['name'];
            $_SESSION['user_email'] = $u['email'];
            $_SESSION['role'] = $u['role'];
            $_SESSION['user'] = [
                'id' => (int)$u['id'],
                'name' => $u['name'],
                'email' => $u['email'],
                'role' => $u['role']
            ];
            header('Location: dashboard.php');
            exit;
        }
        $error = 'Invalid email or password.';
    }
}
$pageTitle='Login';
include 'includes/header.php';
?>
<div class="row justify-content-center"><div class="col-md-5"><div class="card p-4">
<h2>Welcome Back</h2>
<?php if(isset($_GET['registered'])):?><div class="alert alert-success">Account created. You can now log in.</div><?php endif;?>
<?php if($error):?><div class="alert alert-danger"><?=htmlspecialchars($error)?></div><?php endif;?>
<form method="post">
<input class="form-control mb-3" type="email" name="email" value="<?=htmlspecialchars($email)?>" placeholder="Email" autocomplete="email" required>
<input class="form-control mb-3" type="password" name="password" placeholder="Password" autocomplete="current-password" required>
<button class="btn btn-dark w-100" type="submit">Login</button>
</form><p class="mt-3 mb-0">No account? <a href="register.php">Register</a></p>
</div></div></div>
<?php include 'includes/footer.php'; ?>
