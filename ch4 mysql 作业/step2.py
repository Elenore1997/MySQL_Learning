#encoding:utf-8
import sys
import MySQLdb
import os

reload(sys)
sys.setdefaultencoding('utf-8')


#is判断是不是同一个对象； ==是值相同

if __name__ == '__main__':
    conn = MySQLdb.connect(
        host='localhost',
        port=3306,
        user='root',
        passwd='sincejune1997.',
        charset='utf8',
        db='university'
    )
    cur = conn.cursor()

    # #因为department表中的budget为int型数据，所以要做类型转换
    # def prc_line(line):
    #     _result = line.decode("utf-8").strip().split(" ")
    #     _result[2] = int(_result[2])
    #     return _result
    #
    # #插入department数据操作
    # with open("/home/mark/Documents/树蛙/MySQL上课文件/作业/university/department.txt","r") as f:
    #     datas = [prc_line(line) for line in f.readlines()]
    # # print datas
    #
    # for data in datas:
    #     cur.execute("insert into department(dept_name, building, budget) values('%s','%s',%d)"%(data[0],data[1],data[2]))
    # conn.commit()
    #
    # def prc_line1(line):
    #     _result = line.decode("utf-8").strip().split(" ")
    #     _result[0] = int(_result[0])
    #     _result[3] = int(_result[3])
    #     return _result
    #
    # with open("/home/mark/Documents/树蛙/MySQL上课文件/作业/university/student.txt","r") as f:
    #     datas = [prc_line1(line) for line in f.readlines()]
    # #   print datas
    # for data in datas:
    #     cur.execute("insert into student(ID, name, sex, age, emotion_state, dept_name) values(%d,'%s','%s', %d, '%s', '%s')"%(data[0],data[1],data[2],data[3],data[4],data[5]))


    def prc_line2(line):
        _result = line.decode("utf-8").strip().split(" ")
        _result[0] = int(_result[0])
        _result[2] = int(_result[2])
        return _result

    with open("/home/mark/Documents/树蛙/MySQL上课文件/作业/university/exam.txt","r") as f:
        datas = [prc_line2(line) for line in f.readlines()]
        # print datas
    for data in datas:
        cur.execute("insert into exam(student_ID, exam_Name, grade) values(%d, '%s', %d)"%(data[0],data[1],data[2]))

    conn.commit()



    cur.close()    # 关闭游标
    conn.close()   # 断开连接
