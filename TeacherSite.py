#!/usr/bin/env python

#-------------------------------------------------------------------
# run.py
# Author: Kevin Kim
#-------------------------------------------------------------------

import os
import flask
import urllib
#import database
#import auth
# -------------------------------------------------------------------

app = flask.Flask(__name__, template_folder='static/templates')
app.secret_key = os.environ['APP_SECRET_KEY']

# -------------------------------------------------------------------

# Index/homepage
@app.route('/', methods=['GET'])
@app.route('/index', methods=['GET'])
def index():
    html_code = flask.render_template('index.html')
    response = flask.make_response(html_code)
    return response

# Former Students 
@app.route('/former_students', methods=['GET'])
def former_students():
    html_code = flask.render_template('former_students.html')
    response = flask.make_response(html_code)
    return response

if __name__ == '__main__':
    app.run(debug=True, port=5001)
