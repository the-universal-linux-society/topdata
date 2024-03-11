#! /bin/bash 
echo "
░▀█▀░█▀█░█▀█░█▀▄░█▀█░▀█▀░█▀█
░░█░░█░█░█▀▀░█░█░█▀█░░█░░█▀█
░░▀░░▀▀▀░▀░░░▀▀░░▀░▀░░▀░░▀░▀"
check_cpu(){
	echo "-----------------------------" 
	echo "      >>> CPU INFO <<<"
	echo "-----------------------------" 

# CPU usage using vmstat #
		cpu_usage=$(vmstat 1 2 | tail -1 | awk '{print 100 - $15"%"}')
		echo "CPU USAGE : $cpu_usage"
		echo "CPU CORES : $(grep -c "processor" /proc/cpuinfo)"
		echo
	}

	check_memory(){
		echo "-----------------------------" 
		echo "    >>> MEMORY INFO <<<"
		echo "-----------------------------"

		echo "Total Memory : $(free -m | grep Mem | awk '{print $2 " MB"}')"
		echo "Used Memory : $(free -m | grep Mem | awk '{print $3 " MB"}')"
		echo "Free Memory : $(free -m | grep Mem | awk '{print $4 " MB"}')"
		echo 
	}

	check_storage(){
		echo "-----------------------------"
		echo "    >>> STORAGE DATA <<<"
		echo "-----------------------------"
		df -h
		echo "-----------------------------"
		echo "     >>> END OF DATA <<<"
		echo "-----------------------------"
		echo
	}


	# main function below#

	main(){
		check_cpu
		check_memory
		check_storage
	}

	# call the function #

	main

