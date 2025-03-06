class ClothingTagsController < ApplicationController
  def index
    matching_clothing_tags = ClothingTag.all

    @list_of_clothing_tags = matching_clothing_tags.order({ :created_at => :desc })

    render({ :template => "clothing_tags/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_clothing_tags = ClothingTag.where({ :id => the_id })

    @the_clothing_tag = matching_clothing_tags.at(0)

    render({ :template => "clothing_tags/show" })
  end

  def create
    the_clothing_tag = ClothingTag.new
    the_clothing_tag.clothing_id = params.fetch("query_clothing_id")
    the_clothing_tag.tag_id = params.fetch("query_tag_id")

    if the_clothing_tag.valid?
      the_clothing_tag.save
      redirect_to("/clothing_tags", { :notice => "Clothing tag created successfully." })
    else
      redirect_to("/clothing_tags", { :alert => the_clothing_tag.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_clothing_tag = ClothingTag.where({ :id => the_id }).at(0)

    the_clothing_tag.clothing_id = params.fetch("query_clothing_id")
    the_clothing_tag.tag_id = params.fetch("query_tag_id")

    if the_clothing_tag.valid?
      the_clothing_tag.save
      redirect_to("/clothing_tags/#{the_clothing_tag.id}", { :notice => "Clothing tag updated successfully."} )
    else
      redirect_to("/clothing_tags/#{the_clothing_tag.id}", { :alert => the_clothing_tag.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_clothing_tag = ClothingTag.where({ :id => the_id }).at(0)

    the_clothing_tag.destroy

    redirect_to("/clothing_tags", { :notice => "Clothing tag deleted successfully."} )
  end
end
