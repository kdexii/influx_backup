import os
from influxdb import InfluxDBClient
from random import choice
from string import ascii_uppercase
import random

def connection():

    conn = InfluxDBClient(host='localhost',port=8086)
    return conn
def writeData(conn):
    count = -1

    while count <= 50:
        count = count + 1
        string = ''.join(choice(ascii_uppercase) for i in range(12))
        value = random.randint(1,27)
        data = f'testData,name={string} value={value}'

        conn.write_points(data,database='test3', protocol='line')
conn = connection()
writeData(conn)