class LinkGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :comments, type: :boolean, default: true

  def create_model
    puts "Comment option: #{options.comments?}"
    template "model.rb.erb", "app/models/links/#{file_name}.rb"
  end

  def create_test
    template "test.rb.erb", "test/models/links/#{test_file_name}.rb"
  end

  private

  def model_name
    file_name.camelize
  end

  def test_file_name
    "#{file_name}_test"
  end
end
