Vue.createApp({
    data: function (){
        return {
            opened: false,
            config: {
                dataValidade: null,
                nameCoins: null,
                name: null
            },
            coins: 0,
            winners: 0,
            rewards: [],
            remainingDate: null,
            boxInitial: false,
            classActive: null,
            wonItem: [],
            wonClass: [],
            render: null,
            renderClass: null,
            quantity: 1
        }
    },
    methods: {
        post: function (name, body) {
            if(navigator.onLine) {
                fetch(`http://${window.GetParentResourceName()}/${name}`,{
                    method: "POST",
                    body: JSON.stringify(body || {})
                });
                return;
            }
        },
        request: async function (name, body) {
            if(navigator.onLine) {
                const data = await fetch(`http://${window.GetParentResourceName()}/${name}`, {
                    method: "POST",
                    body: JSON.stringify(body)
                });
                return data.json();
            }
        },
        getDate: function () {
            const countDownDate = new Date(this.config.dataValidade).getTime();

            const timeRunning = setInterval(() => {
                const today = new Date().getTime();
                const distance = countDownDate - today;

                const days = Math.floor(distance / (1000 * 60 * 60 * 24));
                const hours = Math.floor(
                    (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
                );
                const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                const seconds = Math.floor((distance % (1000 * 60)) / 1000);

                this.remainingDate = `${days} Dias ${hours} H ${minutes} M ${seconds} S`;

                if (distance < 0) {
                    clearInterval(timeRunning);
                    this.remainingDate = 'EXPIRADO';
                }
            }, 1000);

            return this.remainingDate;
        },
        openBox: async function () {
            if (this.disableButton) return;
            else this.disableButton = true
            if (this.coins >= 25) {
                await this.request('sendRewards', {
                    action: 'openBox',
                    qtd: Number(this.quantity),
                    coins: this.quantity === 1 ? 25 : 125
                }).then(res => {
                    if (!res) return;
                    this.wonItem = res.recompensas;
                    this.wonClass = res.raridades;
                    this.coins = this.coins - (this.quantity === 1 ? 25 : 125);
                    this.renderItem();
                }); 
                setTimeout(() => {
                    this.disableButton = false
                }, 1000)
            }   
        },
        imageItem: function (item) {
            return `http://181.215.253.55/skips/box/${item}.png`;
        }, 
        renderItem: function () {
            let video = document.querySelector('#video');
            let modal = document.querySelector('.modal');
            this.boxInitial = true;
            video.style.display = 'block';
            video.play();

            setTimeout(() => {;
                modal.style.display = 'flex';
            }, 6750);

            setTimeout(() => {
                video.style.display = 'none';
                modal.style.display = 'none';
                this.boxInitial = false;
                this.wonItem = [];
                this.render = null;
            }, 9000);
        },
        close: function () {
            if (this.boxInitial) return;
            this.post('BoxClick', {
                action: 'closeNui'
            });
            this.opened = false;
            this.boxSelected = [];
        }
    },
    mounted: function () {
        window.addEventListener('message', ({ data }) => {
            if (!data) return;
            if (data.type === 'openBox') {
                this.opened = true;
                this.config = data.config;
                this.coins = data.coins;
                this.winners = data.winers.slice(0, 3);
                this.rewards = data.rewards;
                return;
            };
            this.opened = false;
        });

        window.addEventListener('keydown', (e) =>{
            if (e.keyCode === 27) {
                this.close();
            }
        });
    }
}).mount("#app");