---
layout: post
title: "Guessing Letter"
date: 2017-09-01
comments: true
---

<input id="txt1" type="text" maxlength="4" value="ABCD" autocomplete="off">
<input type="button" value="Compare" onclick="
		var newWord = document.getElementById('txt1').value.toUpperCase();
		var examine = newWord.match('[A-Z]{4}');
		if (examine != null) {
			var newwordArray = newWord;
			var countA = 0;
			var countB = 0;
			for (i = 0; i < 4; i++) {
			    if (passwordArray[i] == newwordArray[i]) {
				countA = countA + 1;
			    }
			    for (j = 0; j < 4; j++) {
				if (passwordArray[i] == newwordArray[j]) {
				    countB = countB + 1;
				    break;
				}
			    }
			}
			document.getElementById('record').innerHTML = document.getElementById('record').innerHTML.concat(count++, '. ', newWord, ': ', countA, 'A', countB, 'B', '<p></p>')
		}"
	>

<p id="record"></p>

<script>
	var count = 1;
	var secretWord = "";
	var passwordArray = ["A", "A", "A", "A"];
	for (i = 0; i < 4; i++) {
	passwordArray[i] = String.fromCharCode(Math.floor(Math.random() * 26) + 65);
	secretWord = secretWord.concat(passwordArray[i]);
	}
	secretWord = passwordArray.join("");
</script>
