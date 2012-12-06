function CurrentD(){
							var now = new Date();
							AmorPm = "";
							var h = now.getHours();
							var m = now.getMinutes();
							var s = now.getSeconds();
							if(h>12)
							{
								h = h-12
								AmorPm = "PM"
							}
							if(h==0)
							{
								h = 12
								AmorPm = "AM"
							}
							
							else
							{
							 h = h
							 AmorPm = "AM"
							}
							
							if(s<10)
							{
								s = "0"+s
							}
							else
							{
							 s = s	
							}
							if(m<10)
							{
								m = "0"+m
							}
							else
							{
							 m = m	
							}
							var day = now.getDay();
							var dayName = "";
							switch (day)
							 {
							 case 0:
							   x="Sunday";
							   break;
							 case 1:
							   x="Monday";
							   break;
							 case 2:
							   x="Tuesday";
							   break;
							 case 3:
							   x="Wednesday";
							   break;
							 case 4:
							   x="Thursday";
							   break;
							 case 5:
							   x="Friday";
							   break;
							 case 6:
							   x="Saturday";
							   break;
							 } 
							
							 dayName = x;
							
							document.getElementById("Day").innerHTML= dayName;
							document.getElementById("Time").innerHTML= h + ":" + m;
							document.getElementById("Sec").innerHTML= " " + s + " " + AmorPm;
					
				setTimeout('CurrentD()',1000)	
					}
					CurrentD();
					
					
					