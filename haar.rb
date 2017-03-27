M = 8
N = 2 ** M

def transform(data,m)
  m.times do |l|
    (2**(m-l-1)).times do |i|
      i1 = i*(2**(l+1))
      i2 = i1 + 2**l
      s = (data[i1] + data[i2])*(2**-0.5)
      d = (data[i1] - data[i2])*(2**-0.5)
      data[i1] = s
      data[i2] = d
    end
  end
end

def inv_transform(data,m)
  m.times do |l2|
    l = m - l2 -1
    (2**(m-l-1)).times do |i|
      i1 = i*(2**(l+1))
      i2 = i1 + 2**l
      s = (data[i1] + data[i2])*(2**-0.5)
      d = (data[i1] - data[i2])*(2**-0.5)
      data[i1] = s
      data[i2] = d
    end
  end
end

def savefile(filename,data)
  open(filename,"w") do |f|
    data.each do |v|
      f.puts v
    end
  end
	puts "Saved #{filename}"
end

data = Array.new(N) do |i|
  Math::tanh((i.to_f-N.to_f/2.0)/(N.to_f*0.1))
end

savefile("original.dat",data)

transform(data,M)

savefile("transform.dat",data)

data2 = data.map{|x| x**2}.sort.reverse
th = data2[N*0.1]

data.map! do 
	|x| x**2 < th ? 0 : x
end

#N.times do |i|
#  data[i] = 0 if data[i]**2 < th
#end

inv_transform(data,M)

savefile("inv_transform.dat",data)
