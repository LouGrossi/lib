#!/bin/bash

# Function to initialize Terraform project
tf-init() {
  echo "Initializing Terraform project..."
  
  # Define directories and files
  directories=("terraform/main" "terraform/modules/network" "terraform/modules/compute" "terraform/variables" "terraform/outputs")
  files=("main.tf" "variables.tf" "outputs.tf")

  # Create directories
  for dir in "${directories[@]}" ; do
    mkdir -p "$dir"
  done

  # Create files
  for dir in "${directories[@]}" ; do
    for file in "${files[@]}" ; do
      touch "$dir/$file"
    done
  done

  # Prompt user for confirmation
  read -p "Do you want to proceed with the changes? (y/n): " user_choice
  case "$user_choice" in
    y | Y) ;;
    n | N) echo "Aborted." ; exit ;;
    *) echo "Invalid choice. Aborted." ; exit ;;
  esac

  # Execute changes
  echo "Proceeding with the changes..."
  # Add your Terraform initialization commands here
  # For example: terraform init

  echo "Terraform project initialized successfully."
}