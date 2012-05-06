module ApplicationHelper
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end

  def boolean_to_text(boolean)
    boolean ? 'Ja' : 'Nee'
  end

  def link_to_modal(name , link)
    link_to name, link, {remote: true, class: 'btn btn-mini', 'data-toggle' => 'modal', 'data-target' => 'modal-window', 'data-backdrop' => true, 'data-keyboard' => true}
  end

  def link_to_modal_new(name, link)
    link_to raw("<i class=\"icon-plus-sign icon-white\"></i> #{name}"), link, {remote: true, class: 'btn btn-primary', 'data-toggle' => 'modal', 'data-target' => 'modal-window', 'data-backdrop' => true, 'data-keyboard' => true}
  end

  def link_to_destroy(name, link)
    link_to name, link, confirm: 'Weet u het zeker?', method: :delete, class: 'btn btn-mini btn-danger'
  end

end
