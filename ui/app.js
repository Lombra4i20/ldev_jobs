const { createApp } = Vue

createApp({
    data() {
        return {
            message: "Hello World",
            tempmessage: "",
            showing: false,
            buttons: [
                { id: 1, text: "🚑", info: "Médico", title: "Profissão: Médico", salary: "$100" },
                { id: 2, text: "👮‍♂️", info: "Policial", title: "Profissão: Policial", salary: "$90" },
                { id: 3, text: "⛏️", info: "Mineirador", title: "Profissão: Mineirador", salary: "$80" },
                { id: 4, text: "🪓", info: "Lenhador", title: "Profissão: Lenhador", salary: "$70" },
                { id: 5, text: "🎣", info: "Pescador", title: "Profissão: Pescador", salary: "$60" },
                { id: 6, text: "🔜" },
                { id: 7, text: "🔜" },
                { id: 8, text: "🔜" },
            ],
            hoveredButton: null,
        };
    },
  mounted() {
  	// setTimeout(()=>{
    // 	this.showing = true
    // }, 2000)

    window.addEventListener('keypress', this.onKeypress)
    // window.addEventListener('keyup', this.onKeypress)
    // document.onKeypress = this.onKeypress

    window.addEventListener('message', this.onMessage)
  },
  destroyed() {
    window.removeEventListener('message')
  },
  computed: {
  	changestyle() {
    
    	let color = ''
      
      if(this.message == 'Vorp Rules') {
        color = 'red'
      }
    
    	return {'color': color}
    },
    buttonstyle() {
    	let showing = false
  		if(this.message == 'Vorp Rules') {
        showing = true
      }
    
    	return {'difchangebutton': showing}
    }
  },
  watch: {
    showing(data) {
      // Reset dat variables
      this.message = "Hello World"
      this.tempmessage = ""


      // Send data to Nui/Lua
      fetch(`https://${GetParentResourceName()}/update`, {
        method: 'POST',
        body: JSON.stringify({
          status: data
        })
      })
    }
    },
    methods: {
        handleButtonClick(buttonId) {
            if (buttonId === 1) {
            }
            if (buttonId === 2) {
            }
            if (buttonId === 3) {
            }
            if (buttonId === 4) {
            }
            if (buttonId === 5) {
            }

            // Enviar mensagem para o Lua
            fetch(`https://${GetParentResourceName()}/buttonClick`, {
                method: 'POST',
                body: JSON.stringify({ buttonId }),
            });
        },
        showInfo(buttonId) {
            const button = this.buttons.find((b) => b.id === buttonId);
            if (button) {
                this.hoveredButton = button;
            }
        },
        hideInfo() {
            this.hoveredButton = null;
        },
        onKeypress(event) {
            if (event.key === 'q' || event.key === 'Q') {
                console.log('Q was pressed!');
            }
        },
        changeMessage() {
            this.message = this.tempmessage;
            fetch(`https://${GetParentResourceName()}/updatemessage`, {
                method: 'POST',
                body: JSON.stringify({
                    message: this.message
                })
            });
        },
        onMessage(event) {
            if (event.data.type === 'open') {
                this.showing = true;
            }
            if (event.data.type === 'close') {
                this.showing = false;
            }
        },
    },
}).mount('#app');