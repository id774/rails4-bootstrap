module ActionView
  module Helpers
    module FormTagHelper
      alias_method :original_submit_tag, :submit_tag
      def submit_tag(value=nil, options={})
        original_submit_tag(value, :data => { disable_with: 'Sending...' })
      end
    end
  end
end
