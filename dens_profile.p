#Gnuplot script to plot SDGI density profiles

set terminal epslatex standalone

set output 'dens_prof.tex'

mpl_top    = 0.25 #inch  outer top margin, title goes here
mpl_bot    = 0.2 #inch  outer bottom margin, x label goes here
mpl_left   = 1.0 #inch  outer left margin, y label goes here
mpl_right  = 1.5 #inch  outer right margin, y2 label goes here
mpl_height = 2.0 #inch  height of individual plots
mpl_width  = 4.0 #inch  width of individual plots
mpl_dx     = 0.2 #inch  inter-plot horizontal spacing
mpl_dy     = 0.8 #inch  inter-plot vertical spacing   
mpl_ny     = 1   #number of rows
mpl_nx     = 2   #number of columns

# calculate full dimensions
xsize = mpl_left+mpl_right+(mpl_width*mpl_nx)+(mpl_nx-1)*mpl_dx
ysize = mpl_top+mpl_bot+(mpl_ny*mpl_height)+(mpl_ny-1)*mpl_dy

# placement functions
#   rows are numbered from bottom to top
bot(n) = (mpl_bot+(n-1)*mpl_height+(n-1)*mpl_dy)/ysize
top(n)  = 1-((mpl_top+(mpl_ny-n)*(mpl_height+mpl_dy))/ysize)
#   columns are numbered from left to right
left(n) = (mpl_left+(n-1)*mpl_width+(n-1)*mpl_dx)/xsize
right(n)  = 1-((mpl_right+(mpl_nx-n)*(mpl_width+mpl_dx))/xsize)

set tics scale 1.5

set offsets
set autoscale fix
#set size 1,1
set nokey

# define x-axis settings for all subplots

# start plotting
set multiplot

#-----------------------------------------------
# subplot  1-1
#  set horizontal margins for first column
set lmargin at screen left(1)
set rmargin at screen right(1)
#  set horizontal margins for third row (top)
set tmargin at screen top(1)
set bmargin at screen bot(1)

#Set axes labels
set xlabel '$\rho$'
set ylabel 'z'

#Set axes range   
set xrange [0:2.5]
set yrange [-5:5]

#Draw axes
unset border
set arrow from 0, -5 to 2.5, -5 lc 0 lw 4
set arrow from 0, -5 to 0, 5    lc 0 lw 4

#Set axes tics
unset xtics
set ytics (0) nomirror

#Set title
set title '$t = 0$'

#Set panel label
set label 'a)' at -0.5, 5.8
      
#Plot bulk density profile
set arrow from 2, -5 to 2, 0 nohead lc 0 lw 4
set arrow from 2, 0  to 1, 0 nohead lc 0 lw 4
set arrow from 1, 0  to 1, 5 nohead lc 0 lw 4

#Plot fluid density profile
set arrow from 1.99, -5     to 1.99, -0.05 nohead dt 2 lc 6 lw 4
#The next line, and the identical ones below, are needed because of strange
#colour effects   
set arrow from 10, 10       to 11, 11                  lc 0   
set arrow from 1.99, -0.05  to 0.75, -0.05 nohead dt 2 lc 6 lw 4
set arrow from 10, 10       to 11, 11                  lc 0   
set arrow from 0.75, -0.05  to 0.75, 5     nohead dt 2 lc 6 lw 4

#Plot particle density particle
set arrow from 0.01, -5 to 0.01, 0 nohead dt 3 lc 7 lw 4
set arrow from 10, 10   to 11, 11              lc 0   
set arrow from 0.01, 0  to 0.25, 0 nohead dt 3 lc 7 lw 4   
set arrow from 10, 10   to 11, 11              lc 0   
set arrow from 0.25, 0  to 0.25, 5 nohead dt 3 lc 7 lw 4   

plot 10

unset arrow
unset label   
#-----------------------------------------------
# subplot  2-1
#  set horizontal margins for first column
set lmargin at screen left(2)
set rmargin at screen right(2)
#  set horizontal margins for third row (top)
set tmargin at screen top(1)
set bmargin at screen bot(1)

#Set axes labels
unset ylabel
   
#Draw axes
set arrow from 0, -5 to 2.5, -5 lc 0 lw 4
set arrow from 0, -5 to 0, 5    lc 0 lw 4

#Set axes tics
set ytics ('$-V_{\text{s}} t$' -1)
   
#Set title
set title '$t = t$'

#Set panel label
set label 'b)' at -0.5, 5.8
      
#Plot bulk density profile
set arrow from 2, -5    to 2, -1    nohead lc 0 lw 4
set arrow from 2, -1    to 2.25, -1 nohead lc 0 lw 4   
set arrow from 2.25, -1 to 2.25, 0  nohead lc 0 lw 4   
set arrow from 2.25, 0  to 1, 0     nohead lc 0 lw 4
set arrow from 1, 0     to 1, 5     nohead lc 0 lw 4

#Plot fluid density profile
set arrow from 1.99, -5     to 1.99, -0.05 nohead dt 2 lc 6 lw 4
#The next line, and the identical ones below, are needed because of strange
#colour effects   
set arrow from 10, 10       to 11, 11                  lc 0   
set arrow from 1.99, -0.05  to 0.75, -0.05 nohead dt 2 lc 6 lw 4
set arrow from 10, 10       to 11, 11                  lc 0   
set arrow from 0.75, -0.05  to 0.75, 5     nohead dt 2 lc 6 lw 4

#Plot particle density particle
set arrow from 0.01, -5 to 0.01, -1 nohead dt 3 lc 7 lw 4
set arrow from 10, 10   to 11, 11               lc 0   
set arrow from 0.01, -1 to 0.25, -1 nohead dt 3 lc 7 lw 4   
set arrow from 10, 10   to 11, 11               lc 0   
set arrow from 0.25, -1 to 0.25, 5  nohead dt 3 lc 7 lw 4   

#Create legend
set arrow from 1.2, 4   to 1.7, 4   nohead dt 1 lc 0 lw 4
set arrow from 1.2, 3.5 to 1.7, 3.5 nohead dt 2 lc 6 lw 4
set arrow from 1.2, 3   to 1.7, 3   nohead dt 3 lc 7 lw 4

set label '$\rho$'            at 1.8, 4.1
set label '$\rho_{0} (1 + \alpha s) (1 - \phi)$' at 1.8, 3.6
set label '$\rho_{\text{p}} \phi$' at 1.8, 3.1
   
plot 10
   
#-----------------------------------------------

unset multiplot
