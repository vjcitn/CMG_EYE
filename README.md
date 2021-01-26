# CMG_EYE
CMG_EYE repo for AnVIL days demonstrations

Here's the 'dashboard description' for the AnVIL workspace

### Introduction

This workspace was produced to illustrate use of **version control with git** to navigate
several aspects of CMG metadata and data.

- https://github.com/vjcitn/CMG_EYE is a github repository with `cmgeye.Rmd` and `fhirinspect.R`.  The following steps
will help you import the content from this github repository into your own AnVIL session/workspace.
	-  use Rstudio's `File/New project/` widget 
![picker](https://storage.googleapis.com/bioc-anvil-images/filepick.png)

to select a version controlled project 

![versioncontrol](https://storage.googleapis.com/bioc-anvil-images/vcpick.png)

with git

![gitpick](https://storage.googleapis.com/bioc-anvil-images/gitpick.png)

Fill in the git widget

![cloner](https://storage.googleapis.com/bioc-anvil-images/cloner2.png)

AnVIL RStudio will run git commands to populate a folder of your workspace's disk

![files](https://storage.googleapis.com/bioc-anvil-images/files2.png)



- make sure BiocStyle and AnVIL have been installed in the R environment before compiling cmgeye.Rmd
- make sure shiny is installed before using fhirinspect.R

### Testing gen3 export

We've used `gen3.theanvil.io/explorer` to request data on 35 subjects from CMG:

![sample request splash](https://storage.googleapis.com/bioc-anvil-images/gen3explorerEye.png)

These were exported to AnVIL via the first tab, leading to a "data view" in this workspace (selecting 'subjects'):

![data view](https://storage.googleapis.com/bioc-anvil-images/cmgEyeSubjects.png)

This data view includes DRS identifiers for CRAM files resulting from WGS.  The phenotypes are variously
annotated, in multiple fields, with terms 'retinitis pigmentosa', 'RETINITIS PIGMENTOSA 69; RP69',
'Joubert syndrome 1'.  OMIM codes are often provided.

We can also use the Gen3 system to generate PFB (portable format for bioinformatics) using the second
tab in the Gen3 explorer page.  This is returned as an Avro file, which can be parsed using sparklyr into
a `spark_tbl` instance.
