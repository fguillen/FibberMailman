# NetPopMock

Very simple library for mocking a

    Net::POP3.start( ... ) do |pop|
      <any code here>
    end
    
call

## Usage
    raw_mails = [
      File.read( "/fixtures/mail1.raw_mail" ) ),
      File.read( "/fixtures/mail2.raw_mail" ) ),
    ]
    
    FibberMailman.lie_to_me( raw_mails ) do
      <your code that uses the Net::POP3.start on any point>
    end
    
Not any real POP call will be done.

The mock will simulate that the mails received was the fake **raw_mails**.

See the **test** folder.

## TODO

Only
    pop.each_mail do |m|
      <code here>
    end

is supported.

## Special Thanks

* To the people on this (Ruby Forum Thread)[http://www.ruby-forum.com/topic/214129]

