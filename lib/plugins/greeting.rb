# -*- coding: utf-8 -*-
# TODO: make register_greeting command
module Termtter::Client
  register_macro(:cool, "update %s cool.",
    :help => ['cool {SCREENNAME}', 'update "@{SCREENNAME} cool."']
  )

  register_macro(:hi, "update %s hi",
    :help => ['hi {SCREENNAME}', 'update "@{SCREENNAME} hi"']
  )

end
