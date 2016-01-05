Instructions for updating the data
===================================
This is a brief (and evolving) description of how to update the data files
for the visualization.

There are three files containing data, each one pertaining to a different
"view" in the visualization as accessed by the dropdown menu. Each of these
files is used independently in the code, which forces redundancy in the
student information (nodes) in the data files.

Each file contains three components: (1) a list of nodes for students, (2)
a list of nodes specific to the file (e.g., collaboration nodes in the
collaborations file), and (3) links between nodes within that file
(i.e. students and collaborations). The visualization uses javascript so we
use .json files. For ease of updating/checking/etc. we house the data in
.csv files and then use R to process those into the input files.

For now the `data/student_nodes.csv` file contains a "master" list of student
nodes, and it is appended to the other nodes in the R script.

Updating data is as simple as altering the csv files and then running the
script (hopefully!). There is some error checking in the R file but it's
currently very limited. It might be a good idea to test whether the file is
valid by pasting it into an [online syntax checker](http://jsonlint.com/)
before trying to load the HTML.

Save the changes and test the code to see if it worked. Then commit and
push to the repo.

All nodes in all files need to have the same fields. For example:

````
{
    "QERMStudent": true,     // true or false whether a student
    "name": "Cole",          // name in quotes
    "group": "SAFS",        // basically department; used to group
    "id": "cole_monnahan",   // unique ID string for linking
    "status": "student"      // "student", "alumni", or "NA" for non-student
}
````
