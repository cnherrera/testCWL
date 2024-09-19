cwlVersion: v1.2
class: CommandLineTool

baseCommand: python3
arguments: ["analysis_tool.py"]

inputs:
  vectors:
    type: File
    inputBinding:
      position: 1
  condition:
    type: string
    inputBinding:
      position: 2

outputs:
  attributes:
    type: File
    outputBinding:
      glob: "*.csv"
