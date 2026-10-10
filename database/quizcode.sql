CREATE DATABASE IF NOT EXISTS quizcode_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE quizcode_db;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS custom_answers; DROP TABLE IF EXISTS custom_attempts; DROP TABLE IF EXISTS custom_questions; DROP TABLE IF EXISTS custom_quizzes;
DROP TABLE IF EXISTS quiz_results; DROP TABLE IF EXISTS flashcards; DROP TABLE IF EXISTS questions; DROP TABLE IF EXISTS categories; DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE users(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,email VARCHAR(150) UNIQUE NOT NULL,password VARCHAR(255) NOT NULL,role ENUM('student','admin') DEFAULT 'student',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE categories(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(80) NOT NULL,description VARCHAR(255) NOT NULL);
CREATE TABLE questions(id INT AUTO_INCREMENT PRIMARY KEY,category_id INT NOT NULL,question TEXT NOT NULL,code_snippet TEXT NULL,option_a VARCHAR(255) NOT NULL,option_b VARCHAR(255) NOT NULL,option_c VARCHAR(255) NOT NULL,option_d VARCHAR(255) NOT NULL,correct_answer ENUM('A','B','C','D') NOT NULL,FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE CASCADE);
CREATE TABLE flashcards(id INT AUTO_INCREMENT PRIMARY KEY,category_id INT NOT NULL,front_text VARCHAR(255) NOT NULL,back_text TEXT NOT NULL,FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE CASCADE);
CREATE TABLE quiz_results(id INT AUTO_INCREMENT PRIMARY KEY,user_id INT NOT NULL,category_id INT NOT NULL,score INT NOT NULL,total_questions INT NOT NULL DEFAULT 25,date_taken TIMESTAMP DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE CASCADE);
INSERT INTO categories(id,name,description) VALUES(1,'HTML','HTML history, elements, attributes, forms and semantic markup');
INSERT INTO categories(id,name,description) VALUES(2,'CSS','CSS history, selectors, layout, styling and terminology');
INSERT INTO categories(id,name,description) VALUES(3,'JavaScript','JavaScript history, syntax, DOM, operators and coding');
INSERT INTO categories(id,name,description) VALUES(4,'PHP','PHP history, syntax, forms, sessions, MySQL and server-side coding');
INSERT INTO categories(id,name,description) VALUES(5,'Web Terminologies','Frontend, backend, HTTP, APIs, databases and web concepts');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Who created the World Wide Web and developed HTML?',NULL,'Tim Berners-Lee','Brendan Eich','Rasmus Lerdorf','Håkon Wium Lie','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'What does HTML stand for?',NULL,'HyperText Markup Language','HighText Machine Language','Hyper Transfer Markup Language','Home Tool Markup Language','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag creates the largest heading?',NULL,'<h1>','<h6>','<head>','<title>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag creates a paragraph?',NULL,'<p>','<para>','<text>','<pg>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which attribute specifies a link destination?',NULL,'href','src','alt','class','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag creates a hyperlink?',NULL,'<a>','<link>','<href>','<url>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag displays an image?',NULL,'<img>','<picture-only>','<src>','<image>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'What is the purpose of alt on an image?',NULL,'Provides alternative text','Changes image size','Creates a link','Adds animation','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag creates an unordered list?',NULL,'<ul>','<ol>','<li-only>','<list>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag represents a list item?',NULL,'<li>','<item>','<ul>','<list>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which element is used for navigation links?',NULL,'<nav>','<navigate>','<menuitem>','<links>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which semantic tag represents the main page content?',NULL,'<main>','<bodytext>','<content>','<primary>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag creates a form?',NULL,'<form>','<inputform>','<fieldset-only>','<data>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which input type hides typed characters?',NULL,'password','hidden-text','secure','private','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag creates a table row?',NULL,'<tr>','<td>','<th>','<row>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag is used for table data cells?',NULL,'<td>','<tr>','<tabledata>','<cell>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'What does the id attribute normally identify?',NULL,'A unique element','All elements of one type','A database row only','The browser version','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which attribute groups elements for CSS styling?',NULL,'class','id-only','group','style-name','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which declaration tells the browser HTML5 is used?',NULL,'<!DOCTYPE html>','<html5>','<doctype=5>','<version html>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Where is visible page content normally placed?',NULL,'<body>','<head>','<meta>','<title>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag inserts a line break?',NULL,'<br>','<break>','<lb>','<newline>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which element emphasizes text semantically?',NULL,'<em>','<big>','<mark-only>','<font>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag is commonly used for a page footer?',NULL,'<footer>','<bottom>','<end>','<foot>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which tag contains metadata about the document?',NULL,'<head>','<body>','<main>','<section>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(1,'Which attribute specifies an image file location?',NULL,'src','href','path-only','file','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Who proposed CSS in 1994?',NULL,'Håkon Wium Lie','Tim Berners-Lee','Brendan Eich','Rasmus Lerdorf','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'What does CSS stand for?',NULL,'Cascading Style Sheets','Computer Style Syntax','Creative Styling System','Coded Style Sheets','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which selector targets an element by id?',NULL,'#name','.name','name*','@name','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which selector targets a class?',NULL,'.name','#name','@name','$name','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property changes text color?',NULL,'color','font-color','text-color','foreground','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property changes background color?',NULL,'background-color','color-background','bgcolor','back-color','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property changes text size?',NULL,'font-size','text-size','font-style','size','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property makes text bold?',NULL,'font-weight','text-bold','font-style','weight-text','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property adds space inside a border?',NULL,'padding','margin','spacing','gap-only','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property adds space outside a border?',NULL,'margin','padding','inside-space','border-gap','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'What is the CSS box model made of?',NULL,'Content, padding, border, margin','Text, image, link, form','Width, height, color, font','HTML, CSS, JS, PHP','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which declaration enables Flexbox?',NULL,'display: flex','position: flex','layout: flex','flex: display','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which declaration enables CSS Grid?',NULL,'display: grid','position: grid','layout: grid','grid: on','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property rounds corners?',NULL,'border-radius','corner-radius','border-round','radius','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property controls element transparency?',NULL,'opacity','visibility-level','transparent','alpha-only','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which pseudo-class applies when a mouse is over an element?',NULL,':hover',':click',':mouse',':over','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which unit is relative to the root font size?',NULL,'rem','px','cm','pt','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property changes the typeface?',NULL,'font-family','font-type','text-family','typeface','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property centers inline text?',NULL,'text-align','align-items','justify-content','font-align','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property controls stacking order?',NULL,'z-index','stack','layer','order-index','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which value removes an element from layout?',NULL,'display: none','opacity: 0','visibility: visible','position: static','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property sets an element''s width?',NULL,'width','size-x','element-width','horizontal-size','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which symbol is used for the universal selector?',NULL,'*','#','.','@','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which feature adapts styles to screen sizes?',NULL,'Media queries','Keyframes','Variables','Transitions','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(2,'Which property can create smooth changes between states?',NULL,'transition','transform-only','animation-name-only','display','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Who created JavaScript?',NULL,'Brendan Eich','Tim Berners-Lee','Rasmus Lerdorf','Håkon Wium Lie','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'In what year was JavaScript created?',NULL,'1995','1989','2005','2015','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'What was an early name of JavaScript?',NULL,'Mocha','Python','Oak','Perl','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which keyword declares a block-scoped variable?',NULL,'let','print','define','dim','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which keyword declares a constant?',NULL,'const','constant','fixed','final','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'What does DOM stand for?',NULL,'Document Object Model','Data Object Method','Digital Output Model','Document Order Map','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which operator means strict equality?',NULL,'===','=','==!','=>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'What is the result of 5 + 2?',NULL,'7','52','3','10','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'What does x++ do?',NULL,'Increases x by 1','Decreases x by 1','Doubles x','Resets x','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which function prints to the browser console?',NULL,'console.log()','print.console()','echo()','log.console()','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which structure stores multiple values in order?',NULL,'Array','Boolean','Number','Event','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which method adds an item to the end of an array?',NULL,'push()','pop()','shift()','join()','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which method removes the last array item?',NULL,'pop()','push()','unshift()','map-only()','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which event commonly fires when a button is pressed?',NULL,'click','load-only','hover','type','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which keyword starts a conditional statement?',NULL,'if','when','check','case-only','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which loop repeats while a condition is true?',NULL,'while','if','switch','const','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which value represents no intentional object value?',NULL,'null','true','1','NaN-only','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which function converts text to an integer?',NULL,'parseInt()','toText()','intOnly()','numberText()','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which operator means logical AND?',NULL,'&&','||','!!','&|','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which operator means logical OR?',NULL,'||','&&','%%','//','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'What type is true or false?',NULL,'Boolean','String','Array','Object-only','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which method selects an element by id?',NULL,'document.getElementById()','document.getClass()','window.findId()','html.selectId()','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which syntax creates a single-line comment?',NULL,'// comment','<!-- comment -->','# comment only','** comment','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'Which keyword defines a function using traditional syntax?',NULL,'function','method','func','define','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(3,'What is the output?','let x = 5;
x++;
console.log(x);','6','5','4','Error','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Who created PHP?',NULL,'Rasmus Lerdorf','Brendan Eich','Tim Berners-Lee','Håkon Wium Lie','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'PHP originally stood for what?',NULL,'Personal Home Page','Private Hosting Program','Public HTML Processor','Page Hypertext Program','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'What does modern PHP recursively stand for?',NULL,'PHP: Hypertext Preprocessor','Personal Hypertext Page','Programming Home Processor','Public Hypertext PHP','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which symbol begins a PHP variable?',NULL,'$','#','@','%','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which statement commonly outputs text?',NULL,'echo','console.log','print.js','display-only','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which opening tag starts PHP code?',NULL,'<?php','<php>','<?code','<script php>','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which operator joins strings in PHP?',NULL,'.','+','&','::','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which superglobal receives form data sent with POST?',NULL,'$_POST','$_SEND','$_FORM','$_DATA','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which superglobal receives query-string values?',NULL,'$_GET','$_URL','$_QUERY','$_LINK','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which function starts/resumes a session?',NULL,'session_start()','start_session()','session()','open_session()','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which function hashes passwords securely?',NULL,'password_hash()','md5_only()','encode_password()','hash_text_only()','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which function verifies password_hash output?',NULL,'password_verify()','check_hash_only()','verify()','password_check()','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'What is PDO commonly used for?',NULL,'Database access','CSS styling','Image editing','DNS lookup','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which database is commonly paired with PHP?',NULL,'MySQL','Photoshop','Bootstrap','HTML','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which SQL command reads rows?',NULL,'SELECT','SHOWPAGE','READ','FETCHONLY','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which SQL command adds a row?',NULL,'INSERT','ADDROW','CREATE ROW','PUSH','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which SQL command changes existing rows?',NULL,'UPDATE','CHANGEONLY','EDITROW','MODIFY PAGE','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which SQL command removes rows?',NULL,'DELETE','REMOVEONLY','DROP ROWS ONLY','ERASE PAGE','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Why use prepared statements?',NULL,'Help prevent SQL injection','Make CSS faster','Create HTML tags','Compress images','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which operator checks equality by value in PHP?',NULL,'==','=','=>',':=','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which keyword defines a function?',NULL,'function','func','method','define-only','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which structure stores key-value pairs?',NULL,'Associative array','Boolean','Comment','Loop','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which function counts array items?',NULL,'count()','length()','sizeOfText()','arrayLengthOnly()','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'Which statement includes another PHP file?',NULL,'include','attach','import-html','linkfile','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(4,'What is the output?','$name = ''John'';
echo $name;','John','$name','name','Error','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is the frontend?',NULL,'The part users see and interact with','Only the database','A server room','A domain seller','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is the backend?',NULL,'Server-side logic and data handling','Only page colors','A browser extension','A keyboard','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What does HTTP stand for?',NULL,'Hypertext Transfer Protocol','High Text Transport Program','Hyperlink Transfer Process','Host Text Protocol','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What does HTTPS add to HTTP?',NULL,'Encrypted secure communication','More HTML tags','Faster CSS only','A database','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is a URL?',NULL,'Address of a web resource','A CSS selector','A PHP variable','A database table','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What does DNS do?',NULL,'Maps domain names to IP addresses','Styles web pages','Stores passwords','Runs JavaScript loops','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is an IP address used for?',NULL,'Identifying a device/network endpoint','Choosing fonts','Creating forms','Naming CSS classes','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is a web browser?',NULL,'Software used to access web pages','A database engine','A PHP framework','A server cable','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is a web server?',NULL,'Software/computer that serves web content','A CSS file','An HTML heading','A keyboard app','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is a database?',NULL,'Organized collection of data','A color palette','A browser tab','A JavaScript event','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is MySQL?',NULL,'Relational database management system','CSS library','Web browser','Image format','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is an API?',NULL,'Interface for software to communicate','A page heading','A password type','A CSS unit','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What does CRUD stand for?',NULL,'Create, Read, Update, Delete','Code, Run, Upload, Download','Create, Render, Use, Design','Copy, Read, Undo, Debug','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is localhost?',NULL,'The current computer acting as a host','A public search engine','A CSS property','An online domain only','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is XAMPP commonly used for?',NULL,'Local web development server environment','Image editing','DNS registration','JavaScript compilation only','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is Bootstrap?',NULL,'Frontend CSS framework','Database server','PHP database','Programming language','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is responsive design?',NULL,'Design that adapts to screen sizes','A database backup','A PHP session','A server error','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is a domain name?',NULL,'Human-readable website address','A SQL row','A CSS value','A JS variable','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is hosting?',NULL,'Service that makes a site available online','A CSS animation','A form field','A loop','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is a cookie?',NULL,'Small data stored by a browser','A database table only','A CSS selector','A server cable','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is a session in web apps?',NULL,'Server-side way to keep user state','A CSS layout','A DNS record only','An HTML image','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is SQL?',NULL,'Language for working with relational databases','A CSS framework','An image format','A browser','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is source code?',NULL,'Human-readable instructions for software','A web domain','A database password','A network cable','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is debugging?',NULL,'Finding and fixing program errors','Adding colors','Buying hosting','Creating a domain','A');
INSERT INTO questions(category_id,question,code_snippet,option_a,option_b,option_c,option_d,correct_answer) VALUES(5,'What is Git mainly used for?',NULL,'Version control','Database hosting','CSS rendering','Email sending','A');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(1,'HTML','HyperText Markup Language; structures web content.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(1,'<a>','Creates a hyperlink.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(1,'<img>','Embeds an image.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(1,'href','Specifies a hyperlink destination.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(1,'Semantic HTML','Elements that describe meaning, such as nav and main.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(2,'CSS','Cascading Style Sheets; styles web pages.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(2,'Selector','Targets HTML elements for styling.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(2,'Padding','Space inside an element border.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(2,'Margin','Space outside an element border.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(2,'Flexbox','One-dimensional CSS layout system.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(3,'JavaScript','Programming language for interactive web behavior.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(3,'DOM','Document Object Model.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(3,'let','Declares a block-scoped variable.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(3,'const','Declares a binding that cannot be reassigned.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(3,'===','Strict equality operator.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(4,'PHP','Server-side scripting language for web development.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(4,'PDO','PHP Data Objects; database access interface.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(4,'$_POST','Contains values submitted using POST.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(4,'Session','Stores user state across requests.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(4,'Prepared statement','Parameterized SQL that helps prevent injection.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(5,'Frontend','User-facing part of a web application.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(5,'Backend','Server-side logic and data handling.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(5,'API','Interface that lets software communicate.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(5,'CRUD','Create, Read, Update, Delete.');
INSERT INTO flashcards(category_id,front_text,back_text) VALUES(5,'DNS','Maps domain names to IP addresses.');

-- Quiz creator/share/timer upgrade
CREATE TABLE IF NOT EXISTS custom_quizzes (
 id INT AUTO_INCREMENT PRIMARY KEY, creator_id INT NOT NULL, title VARCHAR(150) NOT NULL,
 description TEXT, join_code VARCHAR(10) NOT NULL UNIQUE, is_published TINYINT(1) DEFAULT 0,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (creator_id) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS custom_questions (
 id INT AUTO_INCREMENT PRIMARY KEY, quiz_id INT NOT NULL, question_text TEXT NOT NULL,
 option_a VARCHAR(255) NOT NULL, option_b VARCHAR(255) NOT NULL, option_c VARCHAR(255) NOT NULL, option_d VARCHAR(255) NOT NULL,
 correct_answer ENUM('A','B','C','D') NOT NULL, time_limit INT NOT NULL DEFAULT 30, source VARCHAR(20) DEFAULT 'manual',
 FOREIGN KEY (quiz_id) REFERENCES custom_quizzes(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS custom_attempts (
 id INT AUTO_INCREMENT PRIMARY KEY, quiz_id INT NOT NULL, user_id INT NOT NULL, score INT DEFAULT 0,
 total_questions INT DEFAULT 0, started_at DATETIME DEFAULT CURRENT_TIMESTAMP, completed_at DATETIME NULL,
 FOREIGN KEY (quiz_id) REFERENCES custom_quizzes(id) ON DELETE CASCADE,
 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS custom_answers (
 id INT AUTO_INCREMENT PRIMARY KEY, attempt_id INT NOT NULL, question_id INT NOT NULL,
 selected_answer VARCHAR(1) NULL, is_correct TINYINT(1) DEFAULT 0, timed_out TINYINT(1) DEFAULT 0,
 FOREIGN KEY (attempt_id) REFERENCES custom_attempts(id) ON DELETE CASCADE,
 FOREIGN KEY (question_id) REFERENCES custom_questions(id) ON DELETE CASCADE,
 UNIQUE KEY unique_attempt_question (attempt_id, question_id)
);
