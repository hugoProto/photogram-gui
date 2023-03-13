Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "info" })

  get("/insert_user", { :controller => "users", :action => "add_user" })

  get("/update_user/:u_id", { :controller => "users", :action => "update_u"})

  # root to: "users#index"
  get("/", { :controller => "users", :action => "index" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:toast_id", { :controller => "photos", :action => "goodbye" })

  get("/insert_photo", { :controller => "photos", :action => "create" })

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update" })

  get("/insert_comment_record", { :controller => "photos", :action => "comment_photo"})
end
