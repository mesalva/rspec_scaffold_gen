module RspecScaffoldGen

	def generate_controller(model_name, fields={})
		template = File.read(File.expand_path("../rspec_scaffold_gen/scaffold_controller.txt.erb", __FILE__))
		@model_class_name = model_name.classify
		@model_name = model_name
		ERB.new(template).result(binding)
	end
end
