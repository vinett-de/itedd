class BaseReader

  include ExtractDate


  def build_event(event_text, user_group, optional_link=nil)
    raise ArgumentError.new("No user_group given") unless user_group.present?

    if is_valid_text?(event_text)
      Event.new( {
        text: event_text,
        happens_at: extract_date(event_text),
        link: optional_link || extract_link(event_text),
        user_group: user_group })
    end
  end

  protected

  def is_valid_text?(event_text)
    event_text =~ /(^|\s)#event([\s:\.\(\[\{!]|$)/i
  end

  # TODO Finale Implementierung, wenn wir RSS parsen
  #   def extract_link(string)
  #       raise NotImplementedError
  #         end
  #         end
end
