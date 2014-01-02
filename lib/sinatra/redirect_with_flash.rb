require 'sinatra/base'

module Sinatra
  module RedirectWithFlash
    COMMON_FLASH_NAMES = [:notice, :alert, :warning, :error, :info, :success]

    def redirect(uri, *args)
      flash_opts = args.last

      if flash_opts && flash_opts.is_a?(Hash)
        COMMON_FLASH_NAMES.each do |name|
          if val = flash_opts.delete(name)
            flash[name] = val
          end
        end

        if other_flashes = flash_opts.delete(:flash)
          other_flashes.each {|k, v| flash[k] = v}
        end
      end

      super(uri, *args)
    end

  end

  helpers RedirectWithFlash
end
