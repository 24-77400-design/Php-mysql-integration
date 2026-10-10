<?php
session_start();
require 'config/database.php';
header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(['ok' => false, 'error' => 'Login required']);
    exit;
}

$aid = (int)($_POST['attempt_id'] ?? 0);
$qid = (int)($_POST['question_id'] ?? 0);
$answer = strtoupper(trim($_POST['answer'] ?? ''));
$timedOut = !empty($_POST['timed_out']) ? 1 : 0;

if ($answer !== '' && !in_array($answer, ['A', 'B', 'C', 'D'], true)) {
    http_response_code(422);
    echo json_encode(['ok' => false, 'error' => 'Invalid answer']);
    exit;
}

$check = $pdo->prepare(
    'SELECT ca.id,ca.started_at,cq.correct_answer,cq.time_limit FROM custom_attempts ca JOIN custom_questions cq ON cq.quiz_id=ca.quiz_id WHERE ca.id=? AND ca.user_id=? AND ca.completed_at IS NULL AND cq.id=?'
);
$check->execute([$aid, $_SESSION['user_id'], $qid]);
$row = $check->fetch();

if (!$row) {
    http_response_code(403);
    echo json_encode(['ok' => false, 'error' => 'Invalid attempt']);
    exit;
}

$dup = $pdo->prepare(
    'SELECT id FROM custom_answers WHERE attempt_id=? AND question_id=? LIMIT 1'
);
$dup->execute([$aid, $qid]);

if ($dup->fetch()) {
    echo json_encode(['ok' => true, 'duplicate' => true]);
    exit;
}

$is = ($answer !== '' && $answer === $row['correct_answer']) ? 1 : 0;
$pdo->prepare(
    'INSERT INTO custom_answers(attempt_id,question_id,selected_answer,is_correct,timed_out) VALUES(?,?,?,?,?)'
)->execute([$aid, $qid, $answer ?: null, $is, $timedOut]);

echo json_encode(['ok' => true]);
