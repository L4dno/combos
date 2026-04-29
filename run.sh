#!/bin/bash

# 300,000 hosts, 2 days

	#line="<simulation_time>48<\/simulation_time>\t\t\t <!-- Simulation time in hours -->"
	#sed -i "s/<simulation_time>.*/${line}/" parameters.xml
	#line="<n_clients>30<\/n_clients>\t\t\t <!-- Number of clients of the cluster -->"
	#sed -i "s/<n_clients>.*/${line}/" parameters.xml
	set -e
	mkdir -p exp volume/exp
	test -f volume/parameters.xml
	cp volume/parameters.xml ./parameters.xml
	./generator
	./execute > volume/exp/general 2> volume/exp/errors.log
	cp -r exp/. volume/exp/
