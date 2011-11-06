jQuery(function () {
	
	var special_list = $('#main_list .special_list');

	function processGeoData(pos) {
		var url = ['http://specialmenu.net/specials',
					'?lat=' + pos.coords.latitude,
					'&lon=' + pos.coords.longitude].join('');
				
		console.log(url);
		$.get(url, function (data) {
			console.log(data);
			special_list.appendChild(data);	
		});

	}

	function errorGeoData(msg) {
		console.log('Geolocation Error' + (msg.code) ? msg.code : msg);
	}


	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(processGeoData, errorGeoData);
	} else {
		// No Geo supported - do something here
		errorGeoData('Not supported');
	}

});
