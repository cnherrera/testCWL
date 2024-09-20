cwlVersion: v1.2
class: CommandLineTool


label: "Access Database Tool"
doc: >
  This process accesses a database using the rover_diamond libraries. It was thought to access
  a numerical simulation database, which name is given as input. Needs to have access without 
  authentication (r.g. token).   
  containing vectors and properties
  and outputs the results as a CSV file. The database contains simulation data
  that will be used in later steps for analysis and processing.


baseCommand: python3
arguments: ["access_database.py"]

inputs:
  database_input:
    type: File
    inputBinding:
      position: 1

outputs:
  database_vectors:
    type: File
    outputBinding:
      glob: "*.csv"
