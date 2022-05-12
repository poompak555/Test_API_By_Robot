import os
import sys
import calendar
os.path.abspath(os.getcwd())
sys.path.append(os.getcwd())

from datetime import date
from time import time


def getDate():
    today = date.today()
    dateToday = today.strftime("%Y%m%d")
    dateForUpdate = today.strftime("%Y-%m-%d")
    dateList = [str(dateToday), str(dateForUpdate)]
    return dateList

def getTimeInMilliSec():
    milliseconds = lambda: int(time() * 1000)
    return milliseconds()


def lastDayOfMonth(Year,Month):
    EndOfMonth = calendar.monthrange(Year,Month)[1]
    return EndOfMonth

def lastDayOfMonth_withoutArguments():
    Year = currentyear()
    Month = currentMonth()
    EndOfMonth = calendar.monthrange(Year,Month)[1]
    return EndOfMonth

def currentMonth():
    currentMonth = date.today().month
    return currentMonth
def currentyear():
    currentMonth = date.today().year
    return currentMonth