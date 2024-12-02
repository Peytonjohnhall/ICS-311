# Author: Peyton J. Hall
"""
A Python Program that generates reports of the queried data in the terminal.
"""


import pandas as pd
from datetime import date

def wait_for_enter(prompt):
    """
    Waits for the user to press only Enter.
    Raises an exception if the user types anything else.
    """
    user_input = input(prompt)
    if user_input.strip():  # If there's anything besides just pressing Enter
        raise ValueError("Invalid input. Please press only 'Enter' to proceed.")

def generate_report_1(csv_file, student_name, report_title):
    """
    Generates Report 1 from a given CSV file.
    """
    try:
        # Load the CSV file
        data = pd.read_csv(csv_file)
        
        # Display the report header
        print(f"Student Name: {student_name}")
        print(f"{report_title}")
        print(f"Today's date is {date.today()}")
        print("\n")
        
        # Print column headers
        print(f"{'Country of Origin':<20} {'Total Wins':<10}")
        print("-" * 30)
        
        # Iterate through rows and print each row
        for index, row in data.iterrows():
            print(f"{row['countryoforigin']:<20} {row['totalwins']:<10}")
    
    except FileNotFoundError:
        print(f"Error: The file '{csv_file}' was not found.")
    except KeyError:
        print("Error: One or more specified columns do not exist in the CSV file.")

def generate_report_2(csv_file, student_name, report_title):
    """
    Generates Report 2 from a given CSV file.
    """
    try:
        # Load the CSV file
        data = pd.read_csv(csv_file)
        
        # Display the report header
        print(f"Student Name: {student_name}")
        print(f"{report_title}")
        print(f"Today's date is {date.today()}")
        print("\n")
        
        # Print column headers
        print(f"{'Fighter Name':<20} {'Coach Name':<20} {'Gym Name':<20} {'Sponsor Name':<20}")
        print("-" * 80)
        
        # Iterate through rows and print each row
        for index, row in data.iterrows():
            print(f"{row['fightername']:<20} {row['coachname']:<20} {row['gymname']:<20} {row['sponsorname']:<20}")
    
    except FileNotFoundError:
        print(f"Error: The file '{csv_file}' was not found.")
    except KeyError:
        print("Error: One or more specified columns do not exist in the CSV file.")

def generate_report_3():
    """
    Prompts the user to choose a CSV file for Report 3 and displays its content.
    """
    csv_files = [
        "CoachesSpecialties.csv",
        "ContractsExpiringSoon.csv",
        "ContractsHighestToLowest.csv",
        "CreateAView.csv",
        "GymsOfFighters.csv",
        "NoInjuries.csv",
        "PaymentsPerWeightClass.csv",
        "Records155to200.csv",
        "SponsoredFighters.csv",
    ]
    print("\nAvailable CSV files for Report 3:")
    for i, file in enumerate(csv_files, start=1):
        print(f"{i}. {file}")
    
    try:
        choice = int(input("\nEnter the number corresponding to your chosen file: ")) - 1
        if choice < 0 or choice >= len(csv_files):
            raise ValueError("Invalid choice. Please select a valid number.")
        
        csv_file = csv_files[choice]
        # Load the chosen CSV file
        data = pd.read_csv(csv_file)
        
        # Display the report header
        print(f"\nStudent Name: Peyton Hall")
        print("Report 3")
        print(f"Today's date is {date.today()}")
        print("\n")
        
        # Print column headers
        print(" | ".join(data.columns))
        print("-" * 50)
        
        # Iterate through rows and print each row
        for index, row in data.iterrows():
            print(" | ".join(str(value) for value in row))
    
    except FileNotFoundError:
        print(f"Error: The file '{csv_file}' was not found.")
    except ValueError as e:
        print(f"Error: {e}")

# Main execution
if __name__ == "__main__":
    try:
        # Report 1 Configuration
        report_1_config = {
            "csv_file": "TotalWinsByCountry.csv", # File name for Report 1
            "student_name": "Peyton Hall", # Name for Report 1
            "report_title": "Report 1", # Title for Report 1
        }
        
        # Report 2 Configuration
        report_2_config = {
            "csv_file": "FightersCoachesGymsandSponsors.csv", # File name for Report 2
            "student_name": "Peyton Hall", # Name for Report 2
            "report_title": "Report 2", # Title for Report 2
        }
        
        wait_for_enter("Press Enter to see the first report: ")
        print("\n=== Generating Report 1 ===")
        generate_report_1(
            csv_file = report_1_config["csv_file"],
            student_name = report_1_config["student_name"],
            report_title = report_1_config["report_title"],
        )
        
        wait_for_enter("\nPress Enter to see the second report: ")
        print("\n=== Generating Report 2 ===")
        generate_report_2(
            csv_file = report_2_config["csv_file"],
            student_name = report_2_config["student_name"],
            report_title = report_2_config["report_title"],
        )
        
        wait_for_enter("\nPress Enter to see the third report: ")
        print("\n=== Generating Report 3 ===")
        generate_report_3()
    
    except ValueError as e:
        print(f"\nError: {e}")
