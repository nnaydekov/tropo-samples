answer

event=prompt("where are you heading?",
   {'repeat'=>2,'choices'=>"1st Floor (first, house wares, 1),\n 2nd Floor (second, bed and bath, 2),\n 3rd Floor (third, sporting goods, 3)", 'timeout'=>10.03456789, 
    'onChoices'=>lambda { | event |
      event.onChoice( "1st Floor", lambda { say "Your destination is 1st Floor" } )
      event.onChoice( "2nd Floor", lambda { say "Your destination is 2nd Floor" } )
      event.onChoice( "3rd Floor", lambda { say "Your destination is 3rd Floor" } ) 
      event.onBadChoice( lambda { say "I can not recognize you. Please input again. " } ) 
    }, 
    'onTimeout'=>lambda { say "wait input time out" }, 
    'onHangup'=>lambda { puts ">>>>>>>>>>>>>>>>>>>Discnnected by the peer!<<<<<<<<<<<<<<<<<" },
    'onError'=>lambda { say "You've get an error!" },
    'onEvent'=>lambda { | event |
      say "inner callback got triggered by event " + event.name if event.name!="hangup"
      event.onError( lambda { say "You've got an error err! " } )
      event.onTimeout( lambda { say "wait input time out" } )
      event.onHangup( lambda { puts ">>>>>>>>>>>>>>>Disconnected by the peer!<<<<<<<<<<<<<<<<<" } )
      event.onChoice( "1st Floor", lambda { say "Your destination is 1st Floor" } )
      event.onChoice( "2nd Floor", lambda { say "Your destination is 2nd Floor" } )
      event.onChoice( "3rd Floor", lambda { say "Your destination is 3rd Floor" } ) 
      event.onBadChoice( lambda { say "I can not recognize you. Please input again. " } ) 
    }
  }
)

if event.name!="hangup"
  say "run outter call back for event [#{event.name},#{event.value}]"
  event.onError( lambda { say "You've got an error! " } )
  event.onChoice( "1st Floor", lambda { say "our destination is 1st Floor" } )
  event.onChoice( "2nd Floor", lambda { say "Your destination is 2nd Floor" } )
  event.onChoice( "3rd Floor", lambda { say "Your destination is 3rd Floor" } ) 
  event.onBadChoice( lambda { say "I can not recognize you " } ) 
  say "Thanks for testing Ruby on the Tropo platform"
  hangup
else
  puts ">>>>>>>>>>>>>>>Discnnected by the peer!<<<<<<<<<<<<<<<<<"
end
