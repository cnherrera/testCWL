cwlVersion: v1.2
class: CommandLineTool

baseCommand: python3
arguments: ["run_simulation.py"]

inputs:
  template:
    type: File
    inputBinding:
      position: 1
  hpc_center:
    type: string
    inputBinding:
      position: 2

outputs:
  simulation_data:
    type: File
    outputBinding:
      glob: "*.yaml"
