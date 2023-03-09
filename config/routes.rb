Rails.application.routes.draw do


  get("/users", { :controller => "users", :action => "index"})

  get("/users/:user_id", { :controller => "users", :action => "info"})
end
