<?php
session_start();
require 'config/database.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$id = (int)($_GET['attempt'] ?? 0);
$s = $pdo->prepare(
    'SELECT a.*,q.title FROM custom_attempts a JOIN custom_quizzes q ON q.id=a.quiz_id WHERE a.id=? AND a.user_id=?'
);
$s->execute([$id, $_SESSION['user_id']]);
$a = $s->fetch();

if (!$a) {
    die('Result not found');
}

$s = $pdo->prepare('SELECT COUNT(*) FROM custom_answers WHERE attempt_id=? AND is_correct=1');
$s->execute([$id]);
$score = (int)$s->fetchColumn();
$pdo->prepare('UPDATE custom_attempts SET score=?,completed_at=NOW() WHERE id=?')
    ->execute([$score, $id]);

$pageTitle = 'Result';
include 'includes/header.php';
?>
<div class="text-center card p-5">
    <h2><?= htmlspecialchars($a['title']) ?></h2>
    <h1><?= $score ?> / <?= $a['total_questions'] ?></h1>
    <p><?= round($score / max(1, $a['total_questions']) * 100) ?>%</p>
    <a href="dashboard.php" class="btn btn-primary">Dashboard</a>
</div>
<?php include 'includes/footer.php'; ?>