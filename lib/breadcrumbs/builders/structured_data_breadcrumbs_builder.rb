class Breadcrumbs::Builders::StructuredDataBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    @elements.collect do |element|
      render_element(element)
    end.join(@options[:separator] || " &raquo; ")
  end

  def render_element(element)
    if element.path == nil
      content = compute_name(element)
    else
      content = @context.link_to_unless_current(compute_name(element), compute_path(element), element.options.merge({
        itemscope: "",
        itemtype: "http://schema.org/Thing",
        itemprop: "item"
      }))
    end
    if @options[:tag]
      @context.content_tag(
        @options[:tag],
        content,
        {itemprop:"itemListElement", itemscope: "", itemtype:"http://schema.org/ListItem"}
      )
    else
      ERB::Util.h(content)
    end
  end
end
