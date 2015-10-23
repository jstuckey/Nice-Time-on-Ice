class ExternalLinkPresenter

  include ActionView::Helpers::UrlHelper

  def initialize(context, module_name)
    @context = context
    @module_name = "Links::#{module_name.to_s.camelize}".constantize
  end

  def links
    return [] unless context.game.present?
    bodies.zip(urls).map do |body, url|
      link_to(body, url, class: "link", target: "new")
    end
  end

  def headers
    return [] unless context.game.present?
    site_names_with_duplicates_replaced
  end

  private

  attr_reader :context, :module_name

  def link_objects
    @link_objects||= begin
      autoload_link_objects
      instantiate_link_objects
    end
  end

  def autoload_link_objects
    Links::Base.autoload_links
  end

  def instantiate_link_objects
    module_name.constants
      .reject { |const_name| const_name =~ /Test$/ }
      .map { |const_name| module_name.const_get(const_name) }
      .map { |klass| klass.new(context) }
      .sort
  end

  def urls
    @urls ||= link_objects.map(&:url)
  end

  def bodies
    @bodies ||= link_objects.map(&:description)
  end

  def site_names
    @site_names ||= link_objects.map(&:site_name)
  end

  def site_names_with_duplicates_replaced
    current_name = nil
    site_names.map do |name|
      if current_name == name
        nil
      else
        current_name = name
        name
      end
    end
  end

end
