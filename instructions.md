Instructions for updating the data
===================================
This is a brief (and evolving) description of how to update the data files
for the visualization.

There are three files containing data, each one pertaining to a different
"view" in the visualization as accessed by the dropdown menu. Each of these
files is used independently in the code, which forces redundancy in the
student information in the data files.

Each file contains three components: (1) a list of nodes for students, (2)
a list of nodes specific to the file (e.g., organization nodes in the
organizations file), and (3) links between nodes within that file
(i.e. students and organizations).

For now the `data/qermies.json` file contains a "master" list of student
nodes. Whenever this changes you need to copy those changes to all three of
the data files. Note: this file is not used by the code and is merely a
holder for the data for ease of workflow.

After updating the students (if needed), update the other nodes, copying
the format of previous ones. Due to the setup of the code some of the node
fields are used in stranges ways. This is because we derived the code from
a visualization with a different purpose (artists and songs).

Lastly, update the links which are simply the source and target "id"
fields.

Save and commit the changes and test to see if it worked.

All nodes in all files need to have the same fields. For example:

````
{
    "QERMStudent": true,     // true or false whether a student
    "name": "Cole",          // name in quotes
    "artist": "Q-SAFS",      // basically department of student; used to group
    "id": "cole_qerm_node",  // unique ID string for linking
    "status": "student",     // "student", "alumni", or "NA" for non-student
}
````
