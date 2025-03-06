class WardrobeOutfitsController < ApplicationController
  def index
    matching_wardrobe_outfits = WardrobeOutfit.all

    @list_of_wardrobe_outfits = matching_wardrobe_outfits.order({ :created_at => :desc })

    render({ :template => "wardrobe_outfits/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_wardrobe_outfits = WardrobeOutfit.where({ :id => the_id })

    @the_wardrobe_outfit = matching_wardrobe_outfits.at(0)

    render({ :template => "wardrobe_outfits/show" })
  end

  def create
    the_wardrobe_outfit = WardrobeOutfit.new
    the_wardrobe_outfit.wardrobe_id = params.fetch("query_wardrobe_id")
    the_wardrobe_outfit.outfit_id = params.fetch("query_outfit_id")

    if the_wardrobe_outfit.valid?
      the_wardrobe_outfit.save
      redirect_to("/wardrobe_outfits", { :notice => "Wardrobe outfit created successfully." })
    else
      redirect_to("/wardrobe_outfits", { :alert => the_wardrobe_outfit.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_wardrobe_outfit = WardrobeOutfit.where({ :id => the_id }).at(0)

    the_wardrobe_outfit.wardrobe_id = params.fetch("query_wardrobe_id")
    the_wardrobe_outfit.outfit_id = params.fetch("query_outfit_id")

    if the_wardrobe_outfit.valid?
      the_wardrobe_outfit.save
      redirect_to("/wardrobe_outfits/#{the_wardrobe_outfit.id}", { :notice => "Wardrobe outfit updated successfully."} )
    else
      redirect_to("/wardrobe_outfits/#{the_wardrobe_outfit.id}", { :alert => the_wardrobe_outfit.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_wardrobe_outfit = WardrobeOutfit.where({ :id => the_id }).at(0)

    the_wardrobe_outfit.destroy

    redirect_to("/wardrobe_outfits", { :notice => "Wardrobe outfit deleted successfully."} )
  end
end
