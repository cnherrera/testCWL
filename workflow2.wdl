version 1.0
task untar {
    input {
        File tarfile
        String extractfile
    }
    command {
        mkdir -p extracted_files &&
        tar -xf ${tarfile} -C extracted_files ${extractfile}
    }
    output { Array[File] extracted_files = glob("extracted_files/*") }
}

task compile {
    input { Array[File] src }
    command { javac ${sep=' ' src}}
    output { Array[File] classfile = glob("*/*.class") }
}

workflow main {
    input {
        File tarball
        String name_of_file_to_extract
    }
  
    call untar {
        input:
            tarfile = tarball,
            extractfile = name_of_file_to_extract
    }
  
    call compile {
        input:
            src = untar.extracted_files
    }
    output { Array[File] compiled_class = compile.classfile }
}
