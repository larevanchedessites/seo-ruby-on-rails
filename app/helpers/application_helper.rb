module ApplicationHelper

  def canonical(url)
    content_for(:canonical, tag(:link, rel: :canonical, href: url)) if url
  end

  def markdown(text)
    text = text.presence || ""
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    return markdown.render(text).html_safe
  end

end
