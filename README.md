ShopIshop [![Build Status](https://secure.travis-ci.org/mpouleijn/shopishop.png?branch=master)](http://travis-ci.org/mpouleijn/shopishop)
===


Postgress
====
If you have some troubles installing the pg gem you should install it like this first
`env ARCHFLAGS="-arch x86_64" gem install pg`

Employee
====
first_name
last_name
gender
birthday
role


Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.
Post-install message from httparty:
When you HTTParty, you must party hard!
Post-install message from paperclip:
##################################################
#  NOTE FOR UPGRADING FROM PRE-3.0 VERSION       #
##################################################

Paperclip 3.0 introduces a non-backward compatible change in your attachment
path. This will help to prevent attachment name clashes when you have
multiple attachments with the same name. If you didn't alter your
attachment's path and are using Paperclip's default, you'll have to add
`:path` and `:url` to your `has_attached_file` definition. For example:

    has_attached_file :avatar,
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"



  # http://hastebin.com/yayejiqode.vhdl