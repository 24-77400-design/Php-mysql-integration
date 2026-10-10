<?php
session_start();
require 'config/database.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$qid = (int)($_GET['id'] ?? 0);
$s = $pdo->prepare('SELECT * FROM custom_quizzes WHERE id=? AND is_published=1');
$s->execute([$qid]);
$quiz = $s->fetch();

if (!$quiz) {
    die('Quiz unavailable.');
}

$s = $pdo->prepare(
    'SELECT id,question_text,option_a,option_b,option_c,option_d,time_limit FROM custom_questions WHERE quiz_id=? ORDER BY id'
);
$s->execute([$qid]);
$questions = $s->fetchAll();

if (!$questions) {
    die('No questions.');
}

$a = $pdo->prepare('INSERT INTO custom_attempts(quiz_id,user_id,total_questions) VALUES(?,?,?)');
$a->execute([$qid, $_SESSION['user_id'], count($questions)]);
$attempt = $pdo->lastInsertId();
$pageTitle = 'Take Quiz';
include 'includes/header.php';
?>
<h2><?= htmlspecialchars($quiz['title']) ?></h2>
<div class="progress mb-3">
    <div id="progress" class="progress-bar"></div>
</div>
<div class="card p-4">
    <div class="d-flex justify-content-between">
        <span id="number"></span>
        <span class="badge text-bg-danger">Time: <span id="timer"></span>s</span>
    </div>
    <h4 id="question" class="my-4"></h4>
    <div id="choices" class="d-grid gap-2"></div>
</div>
<script>
    const questions = <?= json_encode($questions, JSON_HEX_TAG | JSON_HEX_AMP) ?>;
    const attempt = <?= $attempt ?>;
    let i = 0, tick;

    function show() {
        if (i >= questions.length) {
            location = 'custom_result.php?attempt=' + attempt;
            return;
        }

        let q = questions[i];
        document.getElementById('number').textContent =
            `Question ${i + 1} of ${questions.length}`;
        document.getElementById('question').textContent = q.question_text;
        document.getElementById('progress').style.width = ((i / questions.length) * 100) + '%';

        let box = document.getElementById('choices');
        box.innerHTML = '';
        ['A', 'B', 'C', 'D'].forEach(k => {
            let b = document.createElement('button');
            b.className = 'btn btn-outline-primary text-start';
            b.textContent = k + '. ' + q['option_' + k.toLowerCase()];
            b.onclick = () => submit(k, false);
            box.appendChild(b);
        });

        let left = parseInt(q.time_limit);
        document.getElementById('timer').textContent = left;
        clearInterval(tick);
        tick = setInterval(() => {
            left--;
            document.getElementById('timer').textContent = left;
            if (left <= 0) {
                clearInterval(tick);
                submit('', true);
            }
        }, 1000);
    }

    async function submit(answer, timeout) {
        clearInterval(tick);
        document.querySelectorAll('#choices button').forEach(b => b.disabled = true);
        await fetch('save_answer.php', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: new URLSearchParams({
                attempt_id: attempt,
                question_id: questions[i].id,
                answer,
                timed_out: timeout ? 1 : 0
            })
        });
        i++;
        show();
    }

    show();
</script><?php include 'includes/footer.php';?>