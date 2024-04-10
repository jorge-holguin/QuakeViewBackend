module Api
  class CommentsController < ApplicationController
    # Método para manejar las solicitudes GET a /api/features/:feature_id/comments
    def index
      # Encuentra el evento sismológico correspondiente
      feature = Feature.find(params[:feature_id])
      # Obtén los comentarios asociados a ese evento sismológico
      comments = feature.comments
      # Responde con los comentarios en formato JSON
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

    private

    # Método para definir los parámetros permitidos para crear un comentario
    def comment_params
      params.require(:comment).permit(:body)
    end
  end
end
