setup_fhirapp = function(path=tempdir()) {
 od = getwd()
 setwd(path)
 on.exit(setwd(od))
 if (!file.exists("cmg_fhir.zip")) {
  message("copying zip...")
  AnVIL::gsutil_cp("gs://bioc-anvildays-2021/cmg_fhir.zip", ".")
  message("done.")
  }
 message("unzipping...")
 try(unzip("cmg_fhir.zip")) # produces tmp/ holding folders with json in each
}
 
