Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  post("/insert_user", { :controller => "users", :action => "create" })
  post("/modify_user/:path_id", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })
  post("/insert_photo", { :controller => "photos", :action => "create" })
end
