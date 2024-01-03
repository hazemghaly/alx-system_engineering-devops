#!/usr/bin/python3
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

    TOTAL_NUMBER_OF_TASKS = 0

    for NUMBER_OF_DONE_TASKS in json_req:
        if NUMBER_OF_DONE_TASKS['completed']:
            TOTAL_NUMBER_OF_TASKS += 1

    # Example.csv gets created in the current working directory
    with open(ID + ".csv", "w", newline='') as csvfile:
        my_writer = csv.writer(csvfile, delimiter=',')
        for i in json_req:
            my_writer.writerow(
                [ID, EMPLOYEE_NAME, i.get('completed'), i.get('title')])
