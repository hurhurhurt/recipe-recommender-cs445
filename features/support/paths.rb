# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /^the landing\s?page$/
      landing_page_path
    
    when /^the Recipe Recommender edit Profile Path for "([^"]*)"$/
      edit_user_profile_path(1, 2)
      
    when /^the edit recipe page for "([^"]*)"$/
      edit_recipe_path(1, 2)
     
    when /^the show recipe page for "([^"]*)"$/
      recipe_path(Recipe.find_by_recipe_name($1))
      
    when /^the New Recipe Page$/
      new_recipe_path

    when /^the Home Page$/
      recipes_path
      

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end
World(NavigationHelpers)
