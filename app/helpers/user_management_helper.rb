module UserManagementHelper

  def criar_atualizar_usuario_path(usuario)
    usuario.new_record? ? user_management_index_path : user_management_path(usuario.id)
  end

end
