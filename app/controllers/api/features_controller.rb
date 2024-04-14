module Api
  class FeaturesController < ApplicationController
    include ActionController::MimeResponds

    def index
      features = apply_filters(Feature.all, params)
      paginated_features = features.paginate(page: params[:page], per_page: params[:per_page] || 10)
      respond_to do |format|
        format.json { render json: paginated_features }
      end
    end

    def show
      feature = Feature.find(params[:id])
      render json: feature
    end

    private

    def apply_filters(features, params)
      features = features.where('mag_type = ?', params[:mag_type]) if params[:mag_type].present?
      features
    end
  end
end
