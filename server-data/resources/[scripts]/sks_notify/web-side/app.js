$(document).ready(function () {
	var notifyNumber = 0;
	window.addEventListener("message", function (event) {
		var html = `
			<div id='${event.data.css}'>
				<div class="notify-code">${event.data.css}</div>
				<span>${event["data"]["mensagem"]}</span>
				<div class="timer-bar ${notifyNumber}"></div>
			</div>
		`;
		
		$(html).fadeIn(500).appendTo(`.${event.data.position === undefined ? "normal" : `${event.data.position}`}`).delay(event["data"]["timer"]).fadeOut(500);
		$(`.${notifyNumber}`).css('transition', `width ${event["data"]["timer"]}ms`);

		setTimeout(() => {
			$(`.${notifyNumber}`).css('width', '0%');
			notifyNumber += 1;
		}, 100);
	});
});