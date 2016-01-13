class ControllerSpecGenerator < Rails::Generators::Base

  include RspecScaffoldGen

  def create_controller_spec
  	p ARGV
  	model_name = ARGV[0]
  	fields = {}
  	ARGV.each_with_index do |val, index|
  		next if index == 0
  		parts = val.split(/:/)
  		name = parts.first.downcase
  		type = parts.length > 1 ? parts[1] : nil
  		fields[name.to_sym] = type
  	end
    create_file "#{Rails.root}/spec/controllers/#{model_name.pluralize}_controller_spec.rb", generate_controller(model_name, fields)
  end
end
