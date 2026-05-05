window.RevealNbisHome = window.RevealNbisHome || {
    id: "RevealNbisHome",
    init: function (deck) {
	initNBISHome(deck);
    },
    configure: function (config) {
	configure(config);
    },
};

// cf chalkboard plugin
const initNBISHome = function( Reveal ) {
    var position = { left: "30px", bottom: "30px" };
    var url = "https://nbis.se";

    var config = configure( Reveal.getConfig()['nbishome'] || {} );

    function configure( config ) {
	if ( config.url != undefined ) url = config.url;
	if ( config.position != undefined ) position = config.position;
	return config
    }

    var button = document.createElement('div');
    button.className = 'reveal-nbis-home';
    button.id = 'reveal-nbis-home';
    button.style.visibility = 'visible';
    button.style.position = 'absolute';
    button.style.zIndex = 30;
    button.style.fontSize = "24px";

    button.style.left = position.left || "30px";
    button.style.bottom = position.bottom || "30px";

    button.style.top = position.top || "auto";
    button.style.right = position.right || "auto";

    button.innerHTML = '<a href="' + url + '" title="Home"><i class="fa fa-home"></i></a>';
    document.querySelector('.reveal').appendChild(button);

    this.configure = configure;

    return this;
};
