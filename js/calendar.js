$(document).ready(function() {
	
	var events = [{}]; 

	events = [ 
    { Title: "Some Assignment Due Date", Date: new Date("10/13/2012") }, 
	{ Title: "Another Random Date", Date: new Date("10/23/2012") }, 
    { Title: "Christmas", Date: new Date("12/25/2012") }, 
    { Title: "Personal Event", Date: new Date("10/26/2012") }
];

   // events.push[{ Title: "Pushed Assignment Due Date", Date: new Date("10/4/2012") }]

        $('#calendar').datepicker({
		
		inline: true,
		firstDay: 1,
		showOtherMonths: true,
		dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		
		beforeShowDay: function(date) {
        var result = [true, '', null];
        var matching = $.grep(events, function(event) {
         return event.Date.valueOf() === date.valueOf();
        });
		if (matching.length) {
            result = [true, 'highlight', null];
        }
		 return result;
		},
		onSelect: function(dateText) {
        var date,
            selectedDate = new Date(dateText),
            i = 0,
            event = null;
        
        while (i < events.length && !event) {
            date = events[i].Date;

            if (selectedDate.valueOf() === date.valueOf()) {
                event = events[i];
            }
            i++;
        }
        if (event) {
            alert(event.Title);
        }
    }
	});
	
	

	
	
	var bankHolidays = {}; 
	
	
	function seedate()

{
	var str = ""
	$('td a').live('mousedown', function () 
		{ 
		 /*alert($(this).text() + ' ' + $('.ui-datepicker-month').text() 
							  + ' ' +$('.ui-datepicker-year').text()  );*/    
		str = $(this).text() +  " " + $('.ui-datepicker-month').text() 
							  + " " +$('.ui-datepicker-year').text() 
							  if (str == "11 October 2012")
			{
				alert("Success")
			}
			checkDate();
		$("clickFunTxt").text("Click happened! " + str);
		}
	);	
	
}


	/*
	var month = this.month.options[this.month.selectedIndex].value;
    var year = this.year.options[this.year.selectedIndex].value;
	
	$('#calendar').renderCalendar({month:month, year:year, renderCallback:markBankHolidays, showHeader:$.dpConst.SHOW_HEADER_LONG});
            
    return false;
      */
    });
