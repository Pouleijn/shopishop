class Admin::LabelsController < Admin::BaseController
  def new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    @label = Label.find_or_create_by_name(params["label"]["name"])
    params["label"]["category"].each do |c|
      Labelization.create(:label_id => @label.id, :category_id => c) unless c.blank?
    end
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
    @label.destroy
    redirect_to admin_labels_path
  end
end
