class SoftwaresController < ApplicationController
    def index
        @softwares = Software.all 
    end

    def new
        @software = Software.new
    end

    def create
      @software = Software.new(params.require(:software).permit(:name, :version))
      if @software.save
        flash[:notice] = 'software registrado com sucesso'
        redirect_to softwares_path
      else
        flash[:alert] = 'Sofware não Registrado'
        render :new
      end
    end

    def show
      @software = Software.find(params[:id])

    end

    def edit
      @software = Software.find(params[:id])
    end

    def update
      @software = Software.find(params[:id])
      if @software.update(params.require(:software).permit(:name, :version))
        redirect_to softwares_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      software = Software.find(params[:id])
      software.destroy
      redirect_to softwares_path
    end
end
