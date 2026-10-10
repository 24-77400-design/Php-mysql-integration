<?php
session_start();
require 'config/database.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$s = $pdo->prepare(
    'SELECT q.*,(SELECT COUNT(*) FROM custom_questions cq WHERE cq.quiz_id=q.id) items FROM custom_quizzes q WHERE creator_id=? ORDER BY created_at DESC'
);
$s->execute([$_SESSION['user_id']]);
$rows = $s->fetchAll();
$pageTitle = 'My Quizzes';
include 'includes/header.php';
?>
<h2>My Quizzes</h2>
<div class="row g-3">
    <?php foreach ($rows as $q): ?>
        <div class="col-md-6">
            <div class="card p-3">
                <h5><?= htmlspecialchars($q['title']) ?></h5>
                <p class="mb-1">
                    Code: <b><?= $q['join_code'] ?></b> · <?= $q['items'] ?> items
                </p>
                <p><?= $q['is_published'] ? 'Published' : 'Draft' ?></p>
                <a class="btn btn-sm btn-primary" href="edit_quiz.php?id=<?= $q['id'] ?>">Edit</a>
            </div>
        </div>
    <?php endforeach; ?>
</div>
<?php include 'includes/footer.php'; ?>