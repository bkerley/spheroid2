class SpheroController < ApplicationController
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
    render text: (Spheroid.back_led_output = brightness)
  end

  def color
    render text: (Spheroid.rgb params[:r].to_i, params[:g].to_i, params[:b].to_i)
  end

  def spin
    render text: (Spheroid.heading = params[:rate].to_i)
  end

  def power
    render text: CGI.escapeHTML(Spheroid.power_state.inspect + Spheroid.bluetooth_info.inspect)
  end
end
