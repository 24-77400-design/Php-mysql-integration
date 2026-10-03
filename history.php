<?php
session_start(); require 'config/database.php';
if(!isset($_SESSION['user_id'])){header('Location: login.php');exit;}
$s=$pdo->prepare('SELECT a.*,q.title FROM custom_attempts a JOIN custom_quizzes q ON q.id=a.quiz_id WHERE a.user_id=? ORDER BY a.started_at DESC');
$s->execute([$_SESSION['user_id']]); $rows=$s->fetchAll();
$pageTitle='Quiz History'; include 'includes/header.php';
?>
<h2>My Quiz History</h2><div class="card p-3"><div class="table-responsive"><table class="table align-middle"><thead><tr><th>Quiz</th><th>Score</th><th>Percentage</th><th>Status</th><th>Date</th></tr></thead><tbody>
<?php if(!$rows):?><tr><td colspan="5" class="text-muted">No quiz attempts yet.</td></tr><?php endif;?>
<?php foreach($rows as $r): $pct=$r['total_questions']?round($r['score']/$r['total_questions']*100):0;?><tr><td><?=htmlspecialchars($r['title'])?></td><td><?=$r['score']?>/<?=$r['total_questions']?></td><td><?=$pct?>%</td><td><?=$r['completed_at']?'Completed':'Not completed'?></td><td><?=htmlspecialchars($r['started_at'])?></td></tr><?php endforeach;?>
</tbody></table></div></div><?php include 'includes/footer.php';?>
