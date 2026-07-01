# frozen_string_literal: true

name 'deb_pkg_unautostart'

run_list 'test::default'

cookbook 'deb_pkg_unautostart', path: '.'
cookbook 'test', path: './test/cookbooks/test'

Dir.children('./test/cookbooks/test/recipes').grep(/\.rb\z/).sort.each do |recipe|
  recipe_name = File.basename(recipe, '.rb')

  named_run_list recipe_name.to_sym, 'recipe[test::' + recipe_name + ']'
end
