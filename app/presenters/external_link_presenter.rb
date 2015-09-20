class ExternalLinkPresenter

  include ActionView::Helpers::UrlHelper

  def initialize(context, module_name)
    @context = context
    @module_name = "Links::#{module_name.to_s.camelize}".constantize
  end

  def links
    bodies.zip(urls).map do |body, url|
      link_to(body, url, class: "link", target: "new")
    end
  end

  def headers
    current_name = nil
    link_objects.map do |link|
      name = link.site_name
      if current_name == name
        nil
      else
        current_name = name
        name
      end
    end
  end

  private

  attr_reader :context, :module_name

  def link_objects
    @link_objects||= begin
      Links::Base.autoload_links

      klasses = module_name.constants.map do |const|
        module_name.const_get(const)
      end

      objects = klasses.map do |klass|
        klass.new(context)
      end

      objects.sort
    end
  end

  def urls
    link_objects.map(&:url)
  end

  def bodies
    link_objects.map(&:description)
  end

end
