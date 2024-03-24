# frozen_string_literal: true

# app/controllers/employees_controller.rb

module Api
  module V1
    class EmployeesController < ApplicationController
      before_action :set_employee, only: %i[show update destroy]

      # GET /employees

      def index
        @employees = Employee.all

        render json: @employees
      end

      # GET /employees/1

      def show
        render json: @employee
      end

      # POST /employees

      def create
        @employee = Employee.new(employee_params)

        if @employee.save

          render json: @employee, status: :created, message: 'Employee created successfully'

        else

          render json: @employee.errors, status: :unprocessable_entity

        end
      end

      # PATCH/PUT /employees/1

      def update
        if @employee.update(employee_params)

          render json: @employee, message: 'Employee updated successfully'

        else

          render json: @employee.errors, status: :unprocessable_entity

        end
      end

      # DELETE /employees/1

      def destroy
        @employee.destroy

        render json: { message: 'Employee deleted successfully' }
      end

      private

      # Use callbacks to share common setup or constraints between actions.

      def set_employee
        @employee = Employee.find(params[:id])
      rescue ActiveRecord::RecordNotFound => error
        render json: { message: error.message }, status: :not_found
      end

      # Only allow a trusted parameter "white list" through.

      def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :contact_number, :address)
      end
    end
  end
end
