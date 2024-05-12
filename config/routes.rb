Rails.application.routes.draw do
  get("/", { :controller => "user", :action => "index" })

  get("/users", { :controller => "user", :action => "index" })
  get("/users/:path_id", {:controller => "user", :action => "show"})
  post("/insert_user", {:controller => "user", :action => "create"})
  post("/update_user/:path_id", {:controller => "user", :action => "update"})

  get("/photos", {:controller => "photo", :action => "index"})
  get("/photos/:path_id", {:controller => "photo", :action => "show"})
  get("/delete_photo/:path_id", { :controller => "photo", :action => "destroy" })
  post("/insert_photo", {:controller => "photo", :action => "create"})
  post("/update_photo/:path_id", {:controller => "photo", :action => "update"})

  post("/add_comment", {:controller => "photo", :action => "comment"})

end
