# frozen_string_literal: true

# Set of common methods used by all controllers connected
# to routes which use resource slugs as parameter
module WithSlugRoutes
  private

  def slug_resource
    raise %(
      Controller #{self.class.name} does not define 'slug_resource' method.
      Method required by 'slug_resource' concern to detect deprecated slugs
      in requests.
    )
  end

  def redirect_to_url_with_active_slug
    redirect_to(slug_resource, status: :moved_permanently)
  end

  def request_with_deprecated_slug?
    request.url != url_for(slug_resource)
  end
end
