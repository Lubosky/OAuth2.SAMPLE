module ApplicationHelper
  def layout_class(layout = nil)
    if layout.to_s == 'fluid'
      container_layout = 'container-fluid'
    else
      container_layout = 'container'
    end
    @layout_class ||= container_layout
  end

  def navbar
    render 'shared/navbar'
  end

  def footer
    render 'shared/footer'
  end

  def flash_messages
    render 'layouts/flash_messages'
  end

  def bootstrap_modal(options = {}, &block)
    default_options = { id: 'modal_id', label: '', title: '' }
    options = default_options.merge options
    output  = capture(&block)
    view = capture do
      render template: '/popup/layout', locals: { options: options, output: output }
    end

    render template: '/popup/wrap_js', locals: { view: view }, formats: [request.format.symbol]
  end
end
