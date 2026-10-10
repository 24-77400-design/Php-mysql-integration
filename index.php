<?php
session_start();

if (isset($_SESSION['user_id']) || isset($_SESSION['user'])) {
    header('Location: dashboard.php');
    exit;
}

$pageTitle = 'QuizCode';
include 'includes/header.php';
?>

<div class="hero text-center">
    <span class="badge bg-light text-dark rounded-pill px-3 py-2 mb-3">
        &lt;/&gt; Learn • Create • Challenge
    </span>
    <h1 class="display-3 fw-bold">Turn coding knowledge into a challenge.</h1>
    <p class="lead">
        Create timed quizzes about HTML, CSS, JavaScript, PHP and web development,
        then share a code so others can play.
    </p>
    <div class="mt-4">
        <a href="register.php" class="btn btn-light btn-lg me-2">Start Creating</a>
        <a href="login.php" class="btn btn-outline-light btn-lg">Login</a>
    </div>
</div>

<div class="row g-3 mt-2">
    <div class="col-md-4">
        <div class="card stat-card">
            <div class="icon-bubble">01</div>
            <h5>Create your quiz</h5>
            <p class="text-muted mb-0">
                Write your own questions or import computer trivia through the API.
            </p>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card stat-card">
            <div class="icon-bubble">⏱</div>
            <h5>Set per-item timers</h5>
            <p class="text-muted mb-0">
                Choose how many seconds players get for each individual question.
            </p>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card stat-card">
            <div class="icon-bubble">#</div>
            <h5>Share the code</h5>
            <p class="text-muted mb-0">
                Publish the quiz and let other users join using its unique code.
            </p>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>