import pandas as pd
import numpy as np
import json

adjmatrix = pd.read_csv("QERMConnections.csv", index_col="origin")

graphdata = {"nodes": [], "links": []}
linksByID = []

for source, targets in adjmatrix.iterrows():
    sourceID= adjmatrix.index.get_loc(source)
    graphdata["nodes"].append(
        {
            "name": source,
            "id": sourceID
        }
    )
    for targetID in range(len(targets)):
        if not np.isnan(targets[targetID]):
            linksByID.append([sourceID,targetID])
            if (targetID != sourceID) and not ([targetID,sourceID] in linksByID):
                # ensure not self-reference and not a duplication (links are undirected)
                graphdata["links"].append(
                    {
                        "source": sourceID,
                        "target": targetID
                    }
                )
with open("qermConns.json", "w") as outputFile:
    json.dump(graphdata, outputFile)
outputFile.closed