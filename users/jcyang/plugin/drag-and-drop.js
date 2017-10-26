function allowDrop(ev) {
	ev.preventDefault();
}

function drag(ev) {
	ev.dataTransfer.setData("Text", ev.target.id);
}

function drop(ev) {
	if (ev.target.id == "nav0") {
		window.location = "/users/jcyang/assets/flash/mt.html";
	}
	if (ev.target.id == "nav1") {
		window.location = "/users/jcyang/assets/flash/fkxrzd.html";
	}
	if (ev.target.id == "nav2") {
		window.location = "/users/jcyang/assets/flash/jswj.html";
	}
	if (ev.target.id == "nav3") {
		window.location = "http://www.4399.com";
	}
}