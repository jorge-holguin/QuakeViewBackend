module Api
    class FeaturesController < ApplicationController
      def index
        features = Feature.all
        render json: features
      end
  
      def show
        feature = Feature.find(params[:id])
        render json: feature
      end
    end
  end
  