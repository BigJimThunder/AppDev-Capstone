class ClothingsController < ApplicationController
  def index
    matching_clothings = Clothing.all

    @list_of_clothings = matching_clothings.order({ :created_at => :desc })

    render({ :template => "clothings/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_clothings = Clothing.where({ :id => the_id })

    @the_clothing = matching_clothings.at(0)

    render({ :template => "clothings/show" })
  end

  def create
    the_clothing = Clothing.new
    the_clothing.user_id = params.fetch("query_user_id")
    the_clothing.category = params.fetch("query_category")
    the_clothing.color = params.fetch("query_color")
    the_clothing.material = params.fetch("query_material")
    the_clothing.season = params.fetch("query_season")
    the_clothing.image = params.fetch("query_image")
    the_clothing.brand = params.fetch("query_brand")
    the_clothing.size = params.fetch("query_size")
    the_clothing.outfit_items_count = params.fetch("query_outfit_items_count")

    if the_clothing.valid?
      the_clothing.save
      redirect_to("/clothings", { :notice => "Clothing created successfully." })
    else
      redirect_to("/clothings", { :alert => the_clothing.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_clothing = Clothing.where({ :id => the_id }).at(0)

    the_clothing.user_id = params.fetch("query_user_id")
    the_clothing.category = params.fetch("query_category")
    the_clothing.color = params.fetch("query_color")
    the_clothing.material = params.fetch("query_material")
    the_clothing.season = params.fetch("query_season")
    the_clothing.image = params.fetch("query_image")
    the_clothing.brand = params.fetch("query_brand")
    the_clothing.size = params.fetch("query_size")
    the_clothing.outfit_items_count = params.fetch("query_outfit_items_count")

    if the_clothing.valid?
      the_clothing.save
      redirect_to("/clothings/#{the_clothing.id}", { :notice => "Clothing updated successfully."} )
    else
      redirect_to("/clothings/#{the_clothing.id}", { :alert => the_clothing.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_clothing = Clothing.where({ :id => the_id }).at(0)

    the_clothing.destroy

    redirect_to("/clothings", { :notice => "Clothing deleted successfully."} )
  end
end
