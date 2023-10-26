

// <!-- // -- DISCORD: SkipS#1234 -->

$(function(){
	var tamanho = 100;
    window.addEventListener("message", function (event) {
		var turbo = event.data;
  		if(turbo.porcentagem === 100){tamanho = 100;}
		function diminuirdiv(){
			$('.turbodiv').show()
			tamanho--
			console.log(tamanho)
			$('.turboprogresso').css('width',tamanho+'%')
			// $('#porcento').html(tamanho)
		}
		if (turbo.display === true && tamanho > 1) {diminuirdiv()}else{$('.turbodiv').hide()}
	});
})

// <!-- // -- DISCORD: SkipS#1234 -->
