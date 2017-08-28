require_relative 'search_locality'

first_term = ARGV[0]
second_term = ARGV[1]
number_words_between = ARGV[2].to_i
directory_to_search = ARGV[3]


locality_search = LocalitySearch.new(first_term, second_term, number_words_between, directory_to_search)
locality_search.search_files()
match_output = locality_search.print_output

print match_output