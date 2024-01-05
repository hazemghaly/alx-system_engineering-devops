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
    USER = (requests.get("https://jsonplaceholder.typicode.com/users")).json()
    todos = (requests.get('https://jsonplaceholder.typicode.com/todos')).json()
    TODO = {}
    for user in USER:
        TOTAL_NUMBER_OF_TASKS = []
        for task in todos:
            if task.get('userId') == user.get('id'):
                taskDict = {"username": user.get('username'),
                            "task": task.get('title'),
                            "completed": task.get('completed')}
                TOTAL_NUMBER_OF_TASKS.append(taskDict)
        TODO[user.get('id')] = TOTAL_NUMBER_OF_TASKS
    with open('todo_all_employees.json', mode='w') as f:
        json.dump(TODO, f)
