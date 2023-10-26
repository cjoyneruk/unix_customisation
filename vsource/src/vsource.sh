#!/bin/bash

# Shell script for listing and activating python virtual environments

function vsource() {
	
	case $1 in 

		# Create new virtual environment
		create)
			
			# Check if venv already exists
			venv_path=~/.virtualenvs/$2
			
			if [[ -d $venv_path ]] ; then
				echo "The virtual environment '$2' already exists"
			else
				python3 -m venv $venv_path
				vsource activate $2
			fi
			;;

		# Remove existing virtual environment
		remove)
						
			venv_path=~/.virtualenvs/$2
			
			# Check if venv already exists
			if [[ -d $venv_path ]] ; then
				echo "Are you sure you want to remove '$2' (Y/N)?"

				read response
				if [[ "$response" = "Y" ]] || [[ "$response" = "y" ]] ; then
					rm -r $venv_path
					echo "'$2' successfully removed"
				else
					echo "Removal cancelled"
				fi
			else
				echo "The virtual environment '$2' doesn't exist"
			fi
			;;

		# Run virtual environment
		activate) 
						
			if [[ "$2" = "" ]] ; then
				echo "Please provide a virtualenv name"				
			else
				venv_path=~/.virtualenvs/$2/bin/activate

				# Check if venv exists
				if [[ -f $venv_path ]] ; then
					source $venv_path
				else
					echo "The virtual environment '$2' does not exist, use 'vsource list' to view all environments"
				fi
			fi
			;;
		
		# List all virtual environments
		list) 
			ls ~/.virtualenvs
			;;
		*) 
			echo "Please use either"
			echo "1. 'vsource create <venv>' to create a new virtual environment"
			echo "2. 'vsource activate <venv>' to activate a virtual environment"
			echo "3. 'vsource list' to view all environments"
			;;
	esac

}
