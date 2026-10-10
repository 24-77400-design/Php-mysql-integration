<?php
session_start();

if (!isset($_SESSION['user']) || !isset($_SESSION['last_result'])) {
    header('Location: dashboard.php');
    exit;
}

$r = $_SESSION['last_result'];
$pct = round($r['score'] / 25 * 100);
$title = 'Quiz Result';
include 'includes/header.php';
?>
<div class="row justify-content-center">
    <div class="col-md-7">
        <div class="card p-5 text-center">
            <h1>Quiz Complete!</h1>
            <div class="display-2 fw-bold my-3"><?= $r['score'] ?>/25</div>
            <h3><?= $pct ?>%</h3>
            <p>Correct: <?= $r['score'] ?> &nbsp; | &nbsp; Wrong: <?= 25 - $r['score'] ?></p>
            <a href="dashboard.php" class="btn btn-dark">Back to Dashboard</a>
        </div>
    </div>
</div>
<?php include 'includes/footer.php'; ?>
