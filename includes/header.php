<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title><?= htmlspecialchars($pageTitle ?? $title ?? 'QuizCode') ?></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center"
                    href="<?= isset($_SESSION['user_id']) ? 'dashboard.php' : 'index.php' ?>">
                    <span class="brand-mark">&lt;/&gt;</span>QuizCode
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#mainNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mainNav">
                    <div class="navbar-nav ms-auto align-items-lg-center gap-lg-1">
                        <?php if (isset($_SESSION['user_id'])): ?>
                            <a class="nav-link" href="dashboard.php">Home</a>
                            <a class="nav-link" href="create_quiz.php">Create Quiz</a>
                            <a class="nav-link" href="my_quizzes.php">My Quizzes</a>
                            <a class="nav-link" href="join.php">Join Quiz</a>
                            <a class="nav-link" href="history.php">History</a>
                            <a class="nav-link" href="logout.php">Logout</a>
                        <?php else: ?>
                            <a class="nav-link" href="login.php">Login</a>
                            <a class="btn btn-sm btn-light ms-lg-2" href="register.php">Get Started</a>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </nav>
        <main class="container py-4 py-md-5">
