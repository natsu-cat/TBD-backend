module Api
  module V1
    class FetchController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_video, only: %i[show update]

      def index
        videos = Video.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded videos', data: videos }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the video', data: @video }
      end

      def create
        video = Video.new(video_params)
        if video.save
          render json: { status: 'SUCCESS', data: video }
        else
          render json: { status: 'SUCCESS', data: video.errors }
        end
      end

      def update
        if @video.update(video_params)
          render json: { status: 'SUCCESS', message: 'Update the post', data: @video }
        else
          render json: { status: 'SUCCESS', message: 'Note updated', data: @video.errors }
        end
      end

      private

      def set_video
        @video = Video.find(params[:id])
      end

      def video_params
        params.permit(:Title, :Game, :URL, :Image, :Time, :Total, :Date)
      end
    end
  end
end
