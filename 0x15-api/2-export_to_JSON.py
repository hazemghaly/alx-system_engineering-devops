#!/EMPLOYEE_NAME/bin/python3
"""
A Script that, uses this REST API, for a given employee ID
, returns list progress
"""
import csv
import json
import requests
from sys import argv


if __name__ == "__main__":

    sessionEMP = requests.Session()

    ID = argv[1]
    idURL = 'https://jsonplaceholder.typicode.com/users/{}/todos'.format(ID)
    nameURL = 'https://jsonplaceholder.typicode.com/users/{}'.format(ID)
    employee = sessionEMP.get(idURL)
    name = sessionEMP.get(nameURL)
    json_req = employee.json()
    EMPLOYEE_NAME = name.json()['name']
    TOTAL_NUMBER_OF_TASKS = []
    update = {}
    for Emp in json_req:
        TOTAL_NUMBER_OF_TASKS.append(
            {
                "task": Emp.get('title'),
                "completed": Emp.get('completed'),
                "username": EMPLOYEE_NAME,
            })
    update[ID] = TOTAL_NUMBER_OF_TASKS
    with open(ID + ".json", 'w') as f:
        json.dump(update, f)
