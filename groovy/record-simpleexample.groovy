answer();

event=record("Leave your message at the beep.  Thanks!",
  [
    beep:true, silenceTimeout: 5, maxTime:60, timeout:10,
    onRecord: {event-> say("you said " + event.recordURI )  }
  ] );

log( "event.recordURI = " + event.recordURI );

hangup();
