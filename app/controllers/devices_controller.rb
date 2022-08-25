class DevicesController < ApplicationController
    def index
        allDevices = Device.all
        render json: allDevices
    end
    def show
        render json: Device.find(params[:id])
    end
    def create
        device = Device.new(device_params)
        if device.save
            render json: { status: 'success', data: device }
        else
            render json: { status: 'error', data: device }
        end
    end
    def update
        device = Device.find(params[:id])
        if device.update(device_params)
            render json: { status: 'success', data: device }
        else
            render json: { status: 'error', data: device }
        end
    end
    def destroy
    end

    private
        def device_params
            params.require(:device).permit(:name, :remaining_bat)
        end
end
