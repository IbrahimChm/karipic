class CommentsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @photo = Photo.find(params[:photo_id])
      @comment = @photo.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to photo_path(@photo), notice: 'Comentario agregado exitosamente'
      else
        redirect_to photo_path(@photo), alert: 'Error al agregar el comentario'
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end