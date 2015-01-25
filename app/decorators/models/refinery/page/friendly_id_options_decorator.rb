Refinery::Page::FriendlyIdOptions.class_eval do
  class << self
    def reserved_words_with_wymiframe
      reserved_words.push('wymiframe')
    end
  end
end
