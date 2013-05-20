
		var Notif = {

			// Webkit Notification object
			
			wkNotif				: null,
			
			id					: null,
			
			// View Config. params.
						
			icon 				: '',
			notificationType   	: 'text',
			title 				: '',
			url					: '',		
			msg					: '',
			
			// Behavior Config. params
			
			autoclose			: 5,
			debug				: false,
			
			// Event callbacks

			ondisplay			:	function (){console.log("Something went wrong...")},
			onclose				:	function (){console.log("Something went wrong...")},
			onclick				:	function (){alert('fuck you')},
			onerror				:	function (){
				if (this.debug) { console.log("Something went wrong..."); }
			},		
			
			// Fallback. This function will be called if the browser doesn't suppor HTML5 notifications.
			
			fallback			:	function (){},
			
			
			/* ------------------------------------------
				Dump the settings into the object
			------------------------------------------ */
			
			config 	: function (settings) {

				for (option in settings)
					this[option] = settings[option];
				
				return this;
			},


			/* ------------------------------------------
				Generate an id for the notif
			------------------------------------------ */
						
			setID	: function () {
				
				var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
				
				var key = '';

				for (var i=0; i< 4; i++) {
					var rnum = Math.floor(Math.random() * chars.length);
					key += chars.substring(rnum,rnum+1);
				}			
				
				this.id = key;
				
				return this.id;
				
			},
			
			
			/* ------------------------------------------
				Get the id for the notif
			------------------------------------------ */

			getID	: function () { return this.id; },			
						
			/* ------------------------------------------
				Check the avaliability of HTML5 notifications
			------------------------------------------ */
			
			isAvailable	: function () {
				return (typeof window.webkitNotifications == "object");
			},
			
			/* ------------------------------------------
				Shows the notification (if possible)
			------------------------------------------ */		
			
			show 	: function (settings) {
				
				//Update new settings (if needed)
				this.config(settings);
				

				
				//If webkitNotifications object is not available and we are in debug mode, an exception will be thrown...
				if (!this.isAvailable()) {
					if (this.debug) {
						throw { 
							name:        			"Notifications error", 
							level:       			"Show Stopper", 
							message:     			"Browser doesn't support HTML5 notifcations."
						}						
					}
	
					else {
						this.fallback();
					}
				}	
				//If webkitNotifications object is available
				else {
				
					
					//Check for permission to show notifications. Request permission if notifications are not allowed
					
					if (window.webkitNotifications.checkPermission())
						window.webkitNotifications.requestPermission();						

					if (window.webkitNotifications.checkPermission() == 2) {
						console.log("Permission are denied!!" + window.webkitNotifications.checkPermission());
					}
					//If permission is allowed, the notification is shown.

					if (window.webkitNotifications.checkPermission() == 0) {
						//Check for browser notifications support
												
						if (this.notificationType == 'html') 
							this.wkNotif = window.webkitNotifications.createHTMLNotification(this.url);
						else 
							this.wkNotif = window.webkitNotifications.createNotification( this.icon, this.title, this.msg);		
						

						this.wkNotif.ondisplay = this.ondisplay
						this.wkNotif.onclose = this.onclose
						this.wkNotif.onclick =this.onclick
						this.wkNotif.onerror =this.onerror
						// Shows the notif

						this.wkNotif.show();
						
						// Autoclose the notif	
		
						if (this.autoclose) setTimeout(function () {
							Notif.wkNotif.cancel();
						}, this.autoclose * 1000);						
						
					}
											

				}//End If
				
				return this;
			}
		
		};