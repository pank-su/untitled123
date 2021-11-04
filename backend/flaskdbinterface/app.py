import hashlib
import json
import sqlite3

from flask import Flask, request
from flask_cors import CORS
from flask_restful import Api, Resource

app = Flask(__name__)
CORS(app)
api = Api(app)


class DatabaseSelect(Resource):
    querys = ["dishes", "employees", "orders", "branchs", "positions"]

    def post(self):
        query = json.loads(request.get_data())["query"]
        if query == "get_user":
            who = json.loads(request.get_data())["login"]
            with sqlite3.connect("superdb.db") as con:
                cur = con.cursor()
                return cur.execute("SELECT * FROM clients WHERE login = ?", (who,)).fetchall()[0]
        with sqlite3.connect("superdb.db") as con:
            cur = con.cursor()
            return cur.execute("SELECT * FROM " + query).fetchall()


class Login(Resource):
    def post(self):
        json_ = json.loads(request.get_data())
        login, password = json_["login"], hashlib.md5(json_["password"].encode('utf-8')).hexdigest()
        with sqlite3.connect("secret_db.db") as con:
            cur = con.cursor()
            try:
                return cur.execute('SELECT password FROM "login&password" WHERE login = ?',
                                   (login,)).fetchall()[0][0] == password
            except IndexError:
                return False


class Register(Resource):
    def post(self):
        json_ = json.loads(request.get_data())
        login, email, password, telephone = json_["login"], json_["email"], hashlib.md5(
            json_["password"].encode('utf-8')).hexdigest(), json_["telephone"]
        print(login, email, password, telephone)
        with sqlite3.connect("secret_db.db") as con:
            cur = con.cursor()
            cur.execute(f'''INSERT INTO "login&password"(login, password) VALUES (?, ?)''',
                        (login, password))
            con.commit()
        with sqlite3.connect("superdb.db") as con:
            cur = con.cursor()
            cur.execute('''INSERT INTO clients(login, telephone, email) VALUES (?, ?, ?)''',
                        (login, telephone, email))
            con.commit()
        return True


api.add_resource(DatabaseSelect, '/')
api.add_resource(Login, '/login')
api.add_resource(Register, '/reg')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=4567)
