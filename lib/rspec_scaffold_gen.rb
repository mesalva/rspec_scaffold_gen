require "fileutils"
module RspecScaffoldGen

	def generate_controller(model_name, fields={})
		template = File.read(File.expand_path("../rspec_scaffold_gen/scaffold_controller.txt.erb", __FILE__))
		@model_class_name = model_name.classify
		@model_name = model_name
		@fields = fields
		content = ERB.new(template).result(binding)
		#write_file(model_name, content)
		content
	end

	def write_file(model_name, content)
		file_path = "#{Rails.root}/spec/controllers/#{model_name}_controller_spec.rb"
		dirname = File.dirname(file_path)
		unless File.directory?(dirname)
		  FileUtils.mkdir_p(dirname)
		end
		File.write(file_path, content)
	end
end
