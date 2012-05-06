class Admin::LabelsController < Admin::BaseController
  def new
    @label = Label.new
  end

  def index
    @labels = Label.order(:name)
  end

  def show
    @label = Label.find(params[:id])
  end

  def edit
    @label = Label.find(params[:id])
  end

  def create
    @label = Label.find_or_create_by_name(params["label"]["name"])

    categories = params["label"].fetch("category", [])
    categories.each { |c|
        Labelization.create(:label_id => @label.id, :category_id => c) unless c.blank? 
      }

    redirect_to admin_labels_path
  end

  def update
    @label = Label.find(params["id"])

    if @label.update_attributes(:name => params["label"]["name"])
      redirect_to admin_labels_path
    else
      render :edit
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    redirect_to admin_labels_path
  end
end
