class OutfitsController < ApplicationController
  def index
    matching_outfits = Outfit.all

    @list_of_outfits = matching_outfits.order({ :created_at => :desc })

    render({ :template => "outfits/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_outfits = Outfit.where({ :id => the_id })

    @the_outfit = matching_outfits.at(0)

    render({ :template => "outfits/show" })
  end

  def create
    the_outfit = Outfit.new
    the_outfit.user_id = params.fetch("query_user_id")
    the_outfit.name = params.fetch("query_name")
    the_outfit.wardrobe_outfits_count = params.fetch("query_wardrobe_outfits_count")
  
    if the_outfit.valid?
      the_outfit.save
  
      selected_clothing_ids = params[:query_clothing_ids] || []
  
      selected_clothing_ids.each do |clothing_id|
        OutfitItem.create(outfit_id: the_outfit.id, clothing_id: clothing_id)
      end
  
      redirect_to("/outfits", { :notice => "Outfit created with #{selected_clothing_ids.count} items." })
    else
      redirect_to("/outfits", { :alert => the_outfit.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_outfit = Outfit.where({ :id => the_id }).at(0)

    the_outfit.user_id = params.fetch("query_user_id")
    the_outfit.name = params.fetch("query_name")
    the_outfit.wardrobe_outfits_count = params.fetch("query_wardrobe_outfits_count")

    if the_outfit.valid?
      the_outfit.save
      redirect_to("/outfits/#{the_outfit.id}", { :notice => "Outfit updated successfully."} )
    else
      redirect_to("/outfits/#{the_outfit.id}", { :alert => the_outfit.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_outfit = Outfit.where({ :id => the_id }).at(0)

    the_outfit.destroy

    redirect_to("/outfits", { :notice => "Outfit deleted successfully."} )
  end
end
