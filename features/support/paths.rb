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
<<<<<<< HEAD
<<<<<<< HEAD
      #then '/landing'
=======
      #landing_page
=======
      landing_page_path
>>>>>>> 609e311a9dd1e22ee573f246a090ccd447695835
    
    when /^the Recipe Recommender edit Profile Path for "([^"]*)"$/
      edit_user_profile_path(1, 2)

    when /^the Home Page$/
<<<<<<< HEAD
      movies_path
>>>>>>> 39a664461062c14cb876250d3be31f840b2b36a6
=======
      recipes_path
>>>>>>> 609e311a9dd1e22ee573f246a090ccd447695835

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
