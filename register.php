<?php
session_start();
require 'config/database.php';
$error=''; $name=''; $email='';
if($_SERVER['REQUEST_METHOD']==='POST'){
    $name=trim($_POST['name'] ?? '');
    $email=strtolower(trim($_POST['email'] ?? ''));
    $pw=$_POST['password'] ?? '';
    if($name==='' || !filter_var($email,FILTER_VALIDATE_EMAIL) || strlen($pw)<4){
        $error='Please enter a valid name, email, and password with at least 4 characters.';
    } else {
        $check=$pdo->prepare('SELECT id FROM users WHERE LOWER(email)=? LIMIT 1');
        $check->execute([$email]);
        if($check->fetch()) $error='Email is already registered.';
        else {
            $s=$pdo->prepare('INSERT INTO users(name,email,password) VALUES(?,?,?)');
            $s->execute([$name,$email,password_hash($pw,PASSWORD_DEFAULT)]);
            header('Location: login.php?registered=1'); exit;
        }
    }
}
$pageTitle='Register'; include 'includes/header.php';
?>
<div class="row justify-content-center"><div class="col-md-5"><div class="card p-4"><h2>Create Account</h2>
<?php if($error):?><div class="alert alert-danger"><?=htmlspecialchars($error)?></div><?php endif;?>
<form method="post">
<input class="form-control mb-3" name="name" value="<?=htmlspecialchars($name)?>" placeholder="Full name" autocomplete="name" required>
<input class="form-control mb-3" type="email" name="email" value="<?=htmlspecialchars($email)?>" placeholder="Email" autocomplete="email" required>
<input class="form-control mb-3" type="password" name="password" placeholder="Password (min. 4 characters)" autocomplete="new-password" minlength="4" required>
<button class="btn btn-dark w-100" type="submit">Register</button></form>
<p class="mt-3 mb-0">Already registered? <a href="login.php">Login</a></p></div></div></div>
<?php include 'includes/footer.php'; ?>
