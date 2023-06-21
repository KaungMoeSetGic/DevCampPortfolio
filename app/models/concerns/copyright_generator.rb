module CopyrightGenerator
    extend ActiveSupport::Concern

    included do
        before_action :set_copyright
    end

    def set_copyright
        @copyright = DevcampViewTool::Renderer.copyright 'Kaung Moe Set', 'All rights reserved'
    end
end 

module DevcampViewTool
    class Renderer
        def self.copyright name, msg
            "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
        end
    end
end