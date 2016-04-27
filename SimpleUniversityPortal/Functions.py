from datetime import date, datetime
import MySQLdb
import sys

def add_student(name, email, Registration_Date, Phone_Number, Address, Department):
    print 'added student'
    parameters = (s_name, s_email, s_registration_date, s_phone_number, s_address, s_department)
    query = ("INSERT INTO students (Name, Email, Registration_Date, Phone_Number, Address, Department) VALUES (%s, %s, %s, %s, %s, %s)")
    execute(query, parameters)

def remove_student(sid):
    print 'removed student'
    parameters = (sid,)
    query = "DELETE FROM Students WHERE SID = %s"
    execute(query, parameters)

def add_instructor(name, email, department, room):
    print 'added instructor'
    parameters = (i_name, i_email, i_department, i_room)
    query = ("INSERT INTO Instructors (Name, Email, Department, Room) VALUES (%s, %s, %s, %s)")
    execute(query, parameters)

def remove_instructor(iid):
    print 'removed instructor'
    parameters = (iid,)
    query = ("DELETE FROM Instructors WHERE IID = %s")
    execute(delete_instructor, instructor_data)

def add_course(name, credits, instructor, department):
    print 'added course'
    parameters = (c_name, credits, instructor, department)
    query = ("INSERT INTO Courses (Name, Credits, Instructor, Department) VALUES (%s, %s, %s, %s)")
    execute(query, parameters)

def remove_course(cid):
    print 'removed course'
    parameters = (cid,)
    query = ("DELETE FROM Courses WHERE CID = %s")
    execute(query, parameters)

def class_list(cid):
    print 'showing the list'
    parameters = (cid,)
    query = ("SELECT Students.SID, Students.Name FROM Courses_Taken INNER JOIN Students ON Courses_Taken.SID = Students.SID WHERE Courses_Taken.CID = %s")
    result = execute(query,parameters)
    for row in result:
        print row

def update_address(sid, address):
    print 'updated address'
    parameters = (address, sid)
    query = ("UPDATE Students SET Address = %s WHERE SID = %s")
    execute(query, parameters)

def update_email(sid, email):
    print 'updated contact info'
    parameters = (sid, email)
    query = ("UPDATE Students SET Email = %d WHERE SID = %s")
    execute(query, parameters)

def update_phonenumber (sid, phonenumber):
    print 'updated phone number'
    parameters = (phonenumber, sid)
    query = ("UPDATE Students SET Phone_Number = %s WHERE SID = %s")
    execute(query, parameters)

def move_instructor (iid, room):
    print 'moved the instructor to another room'
    parameters = (room, iid)
    query = ("UPDATE Instructors SET Room= %s WHERE IID = %s")
    execute(query, parameters)

def execute(query, parameters):
    db = MySQLdb.connect(host="localhost", user="root", passwd="hm1345791240", db="University")
    cursor = db.cursor()
    cursor.execute(query, parameters)
    result = cursor.fetchall()
    db.commit()
    cursor.close()
    db.close()
    return result

operation = sys.argv[1]

if operation == 'add_student':
    s_name = sys.argv[2]
    s_email = sys.argv[3]
    s_registration_date = sys.argv[4]
    s_phone_number = sys.argv[5]
    s_address = sys.argv[6]
    s_department = sys.argv[7]
    add_student(s_name, s_email, s_registration_date, s_phone_number, s_address, s_department)
elif operation == 'remove_student':
    sid = sys.argv[2]
    remove_student(sid)
elif operation == 'add_instructor':
    i_name = sys.argv[2]
    i_email = sys.argv[3]
    i_department = sys.argv[4]
    i_room = sys.argv[5]
    add_instructor(i_name, i_email, i_department, i_room)
elif operation == 'remove_instructor':
    iid = sys.argv[2]
    remove_instructor(iid)
elif operation == 'add_course':
    c_name = sys.argv[2]
    credits = sys.argv[3]
    instructor = sys.argv[4]
    department = sys.argv[5]
    add_course(c_name, credits, instructor, department)
elif operation == 'remove_course':
    cid = sys.argv[2]
    remove_course(cid)
elif operation == 'class_list':
    cid = sys.argv[2]
    class_list(cid)
elif operation == 'update_address':
    sid = sys.argv[2]
    address = sys.argv[3]
    update_address(sid, address)
elif operation == 'update_email':
    sid = sys.argv[2]
    email = sys.argv[3]
    update_email(sid, email)
elif operation == 'update_phonenumber':
    sid = sys.argv[2]
    phonenumber = sys.argv[3]
    update_phonenumber(sid, phonenumber)
elif operation == 'move_instructor':
    iid = sys.argv[2]
    room = sys.argv[3]
    move_instructor(iid, room)

else:
    print 'error: unexpected operation'
