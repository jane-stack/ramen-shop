class MenusController < ApplicationController
    skip_before_action :authorize, only: [:index, :create, :update, :destroy]

    def index
        render json: Menu.all
    end

    def create
        menu = Menu.create(menu_params)
        render json: menu, status: 201
    end

    def update
        menu = find_menu.update(menu_params)
        render json: menu
    end

    def destroy
        menu = find_menu.destroy
        render json: { message: "Item deleted" }
    end

    private

    def find_menu
        Menu.find_by_id(params[:id])
    end

    def menu_params
        params.permit(:image, :name, :price)
    end
end
