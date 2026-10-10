<?php
session_start();
require 'config/database.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $code = strtoupper(trim($_POST['code']));
    $s = $pdo->prepare('SELECT id FROM custom_quizzes WHERE join_code=? AND is_published=1');
    $s->execute([$code]);
    $q = $s->fetch();

    if ($q) {
        header('Location: take_quiz.php?id=' . $q['id']);
        exit;
    }

    $err = 'Invalid or unpublished quiz code.';
}

$pageTitle = 'Join Quiz';
include 'includes/header.php';
?>
<div class="mx-auto" style="max-width:500px">
    <h2>Join a Quiz</h2>
    <?php if (isset($err)): ?>
        <div class="alert alert-danger"><?= $err ?></div>
    <?php endif; ?>
    <form method="post" class="card p-4">
        <input name="code" required class="form-control form-control-lg text-uppercase"
            placeholder="Enter join code">
        <button class="btn btn-primary mt-3">Join</button>
    </form>
</div>
<?php include 'includes/footer.php'; ?>