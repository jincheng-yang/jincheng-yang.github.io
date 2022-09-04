function allowDrop(ev) {
	ev.preventDefault();
}

function drag(ev) {
	ev.dataTransfer.setData("Text", ev.target.id);
}

function drop(ev) {
	if (ev.target.id == "nav0") {
		window.location = "/~yang/assets/flash/mt.html";
	}
	if (ev.target.id == "nav1") {
		window.location = "/~yang/assets/flash/fkxrzd.html";
	}
	if (ev.target.id == "nav2") {
		window.location = "/~yang/assets/flash/jswj.html";
	}
	if (ev.target.id == "nav3") {
		window.location = "http://www.dashenti.com/Public/Games/326029/201605240441409210/html5/index.html?gameID=58&from=singlemessage&isappinstalled=0";
		//<!--"http://www.4399.com"-->;
	}
}