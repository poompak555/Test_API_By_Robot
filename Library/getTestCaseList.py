from robot.running import TestSuiteBuilder
from robot.model import SuiteVisitor
import unittest 



class TestCasesFinder(SuiteVisitor):
    def __init__(self):
        self.tests = []
        

    def visit_test(self, test):
        self.tests.append(test)


class KWFinder(SuiteVisitor):
    def __init__(self):
        self.KWs = []

    def visit_keyword(self, kw):
        self.KWs.append(kw)

class MsgFinder(SuiteVisitor):
    def __init__(self):
        self.Msgs = []

    def visit_message(self, msg):
        self.Msgs.append(msg)


        
builder = TestSuiteBuilder()
testsuite = builder.build('D:\Test_API_Robot\TestSuite')
finder = KWFinder()
testsuite.visit(finder)
# print(*finder.tests)
#print(*finder.tests)
list_Name = finder.KWs
KW_Count = 0
#Skip_Str = {"config","log","logCountTestCase","userSignOn","set global variable"}
Skip_Str = {"config","log","set global variable","Get Current Date","get substring","Get File",
            "set variable","Query","convert to string","execute sql string","Disconnect From Database"}
#userSignOnSupApproved

f = open("TCname.txt", "w",encoding="utf-8")
for i in list_Name:
    Split_txt = str(i).split("    ")
    Split_txt.append("SmartTeller")
    if (Split_txt[0] not in Skip_Str) and (Split_txt[1] not in Skip_Str):
        f.write(str(i) + "\n")
        KW_Count += 1
f.close()

print(str(KW_Count) + " Testcases")
fc = open("TCcount.txt", "w",encoding="utf-8")
fc.write(str(KW_Count) + " Testcases")
fc.close()

# suite = unittest.TestSuite()
# suite.addTest(unittest.defaultTestLoader.loadTestsFromTestCase('UserProfile'))
# # suite.addTest(unittest.defaultTestLoader.loadTestsFromTestCase(module2))
# print(suite.countTestCases())
# for test in suite:             # Also tried with suite.__iter__()
#     # Do something with test
#     print(test.__class__)




