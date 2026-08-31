class PhraseInfo
  attr_accessor :current_index, :count
  def initialize()
    @current_index = 0
    @count = 0
  end
end

def substrings(string, phrases)
  phrases_info = Hash.new{|hash, key| hash[key] = PhraseInfo.new}
  string.each_char() do |current_char|
    for phrase in phrases
      info = phrases_info[phrase]
      if(info.current_index == phrase.length - 1)
        info.count += 1
        info.current_index = 0
      elsif (phrase[info.current_index] == current_char)
        info.current_index += 1
      else
        info.current_index = 0
      end
      phrases_info[phrase] = info
    end
  end
  phrases_info.to_h{|key, value| [key, value.count]}
end

puts substrings("ello ello ello hi", ["e", "l", "ello", "elo", "ello hi"])
