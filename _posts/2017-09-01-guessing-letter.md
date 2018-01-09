---
layout: post
title: "Guessing Letter"
date: 2017-09-01
comments: true
---

This is a very simple game called Guessing Letter, similar to the more popular four digit number guessing game. I wrote this as a practice of javaScript.

The secret password is a four-letter string without spaces. Your job is to find out this word. Input your guess and click "Compare", then you will get a comparason in the form of $$m$$A$$n$$B, where $$m$$ is the number of slots in the password that you input correctly, and $$n$$ is the number of slots in the password that you used the letter in that slot, possibly elsewhere.

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

I wrote a [Matlab program](/users/jcyang/assets/files/guessLetter.zip) to solve this question in as few steps as possible, based on the principle that one should maximize the negentropy of each guess. 

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
