DynamicSitemaps::Sitemap.draw do
  
  # default per_page is 50.000 which is the specified maximum.
  per_page 10

  url root_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  
  new_page!
  
  autogenerate  :forums, :topics, :posts,
                :last_mod => :updated_at,
                :change_freq => 'monthly',
                 :priority => 0.8
                
  new_page!
  
  url about_url, :last_mod => DateTime.now, :change_freq => 'monthly', :priority => 2
  
end