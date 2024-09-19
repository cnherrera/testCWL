cwlVersion: v1.2
class: CommandLineTool

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
