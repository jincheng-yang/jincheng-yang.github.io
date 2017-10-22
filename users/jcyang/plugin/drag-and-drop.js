function allowDrop(ev) {
	ev.preventDefault();
}

function drag(ev) {
	ev.dataTransfer.setData("Text",ev.target.id);
}

function drop(ev) {
	window.location.href="/users/jcyang/assets/files/cv.pdf";
}
