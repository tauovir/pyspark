import json

data = [
    {"fname": "Rahul", "lname": "Kumar", "gender": "M", "salary": 10000, "bonus": 1000, "deduction": 500},
    {"fname": "Taukir", "lname": "Khan", "gender": "M", "salary": 12000, "bonus": 2000},
    {"fname": "Pooja", "lname": "Sharma", "gender": "F", "salary": 15000, "bonus": 3000, "deduction": 2000}
]

def data_format():
    """
    Format list of dictionary od data into below format
    output:
     [
    {"name": "Rahul Kumar",  "gender": "Male", "total_salary": 10500},
    {"name": "Taukir Khan", "gender": "Male", "total_salary": 14000},
    {"name": "Pooja Sharma","gender": "Female", "total_salary": 16000}
    ]
    """
    pass


def data_format_implemented():
    """
    Format list of dictionary od data into below format
    output:
     [
    {"name": "Rahul Kumar",  "gender": "Male", "total_salary": 10500},
    {"name": "Taukir Khan", "gender": "Male", "total_salary": 14000},
    {"name": "Pooja Sharma","gender": "Female", "total_salary": 16000}
]
    """
    response = []
    for row in data:
        temp = {
            "name": row['fname'] + " " + row['lname'],
            "gender": 'Male' if row['gender'] == 'M' else 'Female',
            "total_salary": row['salary'] + row['bonus'] - row.get('deduction', 0)
        }
        response.append(temp)
    return json.dumps(response)

def data_format_implemented2():
    """
    Format list of dictionary od data into below format
    output:
     [
    {"name": "Rahul Kumar",  "gender": "Male", "total_salary": 10500},
    {"name": "Taukir Khan", "gender": "Male", "total_salary": 14000},
    {"name": "Pooja Sharma","gender": "Female", "total_salary": 16000}
]
    """
    response = []
    for row in data:
        temp = {
            "name": row['fname'] + " " + row['lname'],
            "gender": 'Male' if row['gender'] == 'M' else 'Female',
            "total_salary": row['salary'] + row['bonus'] - row.get('deduction', 0)
        }
        response.append(temp)
    return json.dumps(response)


print(data_format())