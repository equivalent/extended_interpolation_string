require 'delegate'
require "extended_interpolation_string/version"

module ExtendedInterpolationString
  def extended
    LambdaInterpolationString.new(self)
  end

  class LambdaInterpolationString < DelegateClass(String)
    INTP_PATERN = /%\s*{\s*(\w*)\s*}\.*/
    NoInterpolatorObjectGiven = Class.new(StandardError)

    attr_accessor :interpolator

    def %(options)
      if options.is_a? Hash
        __getobj__.scan(INTP_PATERN).flatten.each do |requested_key|

          begin
            value = options.fetch(requested_key.to_sym)
            options[requested_key.to_sym] = value
              .call(interpolator || raise(NoInterpolatorObjectGiven)) if value.respond_to?(:call)
          rescue KeyError
          end
        end
      end
      __getobj__ % options
    end
  end
end

String.send :include, ExtendedInterpolationString
