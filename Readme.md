# Search Locality

Tool to search through text documents.

## Problem/Domain Analysis

See this document SearchLocalityDesign.docx

### Tools

* Ruby
* Rspec

```

### Running the application

PS C:\dev\Stelligent\workspaces\SearchLocalitySolution> ruby  search_script.rb developer operations 9 data/empty_directory
No Matches found
PS C:\dev\Stelligent\workspaces\SearchLocalitySolution> ruby  search_script.rb developer operations 9 data/directory_with_multple_text_files
Found the following matches
In file data/directory_with_multple_text_files/match_text1.txt-the first term was found at index 6 and the second term was found at index 4
In file data/directory_with_multple_text_files/match_text1.txt-the first term was found at index 21 and the second term was found at index 2
In file data/directory_with_multple_text_files/match_text1.txt-the first term was found at index 29 and the second term was found at index 2

```


```

### Testing the application

PS C:\dev\Stelligent\workspaces\SearchLocalitySolution> cd test
PS C:\dev\Stelligent\workspaces\SearchLocalitySolution\test> ls


 Directory: C:\dev\Stelligent\workspaces\SearchLocalitySolution\test


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        8/28/2017  10:45 AM           5012 search_locality_spec.rb


PS C:\dev\Stelligent\workspaces\SearchLocalitySolution\test> rspec .\search_locality_spec.rb
............

Finished in 0.021 seconds (files took 0.155 seconds to load)
12 examples, 0 failures

PS C:\dev\Stelligent\workspaces\SearchLocalitySolution\test>

```

## Authors

* *Robert Jackson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Jonny Sywulak - Mentor

