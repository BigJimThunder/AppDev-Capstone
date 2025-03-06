Rails.application.routes.draw do
  get 'users/home'
  # Routes for the Wardrobe outfit resource:

  # CREATE
  post("/insert_wardrobe_outfit", { :controller => "wardrobe_outfits", :action => "create" })
          
  # READ
  get("/wardrobe_outfits", { :controller => "wardrobe_outfits", :action => "index" })
  
  get("/wardrobe_outfits/:path_id", { :controller => "wardrobe_outfits", :action => "show" })
  
  # UPDATE
  
  post("/modify_wardrobe_outfit/:path_id", { :controller => "wardrobe_outfits", :action => "update" })
  
  # DELETE
  get("/delete_wardrobe_outfit/:path_id", { :controller => "wardrobe_outfits", :action => "destroy" })

  #------------------------------

  # Routes for the Wardrobe resource:

  # CREATE
  post("/insert_wardrobe", { :controller => "wardrobes", :action => "create" })
          
  # READ
  get("/wardrobes", { :controller => "wardrobes", :action => "index" })
  
  get("/wardrobes/:path_id", { :controller => "wardrobes", :action => "show" })
  
  # UPDATE
  
  post("/modify_wardrobe/:path_id", { :controller => "wardrobes", :action => "update" })
  
  # DELETE
  get("/delete_wardrobe/:path_id", { :controller => "wardrobes", :action => "destroy" })

  #------------------------------

  # Routes for the Favorite resource:

  # CREATE
  post("/insert_favorite", { :controller => "favorites", :action => "create" })
          
  # READ
  get("/favorites", { :controller => "favorites", :action => "index" })
  
  get("/favorites/:path_id", { :controller => "favorites", :action => "show" })
  
  # UPDATE
  
  post("/modify_favorite/:path_id", { :controller => "favorites", :action => "update" })
  
  # DELETE
  get("/delete_favorite/:path_id", { :controller => "favorites", :action => "destroy" })

  #------------------------------

  # Routes for the Clothing tag resource:

  # CREATE
  post("/insert_clothing_tag", { :controller => "clothing_tags", :action => "create" })
          
  # READ
  get("/clothing_tags", { :controller => "clothing_tags", :action => "index" })
  
  get("/clothing_tags/:path_id", { :controller => "clothing_tags", :action => "show" })
  
  # UPDATE
  
  post("/modify_clothing_tag/:path_id", { :controller => "clothing_tags", :action => "update" })
  
  # DELETE
  get("/delete_clothing_tag/:path_id", { :controller => "clothing_tags", :action => "destroy" })

  #------------------------------

  # Routes for the Tag resource:

  # CREATE
  post("/insert_tag", { :controller => "tags", :action => "create" })
          
  # READ
  get("/tags", { :controller => "tags", :action => "index" })
  
  get("/tags/:path_id", { :controller => "tags", :action => "show" })
  
  # UPDATE
  
  post("/modify_tag/:path_id", { :controller => "tags", :action => "update" })
  
  # DELETE
  get("/delete_tag/:path_id", { :controller => "tags", :action => "destroy" })

  #------------------------------

  # Routes for the Outfit item resource:

  # CREATE
  post("/insert_outfit_item", { :controller => "outfit_items", :action => "create" })
          
  # READ
  get("/outfit_items", { :controller => "outfit_items", :action => "index" })
  
  get("/outfit_items/:path_id", { :controller => "outfit_items", :action => "show" })
  
  # UPDATE
  
  post("/modify_outfit_item/:path_id", { :controller => "outfit_items", :action => "update" })
  
  # DELETE
  get("/delete_outfit_item/:path_id", { :controller => "outfit_items", :action => "destroy" })

  #------------------------------

  # Routes for the Outfit resource:

  # CREATE
  post("/insert_outfit", { :controller => "outfits", :action => "create" })
          
  # READ
  get("/outfits", { :controller => "outfits", :action => "index" })
  
  get("/outfits/:path_id", { :controller => "outfits", :action => "show" })
  
  # UPDATE
  
  post("/modify_outfit/:path_id", { :controller => "outfits", :action => "update" })
  
  # DELETE
  get("/delete_outfit/:path_id", { :controller => "outfits", :action => "destroy" })

  #------------------------------

  devise_for :users

  # Routes for the Clothing resource:

  # CREATE
  post("/insert_clothing", { :controller => "clothings", :action => "create" })
          
  # READ
  get("/clothings", { :controller => "clothings", :action => "index" })
  
  get("/clothings/:path_id", { :controller => "clothings", :action => "show" })
  
  # UPDATE
  
  post("/modify_clothing/:path_id", { :controller => "clothings", :action => "update" })
  
  # DELETE
  get("/delete_clothing/:path_id", { :controller => "clothings", :action => "destroy" })

  #------------------------------

get("/", { :controller => "pages", :action => "home" })
post("/waitlist", { :controller => "pages", :action => "waitlist" })
get("/signin", { :controller => "pages", :action => "signin" })

  authenticated :user do
    get("/users/home", { :controller => "users", :action => "home" })
    root({ :controller => "users", :action => "home" })
  end

  unauthenticated do
    root({ :controller => "pages", :action => "home" })
  end
  
end
