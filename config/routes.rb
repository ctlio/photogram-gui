Rails.application.routes.draw do

get("/", {:controller => "users", :action => "index"})
get("/users/:username", {:controller =>"users" :action =>""})

end
