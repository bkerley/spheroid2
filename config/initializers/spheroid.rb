class Spheroid
  def self.start
    @sphero_ttys = Dir.glob('/dev/tty.Sphero*')
    @spheros = @sphero_ttys.map do |s|
      Sphero.new s rescue nil
    end.compact
  end

  def self.method_missing(name, *args)
    @spheros.each{|s| s.send name, *args}
  end

  def self.balls
    @sphero_ttys
  end
end

Spheroid.start
