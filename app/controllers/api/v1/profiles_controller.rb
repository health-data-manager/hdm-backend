# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < ApiController
      def index
        render json: current_resource_owner.profiles, status: :ok
      end

      def show
        render json: find_profile, status: :ok
      end

      def create
        profile =
          Profile.transaction do
            current_resource_owner.profiles.create!(profile_params).tap do |created_profile|
              created_profile.photo.attach(params[:profile][:photo]) if params[:profile][:photo].present?
            end
          end

        render json: profile, status: :created
      end

      def update
        profile = find_profile

        Profile.transaction do
          profile.update!(profile_params)
          if params[:profile][:photo].present?
            profile.photo.purge
            profile.photo.attach(params[:profile][:photo])
          elsif params[:profile][:photo] == ''
            profile.photo.purge
          end
        end

        render json: profile, status: :ok
      end

      def destroy
        profile = find_profile
        render json: profile, status: :ok if profile.destroy
      end

      private

      def find_profile
        current_resource_owner.profiles.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def profile_params
        params.require(:profile).permit(:name, :first_name, :last_name, :dob,
                                        :gender, :middle_name, :street, :city,
                                        :state, :zip, :relationship, :telephone,
                                        :telephone_use)
      end
    end
  end
end
