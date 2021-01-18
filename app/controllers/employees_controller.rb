class EmployeesController < ApplicationController
    before_action :set_employee, only: [:edit, :show, :update, :destroy]
    
    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        
        new_employee = Employee.create(employee_info(:first_name, :last_name, :alias, :title, :office, :dog_id))
        if new_employee.valid?
            redirect_to employee_path(new_employee)
        else
            flash[:messages] = new_employee.errors.full_messages
            redirect_to new_employee_path
        end

    end

    def show
        
    end

    def edit
    end

    def update
       @employee.update(employee_info(:first_name, :last_name, :alias, :title, :office, :dog_id))
       if @employee.valid?
        redirect_to employee_path(@employee)
       else
        flash[:messages] = @employee.errors.full_messages
            redirect_to edit_employee_path
       end


    end

    def destroy
    end

    private

    def set_employee
        @employee = Employee.find(params[:id])
    end

    def employee_info(*args)
        params.require(:employee).permit(*args)
    end
end
