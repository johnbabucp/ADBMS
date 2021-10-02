from pprint import pprint
from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")

db=client["Medical_DB"]
my_collection= db["patient_data"]
patient_record = {
    "Name" : "Bibin",
    "Age" : 22,
    "Sex" : "M",
    "Blood pressure":[{"sys":156},{"dia":82}],
    "Heart rate" : 83
}
my_collection.insert_one(patient_record)
print("DATA")
for item in my_collection.find():
    pprint(item)