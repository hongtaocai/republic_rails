module PublicationsHelper
  def shorterabstract(abstract_string)
    whitespace_place = 300
    while( whitespace_place < abstract_string.length and abstract_string[whitespace_place]!=' ' )
      whitespace_place = whitespace_place + 1
    end
    if whitespace_place >= abstract_string.length
      abstract_string
    else
      abstract_string[0...whitespace_place] + '...'
    end
  end

end
