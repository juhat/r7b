module Admin
  class SettingsController < ApplicationController
    before_action :authenticate_user!
    before_action -> { redirect_to root_path, alert: "Not an admin" unless current_user.admin? }

    def show
      @errors = []
    end

    def create
      @errors = []
      params[:setting].keys.each do |key|
        next if params[:setting][key].nil?

        setting = Setting.new(var: key)
        setting.value = params[:setting][key].strip
        unless setting.valid?
          @errors.merge!(setting.errors)
        end
      end

      if @errors.any?
        render :new
      end

      params[:setting].keys.each do |key|
        Setting.send("#{key}=", params[:setting][key].strip) unless params[:setting][key].nil?
      end

      redirect_to admin_settings_path, notice: "Setting was successfully updated."
    end
  end
end
