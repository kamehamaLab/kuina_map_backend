class DetectionReptsController < ApplicationController
    def index
        repts = DetectionRept.all
        render json: repts
    end
    def show
        render json: DetectionRept.find(params[:id])
    end
    def create
        rept = DetectionRept.new(rept_params)
        if rept.save
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
            params.require(:detection_repts).permit(:device_id, :x_coord, :y_coord)
        end
end
