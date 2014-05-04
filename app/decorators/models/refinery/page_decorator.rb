Refinery::Page.class_eval do
  class FriendlyIdOptions
    class << self
      def reserved_words_with_wymiframe
        reserved_words_without_wymiframe.push('wymiframe')
      end
      alias_method_chain :reserved_words, :wymiframe
    end
  end
end
