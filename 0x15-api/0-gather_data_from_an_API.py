#!/usr/bin/python3
"""
A Script that, uses this REST API, for a given employee ID
, returns list progress
"""

import json
import requests
from sys import argv


if __name__ == "__main__":

    sessionReq = requests.Session()

    ID = argv[1]
    idURL = 'https://jsonplaceholder.typicode.com/users/{}/todos'.format(ID)
    nameURL = 'https://jsonplaceholder.typicode.com/users/{}'.format(ID)

    employee = sessionReq.get(idURL)
    name = sessionReq.get(nameURL)

    json_req = employee.json()
    EMPLOYEE_NAME = name.json()['name']

    TOTAL_NUMBER_OF_TASKS = 0

    for NUMBER_OF_DONE_TASKS in json_req:
        if NUMBER_OF_DONE_TASKS['completed']:
            TOTAL_NUMBER_OF_TASKS += 1

    print("Employee {} is done with tasks({}/{}):".
          format(EMPLOYEE_NAME, TOTAL_NUMBER_OF_TASKS, len(json_req)))

    for NUMBER_OF_DONE_TASKS in json_req:
        if NUMBER_OF_DONE_TASKS['completed']:
            print("\t " + NUMBER_OF_DONE_TASKS.get('title'))
