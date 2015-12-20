class UserManagementController < ApplicationController

  load_and_authorize_resource class: User,
  instance_name: :usuario,
  param_method: :usuario_params

  def index
    @usuario = User.new
  end

  def new
  end

  def edit
  end

  def create
    @password = "%08d" % (rand*1000000)
    @usuario.password = @password

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to user_management_index_path, notice: 'Usuário criado com sucesso.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        URI(request.referer).path == edit_user_management_path ? path = user_management_index_path : path = URI(request.referer).path
        format.html { redirect_to path, notice: 'Usuário atualizado com sucesso.' }
        format.json { render :index, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_self
    respond_to do |format|
      if @usuario.update_with_password(usuario_params)
        sign_in @usuario, :bypass => true
        format.html { redirect_to minha_conta_path, notice: 'Usuário atualizado com sucesso.' }
        format.json { render :minha_conta, status: :ok, location: @usuario }
      else
        format.html { redirect_to minha_conta_path }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def alterar_senha
    @usuario=current_user
  end

  def minha_conta
    @usuario=current_user
  end

  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to user_management_index_path, notice: 'Usuário removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:user).permit(:nome, :email, :current_password, :password, :password_confirmation, :image, :avatar, :avatar_cache)
    end

end
