$(document).ready(function() {	
	

	//if mask is clicked
	$('#maskLogin').click(function () {
		alert("Login In smart guy");
	});			
	

	$(window).resize(function () {
	 
 		var modal = $('#Login .window');
 
        //Get the screen height and width
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
      
        //Set height and width to mask to fill up the whole screen
        $('#maskLogin').css({'width':maskWidth,'height':maskHeight});
               
        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();

        //Set the popup window to center
        modal.css('top',  winH/2 - modal.height()/2);
        modal.css('left', winW/2 - modal.width()/2);
	 
	});	
	
	});


function launchWindow(id) {
	
		//Get the screen height and width
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
	
		//Set heigth and width to mask to fill up the whole screen
		$('#maskLogin').css({'width':maskWidth,'height':maskHeight});
		
		//transition effect		
		$('#maskLogin').fadeIn(1000);	
		$('#maskLogin').fadeTo("slow",0.8);	
	
		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();
              
		//Set the popup window to center
		$(id).css('top',  winH/2-$(id).height());
		$(id).css('left', winW/2-$(id).width()/2);
	
		//transition effect
		$(id).fadeIn(2000); 
	

}
