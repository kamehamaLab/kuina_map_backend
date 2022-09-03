class DetectionReptsController < ApplicationController
    def index
        repts = DetectionRept.all
        render json: repts.to_json(:include => :device)
    end
    def show
        render json: DetectionRept.find(params[:id]).to_json(:include => :device)
    end
    def create
        rept = DetectionRept.new(rept_params)
        if rept.save
            ActionCable.server.broadcast('CabinetChannel',rept.to_json(:include => :device))
            render json: { status: 'success', data: rept }
        else
            render json: { status: 'error', data: rept }
        end
    end
    def update
        rept = DetectionRept.find(params[:id])
        if rept.update(rept_params)
            render json: { status: 'success', data: rept }
        else
            render json: { status: 'error', data: rept }
        end
    end
    def destroy
    end

    private
        def rept_params
            params.require(:detection_rept).permit(:device_id, :x_coord, :y_coord)
        end
end
