# Copyright (c) 2007 CSIRO
# Australia Telescope National Facility (ATNF)
# Commonwealth Scientific and Industrial Research Organisation (CSIRO)
# PO Box 76, Epping NSW 1710, Australia
#
# This file is part of the ASKAP software distribution.
#
# The ASKAP software distribution is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
#
# This program was modified so as to use it in the contest.
# The last modification was on January 12, 2015.

#
#
CXX=icpc 
CFLAGS= -O3 -mkl -openmp

EXENAME = tConvolve
OBJS = tConvolveMPI.o Stopwatch.o Benchmark.o

all:		$(EXENAME)

%.o:		%.cc %.h
		$(CXX) $(CFLAGS) -c $<

$(EXENAME):	$(OBJS)
		$(CXX) $(CFLAGS) -o $(EXENAME) $(OBJS)

clean:
		rm -f $(EXENAME) *.o
run:	$(EXENAME)
	./$(EXENAME)
verify:	grid.dat
	./verify
a:
	make run
	make verify
