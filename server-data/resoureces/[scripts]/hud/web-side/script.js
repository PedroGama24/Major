var lastOxigen = 999;
let voice_bars = {
    1: document.querySelector('#v1'),
    2: document.querySelector('#v2'),
    3: document.querySelector('#v3'),
    4: document.querySelector('#v4')
}

function remove_voices_bars() {
    let elements = document.querySelectorAll('.qTalk')

    for (let i in elements ) {
        if (typeof elements[i] == 'object') {
            elements[i].classList.remove('activeQ')
            elements[i].style.background = 'rgba(112,112, 112, 0.2)'
        }
    }
}

function talking_voice() {
    let elements = document.querySelectorAll('.activeQ')
    for (let i in elements) {
        if (typeof elements[i] == 'object') {
            elements[i].style.background = '#ffffff'
        }
    }
}

function setVeloBar(velo) {
    let fill_value = 180 * (velo) / (300)

    let fill_element = document.querySelector('.veloFill')

    // fill_element.style.width = `${fill_value}%`
}

function setGas(gas){
    let fill_gas = gas * 1.7
    let fill_element = document.querySelector('.veloFill')
    let back_fill_element = document.querySelector('.veloBar')
    let car = document.querySelector('.carHud-container')

    if (fill_gas > 77){
      fill_element.style.backgroundColor = '#fff'
      car.style.filter= ' drop-shadow(0px 0px 2px rgba(255,255,255,0.6))'
      back_fill_element.style.backgroundColor = 'rgba(255,255,255,0.349)' 
    } 
    else if (fill_gas > 25 && fill_gas < 77){
      fill_element.style.backgroundColor = '#ffc600'
      car.style.filter = ' drop-shadow(0px 0px 2px rgba(255,198,0,0.6))'
      back_fill_element.style.backgroundColor = 'rgba(255,198,0,0.349)' 

    }
    else{        
      fill_element.style.backgroundColor = '#E74C3C'
      car.style.filter= ' drop-shadow(0px 0px 2px rgba(231,76,60,0.6))'
      back_fill_element.style.backgroundColor = 'rgba(231,76,60,0.349)' 

    }

    fill_element.style.width = `${fill_gas}px`

    
}
function setBar(percentage, fillClass) {
    let bar = document.querySelector(`.${fillClass}`)
    bar.setAttribute("x2", percentage)
} 

function setCircle(percentage, fillClass) {
    let circle = document.querySelector(`.${fillClass}`)

    let calc =   ( 100 * (100 - percentage) ) / 100


    circle.style.strokeDashoffset = calc
    
} 

function setCircleDive(percentage, fillClass) {
    let circle = document.querySelector(`.${fillClass}`)
    let dive = document.getElementById('dive')
    let calc =   ( 100 * (100 - percentage) ) / 100
    circle.style.strokeDashoffset = calc
}

window.addEventListener('message', ({ data }) => {
    let normalContainer = document.querySelector('.normalContainer')
    
    if (data.hud == true ) {
        document.querySelector('body').style.display = 'flex'
    } else if ( data.hud == false ){
        document.querySelector('body').style.display = 'none'
    }

    if (data.hotkey == false) {
        document.querySelector('hotkey').style.display = 'none'
    }

    const talkText = document.querySelector('.talkText')

    if (data.voice == '1') {
        remove_voices_bars()
        voice_bars[1].classList.add('activeQ')
        voice_bars[1].style.background = '#ffc600'

        talkText.textContent = 'Sussurrando'
    } else if (data.voice == '2') {
        remove_voices_bars()
        voice_bars[1].classList.add('activeQ')
        voice_bars[1].style.background = '#ffc600'

        voice_bars[2].classList.add('activeQ')
        voice_bars[2].style.background = '#ffc600'

        talkText.textContent = 'Normal'
    } else if (data.voice == '3') {
        voice_bars[1].classList.add('activeQ')
        voice_bars[1].style.background = '#ffc600'

        voice_bars[2].classList.add('activeQ')
        voice_bars[2].style.background = '#ffc600'

        voice_bars[3].classList.add('activeQ')
        voice_bars[3].style.background = '#ffc600'

        talkText.textContent = 'Gritando'
    }
    else{ 
        voice_bars[1].classList.add('activeQ')
        voice_bars[1].style.background = '#ffc600'

        voice_bars[2].classList.add('activeQ')
        voice_bars[2].style.background = '#ffc600'

        voice_bars[3].classList.add('activeQ')
        voice_bars[3].style.background = '#ffc600'

        voice_bars[4].classList.add('activeQ')
        voice_bars[4].style.background = '#ffc600'

        talkText.textContent = 'Gritando Muito'

    }

    if (data.talking) {
        talking_voice()
    }

    // setCircle(100 * (data.health - 101) / (400 - 101), 'lifeFill')
    if(data.health == 101){
        //console.log("sending life dead")
        setBar(parseInt(data.health) - 100, 'lifeFill')
    }else{
        //console.log("sending life living")
        setBar(parseInt(data.health || 0) - 99, 'lifeFill')
    }
    //console.log("sending armour")
    setBar((data.armour || 0) + 1, 'shieldFill')
    //console.log("sending thrist")
    setCircle(data.thirst, 'waterFill')
    // console.log(data.thirst);
    setCircle(data.hunger, 'foodFill')
    // console.log(data.hunger);
    // console.log("sending stress",data.stress)
   
    //console.log("sending diving")

    var tickInterval = undefined;
    
    if (data.suit == undefined){
        if($("#dive").css("display") === "flex"){
            $("#dive").css("display","none");
        }
    } else {
        if($("#dive").css("display") === "none"){
            $("#dive").css("display","flex");
        }
    }

    if (lastOxigen !== data.oxigen){
        lastOxigen = data.oxigen;

        setCircleDive(data.oxigen,'diveFill')
    }

    if (data.progress == true){

            var timeSlamp = data.progressTimer;

            if($("#progress").css("display") === "flex"){
                $(".progressFill").css("stroke-dashoffset","100");
                $("#progress").css("display","none");
                clearInterval(tickInterval);
                tickInterval = undefined;

                return
            } else {
                $("#progress").css("display","flex");
                $(".progressFill").css("stroke-dashoffset","100");
            }

            var tickPerc = 100;
            var tickTimer = (timeSlamp / 100);
            tickInterval = setInterval(tickFrame,tickTimer);

            function tickFrame(){
                tickPerc--;

                if (tickPerc <= 0){
                    clearInterval(tickInterval);
                    tickInterval = undefined;
                    $("#progress").css("display","none");
                } else {
                    timeSlamp = timeSlamp - (timeSlamp / tickPerc);
                }

                $(".progressnumber").html(parseInt(timeSlamp / 1000));
                $(".progressFill").css("stroke-dashoffset",tickPerc);
            }

            return
        }


    let radio = document.querySelector('.radio')

    if (data.radio > 0 && data.radio != undefined) {
        radio.style.opacity = '1'
        radio.innerHTML = `
         <ion-icon name="radio-outline"></ion-icon>
        <p>${data.radio}.0 <span>MHz</span></p>
        `
    } else {
        radio.style.opacity = '0'
        radio.innerHTML = ''
    }
    
    let hour = document.querySelector('.hour')
    hour.textContent = `${data.time}`

    let location = document.querySelector('.location')
    location.innerHTML = `
    <div class="direction"><div>${data.direction}</div></div>
                <ion-icon name="location-outline"></ion-icon>
                <p>${data.street}</p>
    `

    let car = document.querySelector('.carHud-container')
    let footer = document.querySelector('footer')

    if (data.vehicle) {
        car.style.display = 'flex'
        car.style.opacity = "1"
        normalContainer.style.transform = 'translateX(calc(100% - 280px))'
        setTimeout(function(){car.style.transform = 'translateX(0%)'},50);
        
        let velo = document.querySelector('.velo')

        velo.textContent = data.speed

        if (Number(data.speed) <= 9) {
            velo.innerHTML = `
                <h1 class = 'velo'><span class = 'defaultVelo'>00</span>${data.speed.toFixed(0)}<span class = 'kmText'>KM/H</span></h1>
            `
        } else if (Number(data.speed) <= 100) {
            velo.innerHTML = `
                <h1 class = 'velo'><span class = 'defaultVelo'>0</span>${data.speed.toFixed(0)}<span class = 'kmText'>KM/H</span></h1>
            `
        } else {
            velo.innerHTML = `
                <h1 class = 'velo'>${data.speed.toFixed(0)}<span class = 'kmText'>KM/H</span></h1>
            `
        }

        let velo_perc = 100 * (data.speed) / (300)

        setVeloBar(velo_perc)

        // let gas_element = document.querySelector('.gasAmount')
        // gas_element.innerHTML = `
        //     <p class = 'gasAmount'>${data.fuel.toFixed(0)}<span>%</span></p>
        // `
        let gas = data.fuel

        setGas(gas)

        let seatbelt = document.querySelector('.seatbelt')

        if (data.seatbelt == '1') {
            seatbelt.classList.remove('opacity')
        } else {
            seatbelt.classList.add('opacity')
        }
    } else {
        setTimeout(function(){car.style.transform = 'translateX(-180%)'},50);
        car.style.display = "none" 
        car.style.opacity = "0"
        normalContainer.style.transform = 'translateX(0%)'

        
    }

})