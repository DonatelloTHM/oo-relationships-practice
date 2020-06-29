require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

u1=User.new("Barb")
u2=User.new("Donzi")
u3=User.new("Karen")
u4=User.new("Ethan")
u5=User.new("Portoricana")
u6=User.new("Flamboyant")

p1=Project.new("BigMoney",u2,1300)
p2=Project.new("JackintheBOX",u2,500000)
p3=Project.new("BigD",u6,10000000)
p4=Project.new("LilB",u6,1_000_000_000_000_000)
p5=Project.new("Slushie",u2,13324)
p6=Project.new("SlayDay",u2,1002322)


pl1=p1.new_pledge(u3,100)
pl2=p1.new_pledge(u3,100)
pl3=p4.new_pledge(u5,3000)
pl4=p1.new_pledge(u4,1000)
pl5=p2.new_pledge(u4,49999)

binding.pry
0