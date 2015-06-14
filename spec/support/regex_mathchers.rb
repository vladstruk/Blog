 def page_should_have_sequence *args
   page.body.should =~ /#{args.join('.*')}/m
 end