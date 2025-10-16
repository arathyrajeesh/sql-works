create database workson; 
use workson;

CREATE TABLE dept (
    dno      VARCHAR(3)  NOT NULL,
    dname    VARCHAR(20) NOT NULL,
    mgreno   INT,
    PRIMARY KEY (dno)
);

CREATE TABLE emp (eno INT NOT NULL,ename VARCHAR(50) NOT NULL,bdate DATE,title VARCHAR(20),salary NUMERIC(10, 2),dno VARCHAR(3),PRIMARY KEY (eno),FOREIGN KEY (dno) REFERENCES dept(dno));

CREATE TABLE proj (
    pno      INT         NOT NULL,
    pname    VARCHAR(50) NOT NULL,
    budget   NUMERIC(12, 2),
    dno      VARCHAR(3),
    PRIMARY KEY (pno),
    FOREIGN KEY (dno) REFERENCES dept(dno)
);
CREATE TABLE workson (
    eno      INT         NOT NULL,
    pno      INT         NOT NULL,
    resp     VARCHAR(20),
    hours    NUMERIC(5, 2),
    PRIMARY KEY (eno, pno),
    FOREIGN KEY (eno) REFERENCES emp(eno),
    FOREIGN KEY (pno) REFERENCES proj(pno)
);
INSERT INTO dept (dno, dname, mgreno) VALUES ('D1', 'Consulting', 1001);
INSERT INTO dept (dno, dname, mgreno) VALUES ('D2', 'Development', 1002);
INSERT INTO dept (dno, dname, mgreno) VALUES ('D3', 'Research', 1003);

INSERT INTO emp (eno, ename, bdate, title, salary, dno) VALUES (1001, 'Alice', '1980-03-10', 'Manager', 85000, 'D1');
INSERT INTO emp (eno, ename, bdate, title, salary, dno) VALUES (1002, 'Bob', '1985-07-14', 'EE', 40000, 'D2');
INSERT INTO emp (eno, ename, bdate, title, salary, dno) VALUES (1003, 'Charlie', '1990-01-20', 'SA', 37000, 'D1');
INSERT INTO emp (eno, ename, bdate, title, salary, dno) VALUES (1004, 'David', '1988-09-12', 'EE', 32000, 'D3');
INSERT INTO emp (eno, ename, bdate, title, salary, dno) VALUES (1005, 'Eve', '1992-11-05', 'Manager', 90000, 'D2');

INSERT INTO proj (pno, pname, budget, dno) VALUES (501, 'Alpha', 120000, 'D1');
INSERT INTO proj (pno, pname, budget, dno) VALUES (502, 'Beta', 45000, 'D2');
INSERT INTO proj (pno, pname, budget, dno) VALUES (503, 'Gamma', 75000, 'D3');
INSERT INTO proj (pno, pname, budget, dno) VALUES (504, 'Delta', 200000, 'D1');

INSERT INTO workson (eno, pno, resp, hours) VALUES (1001, 501, 'Manager', 15);
INSERT INTO workson (eno, pno, resp, hours) VALUES (1002, 502, 'Developer', 8);
INSERT INTO workson (eno, pno, resp, hours) VALUES (1003, 501, 'Consultant', 12);
INSERT INTO workson (eno, pno, resp, hours) VALUES (1004, 503, 'Tester', 9);
INSERT INTO workson (eno, pno, resp, hours) VALUES (1005, 504, 'Manager', 18);

SELECT pno, pname FROM proj WHERE budget > 100000;
SELECT eno, pno, resp, hours FROM workson WHERE hours < 10 and resp = 'Manager';
SELECT eno, ename FROM emp WHERE (title = 'EE' OR title = 'SA') AND salary > 35000;
SELECT ename FROM emp WHERE dno = 'D1' ORDER BY salary DESC;
SELECT dno, dname, mgreno FROM dept ORDER BY dname ASC;
SELECT E.ename, D.dname, E.title FROM emp E JOIN dept D ON E.dno = D.dno;
SELECT P.pname, W.hours, W.pno FROM workson W JOIN proj P ON W.pno = P.pno WHERE W.hours > 10;
SELECT P.pname, D.dname, P.budget FROM proj P JOIN dept D ON P.dno = D.dno WHERE P.budget < 50000;
SELECT E.eno, E.salary FROM emp E JOIN dept D ON E.dno = D.dno WHERE D.dname = 'Consulting' ORDER BY E.salary DESC;
SELECT E.ename, P.pname, E.title, W.hours FROM workson W JOIN emp E ON W.eno = E.eno JOIN proj P ON W.pno = P.pno;