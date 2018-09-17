module ApplicationHelper
  def url_for(options={})
    case options
    when String
      if @hash_of_additional_params.present? && options != "#"
        uri = Addressable::URI.new
        uri.query_values = @hash_of_additional_params

        options = options + (options.index('?').nil? ? '?' : '&') + uri.query
        options
      end
    when Hash
      if @hash_of_additional_params.present?
        options.reverse_merge(@hash_of_additional_params)
        options
      end
    else
      options
    end

    super
  end

  def format_date(date, default_format = "%B %d, %Y")
    return date.present? ? date.strftime(default_format) : nil
  end
end
