class DogsController < ApplicationController
    before_action :set_dog, only: [:edit, :show, :update, :destroy]
    
    def index
        @dogs = Dog.all
    end

    def new
        @dog = Dog.new
    end

    def create
    end

    def show
        
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_dog
        @dog = Dog.find(params[:id])
    end


end
