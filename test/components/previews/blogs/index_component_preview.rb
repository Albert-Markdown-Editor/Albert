# @label IndexComponent
class Blogs::IndexComponentPreview < ViewComponent::Preview
  def self.sample_blogs
    @@sample_blogs ||= []
  end

  def default
    blogs = self.class.sample_blogs
    render(Blogs::IndexComponent.new(blogs:, html_attributes: {}))
  end
end
