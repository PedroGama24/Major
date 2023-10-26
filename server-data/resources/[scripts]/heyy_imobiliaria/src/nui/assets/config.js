config = {
	imagePath: "imgs/imob",

	language: "pt"
}

// (PT) Formatar dinheiro
// (EN) Format money
var formatter = new Intl.NumberFormat('pt-BR', {
	style: 'currency',
	currency: 'BRL',
	minimumFractionDigits: 2,
	maximumFractionDigits: 2,
});

var dateFormatter = (time) => {
	let d = new Date(time);

	let da = new Intl.DateTimeFormat('en', { day: '2-digit' }).format(d);
	let mo = new Intl.DateTimeFormat('en', { month: '2-digit' }).format(d);
	let ye = new Intl.DateTimeFormat('en', { year: 'numeric' }).format(d);
	return `${da}/${mo}/${ye}`;
}