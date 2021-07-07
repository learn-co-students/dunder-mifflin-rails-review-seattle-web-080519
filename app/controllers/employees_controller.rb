class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.new(employee_params)
        @dogs = Dog.all
        # byebug
        if @employee.save
            # byebug
            redirect_to employee_path(@employee)
        else
            # byebug
            render :new
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)

        if @employee.valid?
            # byebug
            redirect_to employee_path(@employee)
        else
            # byebug
            render :new
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end
end
