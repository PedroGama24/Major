let actionContainer = $("body");
var type;
var imgDiret;
var carselect = "nil" 
var pickedvehs = [];

$(document).ready(function() {

    window.addEventListener('message', function(event) {
        let item = event.data;
        imgDiret = event.data.imgDiret;
        type = event.data.type;
        pickedvehs = [];
        switch (item.action) {
            case 'openMenu':
                updateGarages(event.data);
                actionContainer.fadeIn(1000);
                break;

            case 'closeMenu':
                actionContainer.fadeOut(1000);
                break;

            case 'updateGarages':
                updateGarages(event.data);
                break;
        }
    });
    document.onkeyup = function(data) {
        if (data.which == 27) {
            actionContainer.fadeOut(1000);
            $.post('http://will_garages/close', JSON.stringify({}));
        }
    };
    const updateGarages = (data) => {
        const nameList = data.vehicles.sort((a, b) => (a.name > b.name) ? 1 : -1);
        $('.section_content_itens').html(`
            ${nameList.map((item) => (`
                <div class="section_content_item" data-name="${item.name}" ${item.id !== undefined ? "data-id=" + item.id : ''}>
                    <p style="font-family: "Bebas Neue";">${item.vname}</p>
                    <div class="section_content_info"></div>
                    <img src="${imgDiret}/${item.name}.png" onerror="this.onerror=null;this.src='https://i.imgur.com/acV4tCt.png';">
                </div>
            `)).join('')}
        `);
    }
});

$(document).on('click', '.section_content_item', function () {
	let $el = $('.section_content_item:hover');
    if(type == "work"){
	    $('.section_content_item').removeClass('active');
    }


	if ($el.attr('data-id')) {carselect = $el.attr('data-id')} else {carselect = $el.attr('data-name')};
})

$(document).on('click','.section_content_item',function(){
	let $el = $(this);
	let isActive = $el.hasClass('active');
	if ($el.attr('data-id')) {carname = $el.attr('data-id')} else {carname = $el.attr('data-name')};

    // let carname = $el.attr('data-name');
	if(!isActive){
        $el.addClass('active');
        pickedvehs.push(carname);
    } else {
        $el.removeClass('active');
        const index = pickedvehs.indexOf(carname);
        if (index > -1) {
            pickedvehs.splice(index, 1);
        }
    }
});

$(document).on('click', '#retirar', function () {
    if(type == "work"){
        $.post('http://will_garages/spawnVehicles', JSON.stringify({
            name: carselect
        }));
    } else {
        $.post('http://will_garages/carsPicked', JSON.stringify({
            vehicles: pickedvehs
        }));
    }
})

$(".section_content_search > input").on("keyup", function() {
    let search = $(this).val().toLowerCase();
    $("div.section_content_item > p").filter(function() {
        $(this).closest(".section_content_item").toggle($(this).text().toLowerCase().indexOf(search) > -1)
    });
});