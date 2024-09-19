cwlVersion: v1.2
class: CommandLineTool

baseCommand: python3
arguments: ["create_template.py"]

inputs:
  attributes:
    type: File
    inputBinding:
      position: 1

outputs:
  template_file:
    type: File
    outputBinding:
      glob: "*.txt"
