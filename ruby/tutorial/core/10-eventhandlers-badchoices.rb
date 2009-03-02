# -----------
# handling bad choices and no response (timeout) with event handlers
# -----------

answer

options = { :choices     => 'sales( 1, sales), support( 2, support)',
            :repeat      => 3,
            :onBadChoice => lambda { say 'I am sorry, I did not understand what you said.' },
            :onTimeout   => lambda { say 'Hm.  I did not hear anything.' } }

result = ask 'For sales, just say sales or press 1. For support, say support or press 2.', options


if result.name == 'choice'
  case result.value
  when 'sales'
    say 'Ok, let me transfer you to sales.'
    transfer '14075551212'
  when 'support'
    say 'Sure, let me get support.  Please hold.'
    transfer '14085551212'
  end
end

hangup