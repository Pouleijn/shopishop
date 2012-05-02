class Admin::EmployeesController < Admin::BaseController
  respond_to :js, only: [:show, :new, :edit]
  
    def index
      @employees = Employee.all
  
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  
    def show
      @employee = Employee.find(params[:id])
    end
  
    def new
      @employee = Employee.new
      @employee.build_user
    end
  
    def edit
      @employee = Employee.find(params[:id])
    end
  
    def create
      @employee = Employee.new(params[:employee])
  
      respond_to do |format|
        if @employee.save
          format.html { redirect_to admin_employees_path, notice: 'Employee was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end
  
    def update
      @employee = Employee.find(params[:id])
  
      respond_to do |format|
        if @employee.update_attributes(params[:employee])
          format.html { redirect_to admin_employees_path, notice: 'Employee was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      end
    end
  
    def destroy
      @employee = Employee.find(params[:id])
      @employee.destroy
  
      respond_to do |format|
        format.html { redirect_to admin_employees_url }
      end
    end
end
