class WardrobesController < ApplicationController
  def index
    matching_wardrobes = Wardrobe.all

    @list_of_wardrobes = matching_wardrobes.order({ :created_at => :desc })

    render({ :template => "wardrobes/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_wardrobes = Wardrobe.where({ :id => the_id })

    @the_wardrobe = matching_wardrobes.at(0)

    render({ :template => "wardrobes/show" })
  end

  def create
    the_wardrobe = Wardrobe.new
    the_wardrobe.user_id = params.fetch("query_user_id")
    the_wardrobe.name = params.fetch("query_name")
    the_wardrobe.wardrobe_outfits_count = params.fetch("query_wardrobe_outfits_count")

    if the_wardrobe.valid?
      the_wardrobe.save
      redirect_to("/wardrobes", { :notice => "Wardrobe created successfully." })
    else
      redirect_to("/wardrobes", { :alert => the_wardrobe.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_wardrobe = Wardrobe.where({ :id => the_id }).at(0)

    the_wardrobe.user_id = params.fetch("query_user_id")
    the_wardrobe.name = params.fetch("query_name")
    the_wardrobe.wardrobe_outfits_count = params.fetch("query_wardrobe_outfits_count")

    if the_wardrobe.valid?
      the_wardrobe.save
      redirect_to("/wardrobes/#{the_wardrobe.id}", { :notice => "Wardrobe updated successfully."} )
    else
      redirect_to("/wardrobes/#{the_wardrobe.id}", { :alert => the_wardrobe.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_wardrobe = Wardrobe.where({ :id => the_id }).at(0)

    the_wardrobe.destroy

    redirect_to("/wardrobes", { :notice => "Wardrobe deleted successfully."} )
  end
end
