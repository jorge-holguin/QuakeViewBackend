module Api
  class CommentsController < ApplicationController
    # Método para manejar las solicitudes GET a /api/features/:feature_id/comments
    def index
      feature = Feature.find(params[:feature_id])
      comments = feature.comments
      render json: comments
    end

    # Método para manejar las solicitudes POST para crear un nuevo comentario
    def create
      feature = Feature.find(params[:feature_id])
      comment = feature.comments.build(comment_params)
      if comment.save
        render json: comment, status: :created
      else
        render json: comment.errors, status: :unprocessable_entity
      end
    end

    # Método para manejar las solicitudes DELETE para borrar un comentario
    def destroy
      comment = Comment.find(params[:id])
      if comment.destroy
        head :no_content  # Responde con éxito y sin contenido si el comentario se elimina correctamente
      else
        render json: comment.errors, status: :unprocessable_entity
      end
    end

    private

    # Método para definir los parámetros permitidos para los comentarios
    def comment_params
      params.require(:comment).permit(:body)
    end
  end
end
