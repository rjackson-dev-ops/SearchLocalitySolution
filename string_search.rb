module StringSearch
  def find_matching_terms(first_term, second_term, number_words_between, match_string)
    words = match_string.split(/\W+/)

    match_list = []

    first_list = []
    second_list = []

    # save teh indices when we find that either term matches
    (0..words.size-1).each do |index|
      next_word = words[index]
      first_list.push(index) if first_term.eql? next_word
      second_list.push(index) if second_term.eql? next_word
    end

    # compare the lists to see if any words are within the search range
    (0..first_list.size-1).each do |first_list_index|
      (0..second_list.size-1).each do |second_list_index|

        first_term_index = first_list[first_list_index]
        second_term_index = second_list[second_list_index]
        current_range = (first_term_index - second_term_index).abs

        match_list.push([first_term_index, second_term_index]) if (current_range <= number_words_between)

      end
    end

    match_list
  end
end
