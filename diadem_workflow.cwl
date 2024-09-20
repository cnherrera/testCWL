cwlVersion: v1.2
class: Workflow

inputs:
  database_name: File
  analysis_condition: string
  hpc_center: string

outputs:
  simulation_output:
    type: File
    outputSource: run_simulation/simulation_data

steps:
  # Step 1: Access the Database
  access_database:
    run: access_database.cwl
    in:
      database_input: database_name
    out: [database_vectors]

  # Step 2: Analysis Tool
  analysis_tool:
    run: analysis_tool.cwl
    in:
      vectors: access_database/database_vectors
      condition: analysis_condition
    out: [attributes]

  # Step 3: Create BigDFT Simulation Template
  create_template:
    run: create_template.cwl
    in:
      attributes: analysis_tool/attributes
    out: [template_file]

  # Step 4: Job Submission to HPC Center
  run_simulation:
    run: run_simulation.cwl
    in:
      template: create_template/template_file
      hpc_center: hpc_center
    out: [simulation_data]

