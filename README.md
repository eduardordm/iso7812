# Ruby ISO-7812 Implementation

This is the full ISO-7812 implementation, in ruby! This is battle tested, production ready. Use at will.

The project is 100% documented and you shouldn't have any problem understanding the standard just by reading the comments.

I recommend that you copy those files into your own project and not use this as a gem. 

## Installation

Add this line to your application's Gemfile:

    gem 'iso7812'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iso7812

## Usage

	require 'iso7812'

	include Iso7812::CardNumber

	# See available methods on card_number.rb
