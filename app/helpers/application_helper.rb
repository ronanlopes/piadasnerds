module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def botao_adicionar(classe, path)
    if can? :create, classe
      link_to "<span class=\"glyphicon glyphicon-plus-sign\"></span> Adicionar".html_safe, path, :class => 'btn btn-primary',  remote: true
    end
  end

  def botao_editar(classe, path)
    if can? :update, classe
      link_to "<span class=\"glyphicon glyphicon-pencil\"></span> Editar".html_safe, path, :class => 'btn btn-default btn-xs', remote: true
    end
  end

  def botao_excluir(classe, path)
    if can? :destroy, classe
      link_to "<span class=\"glyphicon glyphicon-trash\"></span> Excluir".html_safe, path, :method => :delete, :data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) }, :class => 'btn btn-xs btn-danger'
    end
  end

end
