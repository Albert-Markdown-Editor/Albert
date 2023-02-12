# frozen_string_literal: true

module Layout
  # Component wrapper for +layouts/application.html+ view. Defines a consistent
  # application layout across all views that can be easily customized for page
  # needs
  class ApplicationLayoutComponent < ApplicationComponent
    # +<head>+ layout content
    class Head < ApplicationComponent
      DEFAULT_TITLE = I18n.t("application_title")

      META_CONFIG = {
        # Browser area in which page can be seen
        name: "viewport",

        # Display configuration for web browser
        # - Set page width. Device width means 100vw width
        # - Zoom level when page is first loaded
        content: "width=device-width, initial-scale=1",

        # Tells web browser which character set to use
        charset: "UTF-8",
      }

      delegate :csrf_meta_tags, :csp_meta_tag, to: :helpers

      attr_reader :title, :meta_tags

      def initialize(title: nil, meta_tags: {}, html_attributes: {})
        @title = title || DEFAULT_TITLE
        @meta_tags = META_CONFIG.merge(meta_tags)
        super(html_attributes:)
      end

      def call
        tag.head(**wrapper_attributes) do
          # Application title displayed in web-browser tab
          concat(tag.title(title))

          # Page meta configuration
          concat(tag.meta(**meta_tags))

          # Cross-Site Request Prevention meta tag:
          # https://stackoverflow.com/questions/9996665/rails-how-does-csrf-meta-tag-work
          # https://www.gnucitizen.org/blog/csrf-demystified/
          concat(csrf_meta_tags)

          # Content Security Policy meta tag:
          # https://stackoverflow.com/questions/30280370/how-does-content-security-policy-csp-work
          concat(csp_meta_tag)

          concat(stylesheet_link_tag("application", media: "all", "data-turbolinks-track" => true))
          concat(javascript_include_tag("application", media: "all", "data-turbolinks-track" => true))
        end
      end
    end

    # +<body>+ layout content
    class Body < ApplicationComponent
      def call
        content_tag(:body, content, wrapper_attributes)
      end

      def default_html_attributes
        concat_html_attributes(super, {
          class: "h-screen w-screen"
        })
      end
    end

    renders_one :head, Head
    renders_one :body, Body

    def call
      tag.html(**wrapper_attributes) do
        concat(head? ? head : render(Head.new))
        concat(body? ? body : render(Body.new))
      end
    end
  end
end
