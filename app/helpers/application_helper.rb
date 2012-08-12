module ApplicationHelper
      def swatch(r, g, b)
      s = <<-EOS
      <a href='/sphero/color?r=#{r}&g=#{g}&b=#{b}' class='swatch' style='background-color: rgb(#{r}, #{g}, #{b})' target='sphero_frame'>&nbsp;</a>
      EOS

      s.html_safe
    end
end
