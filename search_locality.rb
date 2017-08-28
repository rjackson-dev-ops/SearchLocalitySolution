require_relative 'string_search.rb'

class MatchClass

  attr_reader :first_term_index, :second_term_index, :file_name

  def initialize(file_name, first_term_index, second_term_index)
    @file_name = file_name
    @first_term_index = first_term_index
    @second_term_index = second_term_index
  end

end
class LocalitySearch

  include StringSearch

  def initialize(first_term, second_term, number_words_between, search_directory)
    @first_term = first_term
    @second_term = second_term
    @number_words_between = number_words_between
    @search_directory = search_directory
  end

  def find_matching_strings(match_string)
    find_matching_terms(@first_term, @second_term, @number_words_between, match_string)
  end

  def get_files()
    raise('Directory invalid') unless (directory_exists?(@search_directory ))

    path = @search_directory + '/*.txt'

    file_list = Dir[path]
  end

  def directory_exists?(directory)
    File.directory?(directory)
  end

  def search_files
    @match_list = []
    file_list = get_files()

    file_list.each do |file|
      file_contents = File.open(file, 'rb') { |f| f.read }
      match_string = file_contents
      matching_strings =  find_matching_strings(match_string)

      matching_strings.each do |next_match_terms|
        next_match = MatchClass.new(file, next_match_terms[0], next_match_terms[1])
        @match_list.push(next_match)
      end
    end
    @match_list
  end

  def print_output

    if((@match_list == nil || @match_list.empty?))
      output_string =  "No Matches found\n"
    else
      output_string =  "Found the following matches\n"
      @match_list.each do |next_match|
        output_string.concat "In file " + next_match.file_name +
                                 "-the first term was found at index " + next_match.first_term_index.to_s +
                                 " and the second term was found at index " + next_match.second_term_index.to_s + "\n"
      end
    end

    output_string
  end
end

