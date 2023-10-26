let cfg = null

window.addEventListener('message', function(event) {
    switch (event.data.action) {
        case "open":
            $("body").html(`
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="title" style="opacity: 0;">ROTA</div>
                    </div>
                    </div>
                    <div class="btnretirar" data-cloack="remover" onclick="selectCloack(this)">
                    <img src="img/remove.png">
                  </div>
                    `)
            var swiper = new Swiper(".mySwiper", {
                effect: "coverflow",
                grabCursor: true,
                centeredSlides: true,
                slidesPerView: "auto",
                coverflowEffect: {
                    rotate: 50,
                    stretch: 0,
                    depth: 100,
                    modifier: 1,
                    slideShadows: true
                }
            });
            $(".title").data("org",event.data.organization)
            $(".title").text(event.data.organization.toUpperCase())
            for (let x in event.data.cfg) {
                if(x != "coords" && x != "perm"){
                    $(".swiper-wrapper").append(`
                    <div class="swiper-slide">
                    <h1>${x.toUpperCase()}</h1>
                    <img src="http://COLOQUESEUIP/skips/cloackroom/${event.data.sexuality}/${x}.png" />
                        <button class="btnselect" data-cloack="${x}" onclick="selectCloack(this)">SELECIONAR</button>
                    </div>
                    `)
                }
            }
            $("body").fadeIn()
            break;
        default:
    break;
    }
});

function selectCloack(element){
    $.post("https://skips_cloack/select", JSON.stringify({ cloack: $(element).data("cloack"), org: $(".title").data("org") }));
    $("body").fadeOut()
}


document.addEventListener('keydown', (event) => {
    switch (event.code) {
        case "Escape":
            $("body").fadeOut()
            $.post("https://skips_cloack/close")
            $(".title").data("org","")
            $(".title").text("")
            break;
        default:
            break;
    }
}, false);