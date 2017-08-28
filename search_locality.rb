require_relative 'string_search.rb'
class LocalitySearch

  include StringSearch

  def initialize(first_term, second_term, number_words_between, match_string)

    @first_term = first_term
    @second_term = second_term
    @number_words_between = number_words_between
    @match_string = match_string
  end

  def get_files(directory)
    raise('Directory invalid') unless (directory_exists?(directory))

    path = directory + '/*.txt'

    file_list = Dir[path]
  end

  def directory_exists?(directory)
    File.directory?(directory)
  end
end