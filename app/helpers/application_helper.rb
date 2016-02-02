module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def botao_adicionar(classe, path, label="Adicionar")
    if can? :create, classe
      link_to "<span class=\"glyphicon glyphicon-plus-sign\"></span> #{label}".html_safe, path, :class => 'btn btn-primary',  remote: true
    end
  end

  def botao_editar(classe, path, label="Editar")
    if can? :update, classe
      link_to "<span class=\"glyphicon glyphicon-pencil\"></span> #{label}".html_safe, path, :class => 'btn btn-default btn-xs', remote: true
    end
  end

  def botao_excluir(classe, path, label="Remover")
    if can? :destroy, classe
      link_to "<span class=\"glyphicon glyphicon-trash\"></span> #{label}".html_safe, path, :method => :delete, :data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) }, :class => 'btn btn-xs btn-danger'
    end
  end

end
