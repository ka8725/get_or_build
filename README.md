# GetOrBuild

This is a association builder which helps to generate or get associated object with `belongs_to` or `has_one` association.

## Installation

Add this line to your Gemfile
`gem 'get_or_build'`
then as usually update installed gem by typing `bundle` in your command-line interface.

## Using with ActiveRecord

Assume you have model `Company` which has one `User` and belongs to `Location`:

	class Company < ActiveRecord::Base
		belongs_to :location
		has_one :user
		accepts_nested_attributes_for :user
		accepts_nested_attrbiutes_for :location
	end
	
	class User < ActiveRecord::Base; end
	class Location < ActiveRecord::Base; end

When you are building form for company with nested attributes for location or user you are able now use new methods like `user_or_build` or `location_or_build`:

	form_for :company do |f|
		f.fields_for :user, f.object.user_or_build do |fu|
			fu.text_field :name
		f.fields_for :location, f.object.location_or_build do |fl|
			fl.text_field :address
			
No longer need to call `f.object.user || f.object.build_user`

## Using with NoSQL databases

Just include in your document module `GetOrBuild::AssociationBuilder` and it will attach magic methods automatically

## Extension for fields_for method

You are able also to use option `:build_association` for `fields_for` method to build association if it doesn't exist yet:

		form_for :company do |f|
			f.fields_for :user, :build_association => true do |fu|
				fu.text_field :name
			f.fields_for :user, :build_association => true do |fl|
				fl.text_field :address

If you initialize associated object user for company before run `fields_for` helper then option `:build_association` won't give any effect

## Contributing
You are welcome! Please, run test before pull request: `rake` and make sure if everything is working correctly.

## TODO
* Support for NoSQL databases
