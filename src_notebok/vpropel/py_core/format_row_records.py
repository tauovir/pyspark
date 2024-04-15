import json

data = [
            {"id": "101", "name": "Mohit Kumar", "city": "Delhi", "country": "India"},
            {"id": "101", "name": "Mohit Kumar", "city": "Mumbai", "country": "India"},
            {"id": "103", "name": "Rahul Sharma", "city": "Pune", "country": "India"}
        ]

def data_format():
    """
    Format list of dictionary od data into below format
    output: {"101": {"first_name": "MOHIT", "last_name": "KUMAR", "address": [{"city": "Delhi", "country": "India"}]}, "103": {"first_name": "RAHUL", "last_name": "SHARMA", "address": [{"city": "Pune", "country": "India"}, {"city": "Pune", "country": "India"}]}}
    """
    records = {}
    for item in data:
        if item['id'] in records:
            temp_dict = records[item['id']]
            addr = {'city': item['city'],'country' : item['country']}
            temp_dict['address'].append(addr)
            records[item['id']] = temp_dict
        else:
            temp_dict = {
                "first_name" : item['name'].split(' ')[0],'last_name' : item['name'].split(' ')[1],
                "address" : [{'city': item['city'],'country' : item['country']}]
            }
            records[item['id']] = temp_dict

    return json.dumps(records)



print(data_format())

