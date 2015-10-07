class LinkGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :sub_directory, type: :string
  argument :file_name,     type: :string
  class_option :comments,  type: :boolean, default: true

  def check_model_directory
    empty_directory(model_path) unless Dir.exists?(model_path)
  end

  def create_model
    template "model.rb.erb", File.join(model_path, model_file_name)
  end

  def check_test_directory
    empty_directory(test_path) unless Dir.exists?(test_path)
  end

  def create_test
    template "test.rb.erb", File.join(test_path, test_file_name)
  end

  private

  def model_path
    "app/models/links/#{sub_directory.underscore}"
  end

  def model_file_name
    "#{file_name.underscore}.rb"
  end

  def test_path
    "test/models/links/#{sub_directory.underscore}"
  end

  def test_file_name
    "#{file_name.underscore}_test.rb"
  end

  def submodule_name
    sub_directory.camelize
  end

  def class_name
    file_name.camelize
  end

end
