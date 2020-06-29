import xml.etree.ElementTree as ET
import pandas as pd

tree = ET.parse("museums-and-galleries-1.xml")
root = tree.getroot()

get_range = lambda col: range(len(col))
l = [{r[i].tag: r[i].text for i in get_range(r)} for r in root]

df = pd.DataFrame.from_dict(l)
df.to_csv("file.csv")

