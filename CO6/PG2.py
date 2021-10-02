from pprint import pprint
from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")

db=client["Medical_DB"]
my_collection= db["patient_data"]
patient_records =[
{
    "Name" : "Jaison",
    "Age" : 22,
    "Sex" : "M",
    "Blood pressure":[{"sys":154},{"dia":72}],
    "Heart rate" : 84
},
{
    "Name" : "Anto",
    "Age" : 23,
    "Sex" : "M",
    "Blood pressure":[{"sys":174},{"dia":42}],
    "Heart rate" : 88
},
 {
    "Name" : "Elvin",
    "Age" : 3,
    "Sex" : "F",
    "Blood pressure":[{"sys":144},{"dia":52}],
    "Heart rate" : 82
 },
{
    "Name" : "Paulvin",
    "Age" : 21,
    "Sex" : "M",
    "Blood pressure":[{"sys":144},{"dia":52}],
    "Heart rate" : 82
 },
{
    "Name" : "Alen",
    "Age" : 20,
    "Sex" : "F",
    "Blood pressure":[{"sys":144},{"dia":52}],
    "Heart rate" : 82
 },
{
    "Name" : "Rahul",
    "Age" : 23,
    "Sex" : "F",
    "Blood pressure":[{"sys":144},{"dia":52}],
    "Heart rate" : 82
 }
]
my_collection.insert_many(patient_records)
print("DATA")
for item in my_collection.find():
    pprint(item)