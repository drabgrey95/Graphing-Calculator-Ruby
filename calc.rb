#switch menu
require "highline/import"
require "rubygems"

 
#basic 
def is_number? expr
  return false if expr.nil?
  expr = "#{expr}"              # we need this condition in case the expr is a number
  expr.match /^(\d+|\d+\.\d+)$/ # since match() is defined only for strings
end 

def calc(expr)  
  return expr.to_f if is_number? expr

  arr = expr.split /\+/
  return arr.inject(0){|x,y| calc(x) + calc(y) } if arr.size > 1
  arr = expr.split /\-/  
  return arr.inject(0){|x,y| calc(x) - calc(y) } if arr.size > 1
  arr = expr.split /\*/
  return arr.inject(1){|x,y| calc(x) * calc(y) } if arr.size > 1
  arr = expr.split /\//
  return arr.inject   {|x,y| calc(x) / calc(y) } if arr.size > 1
end


#trig
def trig (expr)
  return expr.to_f if is_number? expr

  arr = expr.split /sin/
  return arr.inject(0){|x|  Math.sin(calc(x)) } if arr.size > 1
  arr = expr.split /cos/  
  return arr.inject(0){|x,y| calc(x) - calc(y) } if arr.size > 1
  arr = expr.split /tan/
  return arr.inject(1){|x,y| calc(x) * calc(y) } if arr.size > 1

end

#trig

#exponents
def exponents(base,num)
  return base**num
end
#roots
#fuunction
#graph

def menu
    loop do
      puts "1. Basic math", "2. Trig", "3. Exponents", "4. Nevermind"

        input = gets.strip

        case input
        when "1"
             puts("enter equation")
             math=gets 
             puts calc(math).round(2)
        when "2"
          puts("enter sin-cos-tan")
          math=gets
          puts trig(math)
        when "3"
          puts("enter base")
          base=gets.chomp.to_f
          puts("enters num")
          num=gets.chomp.to_f
          puts exponents(base,num)
        when "4"
            puts "Bye!"
            return
        else
            puts "Invalid option: #{input}"
        end
    end
end

menu
