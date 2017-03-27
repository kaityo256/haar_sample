DAT=inv_transform.dat original.dat transform.dat
PNG=$(DAT:.dat=.png)

all:
	ruby haar.rb
	gnuplot plot.plt

clean:
	rm -f $(DAT) $(PNG)
