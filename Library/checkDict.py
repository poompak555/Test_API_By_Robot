
def checkDict(dict):
    for x in dict:
        if(dict[x] == 'null'):
            dict[x] = None
        elif(dict[x] == 'True'):
            dict[x] = True
        elif(dict[x] == 'true'):
            dict[x] = True
        elif(dict[x] == 'False'):
            dict[x] = False
        elif(dict[x] == 'false'):
            dict[x] = False
        elif(dict[x] == 'None'):
            dict[x] = ''
    return dict