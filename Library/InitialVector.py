import shortuuid

#from History import globalVariable


def get_IV():
    iv = shortuuid.random(length=20)
#    globalVariable.IV = iv
    return iv