class SpheroController < ApplicationController
  # before_filter :render_blank
  def stop
    Spheroid.stop
  end

  def roll
    Spheroid.roll params[:speed].to_i, params[:dir].to_i
  end

  def taillight
    brightness = 255
    if params[:light] == 'off'
      brightness = 0
    end
    Spheroid.back_led_output = brightness
  end

  def color
    render text: (Spheroid.rgb params[:r].to_i, params[:g].to_i, params[:b].to_i)

    # head :no_content
  end

  private
  def render_blank
  end
end
